import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensores_app_v2/pages/LoguinPage.dart';
import 'package:sensores_app_v2/pages/PiscinasPage.dart';
import 'package:sensores_app_v2/pages/ReportesPage.dart';
import 'package:sensores_app_v2/pages/SensoresPage.dart';
import 'package:sensores_app_v2/pages/TestRoomPage.dart';
import 'package:sensores_app_v2/pages/UsuariosPage.dart';
import 'package:sensores_app_v2/providers/CamaronGetAllValoresProvider.dart';
import 'package:sensores_app_v2/providers/CamaronGetBoxConfigProvider.dart';
import 'package:sensores_app_v2/providers/CamaronGetReportesProvider.dart';
import 'package:sensores_app_v2/providers/CamaronGetUsersProvider.dart';
import 'package:sensores_app_v2/providers/CamaronSetBoxConfigProvider.dart';
import 'package:sensores_app_v2/providers/PageProvider.dart';
import 'package:sensores_app_v2/providers/SessionProvider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SessionProvider()),
        ChangeNotifierProvider(create: (_) => PageProvider()),
        ChangeNotifierProvider(create: (_) => CamaronGetAllValoresProvider()),
        ChangeNotifierProvider(create: (_) => CamaronGetBoxConfigProvider()),
        ChangeNotifierProvider(create: (_) => CamaronGetUsersProvider()),
        ChangeNotifierProvider(create: (_) => CamaronGetReportesProvider()),
        ChangeNotifierProvider(create: (_) => CamaronSetBoxConfigProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      title: 'Camaronera',
      initialRoute: LoguinPage.routeName,
      routes: {
        LoguinPage.routeName      : (context) => const LoguinPage(),
        PiscinasPage.routeName    : (context) =>  PiscinasPage(),
        SensoresPage.routeName    : (context) => const SensoresPage(),
        ReportesPage.routeName    : (context) => const ReportesPage(),
        TestRoomPage.routeName    : (context) => const TestRoomPage(),
        UsuariosPage.routeName    : (context) => const UsuariosPage(),

        // ReporteConcreto.routeName : (context) => const ReporteConcreto(),
        // Censores.routeName        : (context) => const Censores(),
        // ChartTest.routeName       : (context) => const ChartTest(),
      },
    );
  }
}