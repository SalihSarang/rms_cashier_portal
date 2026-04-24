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
  final String searchQuery;
  final double? amountTendered;

  const BillingLoaded({
    required this.orders,
    this.selectedOrderId,
    required this.selectedPaymentMethod,
    this.searchQuery = '',
    this.amountTendered,
  });

  OrderModel? get selectedOrder {
    try {
      return orders.firstWhere((order) => order.id == selectedOrderId);
    } catch (_) {
      return null;
    }
  }

  List<OrderModel> get filteredOrders {
    if (searchQuery.trim().isEmpty) return orders;

    final query = searchQuery.trim().toLowerCase();
    return orders.where((order) {
      final orderIdMatch = order.id.toLowerCase().contains(query);
      final tableIdMatch = order.tableId.toLowerCase().contains(query);
      return orderIdMatch || tableIdMatch;
    }).toList();
  }

  BillingLoaded copyWith({
    List<OrderModel>? orders,
    String? selectedOrderId,
    PaymentMethod? selectedPaymentMethod,
    String? searchQuery,
    double? amountTendered,
  }) {
    return BillingLoaded(
      orders: orders ?? this.orders,
      selectedOrderId: selectedOrderId ?? this.selectedOrderId,
      selectedPaymentMethod:
          selectedPaymentMethod ?? this.selectedPaymentMethod,
      searchQuery: searchQuery ?? this.searchQuery,
      amountTendered: amountTendered ?? this.amountTendered,
    );
  }

  @override
  List<Object?> get props => [
    orders,
    selectedOrderId,
    selectedPaymentMethod,
    searchQuery,
    amountTendered,
  ];
}

class BillingError extends BillingState {
  final String message;

  const BillingError(this.message);

  @override
  List<Object> get props => [message];
}
