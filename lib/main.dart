import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_clone/screens/base/base_screen.dart';
import 'package:xlo_clone/stores/category_store.dart';
import 'package:xlo_clone/stores/favorite_store.dart';
import 'package:xlo_clone/stores/home_store.dart';
import 'package:xlo_clone/stores/page_store.dart';
import 'package:xlo_clone/stores/user_manager_store.dart';

void main() async {
  await initializeParse();
  setupLocators();
  runApp(MyApp());
}

void setupLocators() {
  GetIt.I.registerSingleton(PageStore());
  GetIt.I.registerSingleton(HomeStore());
  GetIt.I.registerSingleton(UserManagerStore());
  GetIt.I.registerSingleton(CategoryStore());
  GetIt.I.registerSingleton(FavoriteStore());
}

Future<void> initializeParse() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Parse().initialize('bIkls0Xg6cxZBweYWomaI8SbkD3iq9RUqORBn50e',
      'https://parseapi.back4app.com/',
      clientKey: 'sfpEMETKoRzG4dP4XK2FcdWd6nqLJxuZ0dboxrkJ',
      autoSendSessionId: true,
      debug: true);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XLO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.purple,
        appBarTheme: AppBarTheme(elevation: 0),
        cursorColor: Colors.orange,
      ),
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: BaseScreen(),
    );
  }
}
