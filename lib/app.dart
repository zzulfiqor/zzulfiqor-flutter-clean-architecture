import 'package:flutter/material.dart';
import 'package:providers_latihan/app/presentation/feature/home/bloc/home_bloc.dart';
import 'package:providers_latihan/app/presentation/feature/home/home_screen.dart';
import 'core/router/route_name.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc()..add(HomeEventLoad()),
          lazy: true,
        ),
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',
        initialRoute: RouteName.home,
        home: HomeScreen(),
      ),
    );
  }
}
