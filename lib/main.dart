import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'provider/current_data.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'localization/app_localization.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CurrentData currentData = CurrentData();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => currentData,
      child: Consumer<CurrentData>(
        builder: (context, provider, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter App Localization with Provider demo',
          locale: Provider.of<CurrentData>(context).locale,
          home: HomePage(),
          localizationsDelegates: [
            const AppLocalizationDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('en'),
            const Locale('fr'),
            const Locale('es'),
            const Locale('ru'),
            const Locale('ar'),
          ],
        ),
      ),
    );
  }
}
