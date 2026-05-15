import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

import 'package:cashier_portal/features/billing/domain/repositories/billing_repository.dart';
import 'package:cashier_portal/features/billing/presentation/bloc/billing_event.dart';
import 'package:cashier_portal/features/billing/presentation/bloc/billing_state.dart';
import 'package:cashier_portal/features/billing/domain/repositories/receipt_printing_repository.dart';

/// BLoC responsible for managing the state of the Billing Dashboard.
///
/// It coordinates real-time data streaming from the [BillingRepository]
/// and handles order selection and payment processing.
class BillingBloc extends Bloc<BillingEvent, BillingState> {
  final BillingRepository repository;
  final ReceiptPrintingRepository printingRepository;
  StreamSubscription? _queueSubscription;

  static const mockRestaurant = RestaurantModel(
    name: 'RMS Premium Dine',
    address: '123 Culinary Street, Foodie City',
    phone: '+1 234 567 890',
    email: 'contact@rmsdine.com',
    fssaiNumber: '12345678901234',
    gstin: '27AAAAA0000A1Z5',
    cgstRate: 2.5,
    sgstRate: 2.5,
  );

  BillingBloc({required this.repository, required this.printingRepository})
    : super(BillingInitial()) {
    on<LoadBillingQueue>(_onLoadBillingQueue);
    on<SelectOrderEvent>(_onSelectOrder);
    on<SelectPaymentMethodEvent>(_onSelectPaymentMethod);
    on<SearchQueryChanged>(_onSearchQueryChanged);
    on<UpdateAmountTendered>(_onUpdateAmountTendered);
    on<ProcessPaymentEvent>(_onProcessPayment);
    on<PrintOrderEvent>(_onPrintOrder);
  }

  /// Initiates the real-time stream of orders from the repository.
  Future<void> _onLoadBillingQueue(
    LoadBillingQueue event,
    Emitter<BillingState> emit,
  ) async {
    emit(BillingLoading());

    await _queueSubscription?.cancel();

    // Subscribe to the real-time order stream
    await emit.forEach<List<OrderModel>>(
      repository.getBillingQueue(),
      onData: (orders) {
        if (state is BillingLoaded) {
          final currentState = state as BillingLoaded;
          final updatedOrders = orders;
          BillModel? updatedBill = currentState.selectedBill;

          // Update bill if the selected order is in the new list
          if (currentState.selectedOrderId != null) {
            try {
              final selectedOrder = updatedOrders.firstWhere(
                (o) => o.id == currentState.selectedOrderId,
              );
              updatedBill = _getBillForOrder(selectedOrder);
            } catch (_) {
              updatedBill = null;
            }
          }

          return currentState.copyWith(
            orders: updatedOrders,
            selectedBill: updatedBill,
          );
        }

        final firstOrder = orders.isNotEmpty ? orders.first : null;
        return BillingLoaded(
          orders: orders,
          selectedOrderId: firstOrder?.id,
          selectedBill: firstOrder != null ? _getBillForOrder(firstOrder) : null,
          selectedPaymentMethod: PaymentMethod.card,
        );
      },
      onError: (error, stackTrace) {
        return BillingError(
          'Failed to sync billing queue: ${error.toString()}',
        );
      },
    );
  }

  /// Updates the currently selected order in the UI.
  void _onSelectOrder(SelectOrderEvent event, Emitter<BillingState> emit) {
    if (state is BillingLoaded) {
      final currentState = state as BillingLoaded;
      try {
        final selectedOrder = currentState.orders.firstWhere(
          (o) => o.id == event.orderId,
        );
        emit(
          currentState.copyWith(
            selectedOrderId: event.orderId,
            selectedBill: _getBillForOrder(selectedOrder),
          ),
        );
      } catch (_) {
        emit(currentState.copyWith(selectedOrderId: event.orderId));
      }
    }
  }

  BillModel _getBillForOrder(OrderModel order) {
    return BillModel.fromOrder(
      billId: 'BILL-${order.id.split('-').last.toUpperCase()}',
      order: order,
      restaurant: mockRestaurant,
    );
  }

  /// Updates the desired payment method for the current order.
  void _onSelectPaymentMethod(
    SelectPaymentMethodEvent event,
    Emitter<BillingState> emit,
  ) {
    if (state is BillingLoaded) {
      final currentState = state as BillingLoaded;
      // Reset amount tendered when switching payment methods
      emit(
        currentState.copyWith(
          selectedPaymentMethod: event.method,
          amountTendered: null,
        ),
      );
    }
  }

  /// Updates the search query to filter the order queue.
  void _onSearchQueryChanged(
    SearchQueryChanged event,
    Emitter<BillingState> emit,
  ) {
    if (state is BillingLoaded) {
      final currentState = state as BillingLoaded;
      emit(currentState.copyWith(searchQuery: event.query));
    }
  }

  /// Updates the amount tendered for cash payments.
  void _onUpdateAmountTendered(
    UpdateAmountTendered event,
    Emitter<BillingState> emit,
  ) {
    if (state is BillingLoaded) {
      final currentState = state as BillingLoaded;
      emit(currentState.copyWith(amountTendered: event.amount));
    }
  }

  /// Executes the payment process for the selected order.
  void _onProcessPayment(
    ProcessPaymentEvent event,
    Emitter<BillingState> emit,
  ) async {
    if (state is BillingLoaded) {
      final currentState = state as BillingLoaded;
      final currentOrder = currentState.selectedOrder;

      if (currentOrder == null) return;

      try {
        // Trigger printing before or as part of proceeding the bill
        // In many POS systems, the receipt is printed as the payment is confirmed.
        await printingRepository.printReceipt(currentOrder, direct: true);

        await repository.processPayment(
          order: currentOrder,
          method: currentState.selectedPaymentMethod,
        );
      } catch (e) {
        emit(BillingError('Payment or Printing failed: ${e.toString()}'));
      }
    }
  }

  /// Manually triggers a bill print for the given order.
  Future<void> _onPrintOrder(
    PrintOrderEvent event,
    Emitter<BillingState> emit,
  ) async {
    try {
      await printingRepository.printReceipt(event.order);
    } catch (e) {
      // We don't want to block the UI for a manual print failure,
      // but we could emit a transient error state if needed.
    }
  }

  @override
  Future<void> close() {
    _queueSubscription?.cancel();
    return super.close();
  }
}
