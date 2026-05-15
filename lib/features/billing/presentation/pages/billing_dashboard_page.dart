import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:cashier_portal/core/di/injector.dart';
import 'package:cashier_portal/features/billing/presentation/bloc/billing_bloc.dart';
import 'package:cashier_portal/features/billing/presentation/bloc/billing_event.dart';
import 'package:cashier_portal/features/billing/presentation/widgets/billing_details_area.dart';
import 'package:cashier_portal/features/billing/presentation/widgets/billing_app_bar_area/billing_app_bar.dart';
import 'package:cashier_portal/features/billing/presentation/widgets/billing_queue_sidebar/billing_queue_sidebar.dart';

/// Billing Dashboard Page — declarative two-column web layout.
///
///  AppBar  : BillingAppBar        (logo · profile avatar)
///  Left    : BillingQueueSidebar  (order queue list + search)
///  Right   : BillingDetailsArea   (selected order details)
class BillingDashboardPage extends StatelessWidget {
  const BillingDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BillingBloc>()..add(LoadBillingQueue()),
      child: const Scaffold(
        backgroundColor: NeutralColors.darkBackground,
        appBar: BillingAppBar(),
        body: Row(
          children: [
            BillingQueueSidebar(),
            VerticalDivider(width: 1, color: NeutralColors.divider),
            Expanded(child: BillingDetailsArea()),
          ],
        ),
      ),
    );
  }
}
