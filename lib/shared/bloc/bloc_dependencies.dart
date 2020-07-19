import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_task/features/ingredients/ingredients.dart';

List<BlocProvider> providers = [
  BlocProvider<CurrentIngredientsBloc>(
    create: (context) => CurrentIngredientsBloc(),
  )
];
