import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widgtes_demo/controller/get_all_news_bloc.dart';
import 'package:flutter_widgtes_demo/service_locator/service_locator.dart';
import 'package:flutter_widgtes_demo/widget/home_screen.dart';
import 'package:workmanager/workmanager.dart';
import 'data/data_source/remote_data_source.dart';

@pragma('vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) async {
    var result = await getAllNewsBg();
    if (result.isRight) {
      updateHeadline(result.right.data[0]);
    } else {
      // Handle the error case if necessary
    }
    return Future.value(true);
  });
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppLocator.setupLocator();
  Workmanager().initialize(
      callbackDispatcher, // The top level function, aka callbackDispatcher
      isInDebugMode:
          true // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
      );
  Workmanager().registerPeriodicTask("1", "backgroundTask",
      frequency: const Duration(minutes: 3),
      initialDelay: const Duration(minutes: 1));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getNews(),
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          appBarTheme: AppBarTheme(
            backgroundColor: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
                .primaryContainer,
          ),
          textTheme: const TextTheme(
            titleMedium: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        home: const MyHomePage(),
      ),
    );
  }

  GetAllNewsBloc getNews() => GetAllNewsBloc(sLocator())..add(GetAllNews());
}
