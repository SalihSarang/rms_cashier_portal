import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cashier_portal/firebase_options.dart';
import 'package:cashier_portal/core/di/injector.dart';
import 'package:cashier_portal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:cashier_portal/features/profile/presentation/bloc/shift_bloc.dart';
import 'package:cashier_portal/features/auth/presentation/pages/auth_gate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupDI();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => getIt<AuthBloc>()),
        BlocProvider<ShiftBloc>(create: (context) => getIt<ShiftBloc>()),
      ],
      child: MaterialApp(
        title: 'Cashier Portal',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Inter', useMaterial3: true),
        home: const AuthGate(),
      ),
    );
  }
}
