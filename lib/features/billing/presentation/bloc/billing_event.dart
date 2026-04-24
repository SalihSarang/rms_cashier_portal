import 'package:equatable/equatable.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

abstract class BillingEvent extends Equatable {
  const BillingEvent();

  @override
  List<Object?> get props => [];
}

class LoadBillingQueue extends BillingEvent {}

class SelectOrderEvent extends BillingEvent {
  final String orderId;

  const SelectOrderEvent(this.orderId);

  @override
  List<Object> get props => [orderId];
}

class SelectPaymentMethodEvent extends BillingEvent {
  final PaymentMethod method;

  const SelectPaymentMethodEvent(this.method);

  @override
  List<Object> get props => [method];
}

class ProcessPaymentEvent extends BillingEvent {}

class SearchQueryChanged extends BillingEvent {
  final String query;

  const SearchQueryChanged(this.query);

  @override
  List<Object> get props => [query];
}

class UpdateAmountTendered extends BillingEvent {
  final double amount;

  const UpdateAmountTendered(this.amount);

  @override
  List<Object> get props => [amount];
}
