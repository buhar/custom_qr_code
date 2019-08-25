import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'compare_codes/ui/compare_codes_page.dart';
import 'custom_qr_code/ui/custom_qr/custom_qr_page.dart';
import 'home/home_page.dart';
import 'home/routes.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        '/': (context) => HomePage(),
        Routes.customQrCode: (context) => CustomQrPage(),
        Routes.compareCodes: (context) => CompareCodesPage()
      },
    );
  }
}
