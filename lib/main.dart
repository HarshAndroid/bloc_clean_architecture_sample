import 'package:cubit_demo/features/ip/data/repository/ip_repository.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/ip/cubit/ip_cubit.dart';
import 'my_observer.dart';
import 'features/ip/presentation/screen/ip_screen.dart';

void main() {
  Bloc.observer = MyObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = IpRepository();

    return RepositoryProvider(
      create: (context) => RepositoryProvider.value(value: repo),
      child: BlocProvider(
        create: (context) => IpCubit(repo),

        //
        child: MaterialApp(
          title: 'Clean Architecture',
          scrollBehavior: const MaterialScrollBehavior()
              .copyWith(dragDevices: {PointerDeviceKind.mouse}),
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const IPScreen(),
        ),
      ),
    );
  }
}


// Dependency Injection (DI) in Flutter is a design pattern that allows you to 
// inject dependencies (like services, classes, or objects) 
// into your code rather than creating them directly within the class