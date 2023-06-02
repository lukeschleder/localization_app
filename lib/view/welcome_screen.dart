import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:localization_app/app.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key, required locale});

  @override
  // This method is rerun every time setState is called
  Widget build(BuildContext context) {
    void dropDownCallBack(Locale? selectedLocale) {
      MyApp.of(context)!.setLocale(selectedLocale ??
          AppLocalizations.supportedLocales
              .firstWhere((element) => element.languageCode == 'es'));
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(AppLocalizations.of(context)!.helloUser),
      ),
      body: Stack(
        children: [
          const Background(),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 2, color: Colors.black54),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: DropdownButton(
                  underline: const SizedBox.shrink(),
                  isExpanded: true,
                  items: AppLocalizations.supportedLocales
                      .map<DropdownMenuItem<Locale>>((Locale item) =>
                          DropdownMenuItem<Locale>(
                            value: item,
                            child: Center(
                                child: Text(item.languageCode == 'en'
                                    ? AppLocalizations.of(context)!.english
                                    : AppLocalizations.of(context)!.spanish)),
                          ))
                      .toList(),
                  onChanged: dropDownCallBack,
                ),
              ),
            ),
          ),
        ],
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
            Colors.grey,
          ],
        ),
      ),
    );
  }
}
