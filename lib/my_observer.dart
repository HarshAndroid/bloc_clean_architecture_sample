import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class MyObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log('${bloc.runtimeType}', name: 'Created');
  }

  //
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('$change', name: '${bloc.runtimeType}');
  }
}
