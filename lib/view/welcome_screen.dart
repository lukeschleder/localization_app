import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:localization_app/app.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(AppLocalizations.of(context)!.helloUser),
      ),
      body: const Stack(
        children: [
          Background(),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 48),
              child: DropDown(),
            ),
          ),
        ],
      ),
    );
  }
}

// making UI widgets their own class(vs returning Widget functions) improves performance
class DropDown extends StatelessWidget {
  const DropDown({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 2, color: Colors.black54),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButton(
        underline: const SizedBox.shrink(),
        isExpanded: true,
        items: AppLocalizations.supportedLocales
            .map<DropdownMenuItem<Locale>>(
                (Locale item) => DropdownMenuItem<Locale>(
                      value: item,
                      child: Center(
                          child: Text(item.languageCode == 'en'
                              ? AppLocalizations.of(context)!.english
                              : AppLocalizations.of(context)!.spanish)),
                    ))
            .toList(),
        // on change we trigger [setLocale] function in parent [AppState] class
        onChanged: (Locale? selectedLocale) => App.of(context)!.setLocale(
            selectedLocale ??
                AppLocalizations.supportedLocales
                    .firstWhere((element) => element.languageCode == 'en')),
      ),
    );
  }
}

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            Colors.lightBlueAccent,
          ],
        ),
      ),
    );
  }
}
