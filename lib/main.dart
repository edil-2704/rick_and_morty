import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rick_and_morty/generated/l10n.dart';
import 'package:rick_and_morty/internal/helpers/localization/bloc/localization_bloc.dart';
import 'package:rick_and_morty/internal/helpers/localization/localization_hive.dart';
import 'package:rick_and_morty/features/presentation/screens/splash_screen.dart';

Future<void> main() async {
  await initMyHive();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? locale;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocalizationBloc()
        ..add(
          ChangeLocaleEvent(
            locale: LocalizationHive.getLocale(),
          ),
        ),
      child: BlocConsumer<LocalizationBloc, LocalizationState>(
        listener: (context, state) {
          if (state is LocalizationLoadedState) {
            locale = state.updatedLocale;
          }
        },
        builder: (context, state) {
          return MaterialApp(
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: Locale.fromSubtags(languageCode: locale ?? 'ru \$'),
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}



class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).hello),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Screen3(),
            ),
          );
        },
      ),
    );
  }
}

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).start),
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                context
                    .read<LocalizationBloc>()
                    .add(ChangeLocaleEvent(locale: 'ru'));
              },
              child: Text('ru'),
            ),
            ElevatedButton(
              onPressed: () {
                context
                    .read<LocalizationBloc>()
                    .add(ChangeLocaleEvent(locale: 'en'));
              },
              child: Text('en'),
            ),
            ElevatedButton(
              onPressed: () {
                context
                    .read<LocalizationBloc>()
                    .add(ChangeLocaleEvent(locale: 'ky'));
              },
              child: Text('ky'),
            ),
          ],
        ),
      ),
    );
  }
}
