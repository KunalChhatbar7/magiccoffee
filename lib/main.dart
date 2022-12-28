import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magiccoffee/Controller/coffee_list_controller.dart';
import 'package:magiccoffee/Ui/Screens/splash_screen.dart';
import 'package:magiccoffee/bloc/NatworkCubit.dart';
import 'package:magiccoffee/bloc/NetworkService.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var networkService = NetworkService();
    return MultiBlocProvider(
      providers: [
        BlocProvider<NetworkCubit>(
          create: (context) =>
              NetworkCubit(networkService: networkService, context: context),
        ),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<CoffeList>(create: (_) => CoffeList()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
