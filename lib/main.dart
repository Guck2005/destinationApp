import 'package:flutter/material.dart';
import 'package:login_signup/screens/welcome_screen.dart';
import 'package:login_signup/theme/theme.dart';
import 'package:login_signup/pages/home/home.dart';
import 'package:login_signup/pages/agenda/agenda.dart';
import 'package:login_signup/pages/search/searchPage.dart';
import 'package:login_signup/pages/messagerie/messagerie.dart';
import 'package:login_signup/pages/traduction/traductionPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  // Définissez vos routes ici
  final Map<String, WidgetBuilder> routes = {
    '/': (context) => const WelcomeScreen(),
    '/agenda': (context) => AgendaPage(),
    '/home': (context) => HomePage(),
    '/search': (context) => SearchPage(),
    '/messaging': (context) => MessagePage(),
    '/traduction': (context) => TranslationPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightMode,
      routes: routes,
    );
  }
}
