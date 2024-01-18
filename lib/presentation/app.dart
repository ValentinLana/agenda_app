import 'package:agenda_app/data/repositories/appointments_repository_impl.dart';
import 'package:agenda_app/data/source/local/database_impl.dart';
import 'package:agenda_app/data/source/network/api_impl.dart';
import 'package:agenda_app/domain/repositories/appointments_repository.dart';
import 'package:agenda_app/presentation/home/home_feature.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final database = DatabaseImpl();
    final api = ApiImpl();
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AppointmentsRepository>.value(
            value: AppointmentsRepositoryImpl(
          database: database,
          api: api,
        )),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: ThemeData(
          useMaterial3: false,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xff575de3),
            primary: const Color(0xff575de3),
            secondary: const Color(0xff151a56)
          ),
        ),
        home: const HomeFeature(),
      ),
    );
  }
}
