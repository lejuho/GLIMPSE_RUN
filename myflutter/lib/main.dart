import '../repository/auth_repository.dart';
import '../screen/auth_screen.dart';
import '../screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../database/drift_database.dart';
import 'package:get_it/get_it.dart';
import '../provider/schedule_provider.dart';
import '../repository/schedule_repository.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting();

  await Firebase.initializeApp();

  final scheduleRepository = ScheduleRepository();
  final authRepository = AuthRepository();
  final scheduleProvider = ScheduleProvider(
    scheduleRepository: scheduleRepository,
    authRepository: authRepository,
  );

  runApp(
    ChangeNotifierProvider(
      create: (_) => scheduleProvider,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthScreen(),
      ),
    ),
  );
}