import 'package:flutter/material.dart';
import 'package:preferences_app1/provider/theme_provider.dart';
import 'package:preferences_app1/screens/home_screen.dart';
import 'package:preferences_app1/screens/settings_screen.dart';
import 'package:preferences_app1/share_preferences/preferences.dart';
import 'package:provider/provider.dart';
// import 'package:preferences_app/screens/screens.dart';
// import 'package:preferences_app/share_preferences/preferences.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await Preferences.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(isDarkmode: Preferences.isDarkmode))
      ],
      child: const MyApp()
    )
  );
    



}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName    :( _ ) => const HomeScreen(),
        SettingsScreen.routeName:( _ ) => const SettingsScreen(),
      },
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}