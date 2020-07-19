import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'root_provider.dart';
import 'shared/shared.dart';

void main() {
  Bloc.observer = BlocLogObserver();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RootProvider(
      child: MaterialApp(
        title: 'Lunch Recipe Suggestion',
        theme: AppTheme.data,
        initialRoute: AppRouter.routeSelectDate,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
