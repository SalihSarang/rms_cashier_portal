import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/billing_bloc.dart';
import '../../bloc/billing_state.dart';
import '../../bloc/billing_event.dart';
import 'order_header_button.dart';

class OrderActionButtons extends StatelessWidget {
  const OrderActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BillingBloc, BillingState>(
      builder: (context, state) {
        final order = state is BillingLoaded ? state.selectedOrder : null;

        return Row(
          children: [
            OrderHeaderButton(
              onPressed: order != null
                  ? () => context.read<BillingBloc>().add(PrintOrderEvent(order))
                  : () {},
              icon: Icons.print,
              label: 'Print Bill',
            ),
          ],
        );
      },
    );
  }
}


