import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'shared/shared.dart';

@immutable
class RootProvider extends StatelessWidget {
  final Widget child;

  const RootProvider({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<RepositoryBundle>(
      create: (context) => RepositoryBundle(
        apiClient: ApiClient(),
        baseUrl: BASE_URL_API,
      ),
      child: MultiBlocProvider(
        providers: providers,
        child: child,
      ),
    );
  }
}
