import 'package:flutter/material.dart';
import 'package:preferences_app1/provider/theme_provider.dart';
import 'package:preferences_app1/share_preferences/preferences.dart';
import 'package:provider/provider.dart';


// import 'package:flutter/cupertino.dart';

import '../widgets/side_menu.dart';
import '../widgets/widgets.dart';

class SettingsScreen extends StatefulWidget {

  static const String routeName = 'Settings';
   
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  // bool isDarkMode = false;
  // int gender = 1;
  // String name = 'Pedro';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: const SideMenu(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Settings', style: TextStyle( fontSize: 45, fontWeight: FontWeight.w300)),
            const Divider(),
            SwitchListTile.adaptive(
              value: Preferences.isDarkmode, 
              title: const Text('Darkmode'),
              onChanged: (value){
                Preferences.isDarkmode = value;
                final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

                value ? themeProvider.setDarkmode() : themeProvider.setLightMode();
                setState(() {});
              }
            ),
            const Divider(),
            RadioListTile(
              value: 1,
              groupValue: Preferences.gender,
              title: const Text('Male'),
              onChanged: (value){
                Preferences.gender = value ?? 1;
                setState(() {});
              }
            ),
            const Divider(),
            RadioListTile(
              value: 2,
              groupValue: Preferences.gender,
              title: const Text('Female'),
              onChanged: (value){
                Preferences.gender = value ?? 2;
                setState(() {});
              }
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                initialValue: Preferences.name,
                onChanged: (value) {
                   Preferences.name = value;
                   setState(() {});
                },
                decoration: const InputDecoration(
                  labelText: 'Name',
                  helperText: 'Name of user'
                ),
                ),
              ),

          ],
        ),
      )
    );
  }
}