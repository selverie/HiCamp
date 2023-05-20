import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'get_started.dart';
import 'login.dart';
import 'page/beranda.dart';
import 'page/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hi Camp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        GetStartedPage.routeName: (context) => const GetStartedPage(),
        LoginPage.routeName: (context) => LoginPage(onLogin: _login),
        BerandaPage.routeName: (context) => const BerandaPage(),
        MainPage.routeName: (context) => const MainPage(),
        ProfilPage.routeName: (context) => const ProfilPage(),
      },
    );
  }

  void _login(BuildContext context) {
    Navigator.pushReplacementNamed(context, MainPage.routeName);
  }
}

class MainPage extends StatefulWidget {
  static const routeName = '/';

  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // hapus arrow back
        toolbarHeight: 0, // hapus toolbar
      ),
      body: const BerandaPage(),
    );
  }
}
