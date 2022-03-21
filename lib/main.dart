import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/presentation/screen/bloc/bloc.dart';
import 'package:untitled/presentation/screen/homepage.dart';
import 'presentation/resources/injection/injection.dart';

void main() async {
  await setupApp();
  runApp(const MyApp());
}

Future<void> setupApp() async {
  await configureInjection(Env.dev);
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coin Application',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: BlocProvider(
        create: (context) => getIt<HomeBloc>(),
        child:  const HomePage(),
      ),
    );
  }
}
