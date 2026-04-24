import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

import 'package:cashier_portal/features/billing/domain/repositories/billing_repository.dart';
import 'package:cashier_portal/features/billing/presentation/bloc/billing_event.dart';
import 'package:cashier_portal/features/billing/presentation/bloc/billing_state.dart';

/// BLoC responsible for managing the state of the Billing Dashboard.
///
/// It coordinates real-time data streaming from the [BillingRepository]
/// and handles order selection and payment processing.
class BillingBloc extends Bloc<BillingEvent, BillingState> {
  final BillingRepository repository;
  StreamSubscription? _queueSubscription;

  BillingBloc({required this.repository}) : super(BillingInitial()) {
    on<LoadBillingQueue>(_onLoadBillingQueue);
    on<SelectOrderEvent>(_onSelectOrder);
    on<SelectPaymentMethodEvent>(_onSelectPaymentMethod);
    on<SearchQueryChanged>(_onSearchQueryChanged);
    on<UpdateAmountTendered>(_onUpdateAmountTendered);
    on<ProcessPaymentEvent>(_onProcessPayment);
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
          return currentState.copyWith(orders: orders);
        }

        return BillingLoaded(
          orders: orders,
          selectedOrderId: orders.isNotEmpty ? orders.first.id : null,
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
      emit(currentState.copyWith(selectedOrderId: event.orderId));
    }
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
        await repository.processPayment(
          orderId: currentOrder.id,
          method: currentState.selectedPaymentMethod,
        );
      } catch (e) {
        emit(BillingError('Payment failed: ${e.toString()}'));
      }
    }
  }

  @override
  Future<void> close() {
    _queueSubscription?.cancel();
    return super.close();
  }
}
