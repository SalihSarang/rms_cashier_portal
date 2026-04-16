import 'package:equatable/equatable.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

abstract class BillingState extends Equatable {
  const BillingState();

  @override
  List<Object?> get props => [];
}

class BillingInitial extends BillingState {}

class BillingLoading extends BillingState {}

class BillingLoaded extends BillingState {
  final List<OrderModel> orders;
  final String? selectedOrderId;
  final PaymentMethod selectedPaymentMethod;

  const BillingLoaded({
    required this.orders,
    this.selectedOrderId,
    required this.selectedPaymentMethod,
  });

  OrderModel? get selectedOrder {
    try {
      return orders.firstWhere((order) => order.id == selectedOrderId);
    } catch (_) {
      return null;
    }
  }

  BillingLoaded copyWith({
    List<OrderModel>? orders,
    String? selectedOrderId,
    PaymentMethod? selectedPaymentMethod,
  }) {
    return BillingLoaded(
      orders: orders ?? this.orders,
      selectedOrderId: selectedOrderId ?? this.selectedOrderId,
      selectedPaymentMethod:
          selectedPaymentMethod ?? this.selectedPaymentMethod,
    );
  }

  @override
  List<Object?> get props => [orders, selectedOrderId, selectedPaymentMethod];
}

class BillingError extends BillingState {
  final String message;

  const BillingError(this.message);

  @override
  List<Object> get props => [message];
}
