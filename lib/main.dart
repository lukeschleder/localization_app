import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();

  static MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<MyAppState>();
}

class MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en');

  void setLocale(String selectedValue) {
    setState(() {
      _locale = Locale(selectedValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      locale: _locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: WelcomeScreen(locale: _locale),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key, required locale});
  

  @override
  Widget build(BuildContext context) {
    
    void dropDownCallBack(String? selectedValue) {
      MyApp.of(context)!
          .setLocale(selectedValue ?? AppLocalizations.supportedLocales.first.languageCode);
    }

    // This method is rerun every time setState is called
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(AppLocalizations.of(context)!.helloUser)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              AppLocalizations.of(context)!.english,
            ),
            Text(
              AppLocalizations.of(context)!.spanish,
            ),
            Text(
              'hello',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            DropdownButton(
              items: const [
                DropdownMenuItem(value: 'en', child: Text('English')),
                DropdownMenuItem(value: 'es', child: Text('Spanish')),
              ],
              onChanged: dropDownCallBack,
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => MyApp.of(context)!
      //       .setLocale(const Locale.fromSubtags(languageCode: 'es')),
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
