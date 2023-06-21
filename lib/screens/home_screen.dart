import 'package:flutter/material.dart';

import '../share_preferences/preferences.dart';
import '../widgets/side_menu.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  static const String routeName = 'Home';
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: const SideMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('is DarkMode: ${Preferences.isDarkmode}'),
          const Divider(),
          Text('Genero: ${Preferences.gender == 1 ? 'Male':'Female'}'),
          const Divider(),
          Text('Nombre de usuario: ${Preferences.name}'),
          const Divider()
        ],
      )
    );
  }
}