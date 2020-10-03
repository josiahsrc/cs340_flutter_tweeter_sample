import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tweeter/model/model.dart';
import 'package:tweeter/view/app.dart';

void main() {
  final app = App();

  /// The user repo.
  final userRepo = UserRepository();

  /// Place your global blocs here. All widgets will share these
  /// blocs. If you want a bloc to only exist for one view, place
  /// a new provider for that bloc in that view.
  final appWithBlocs = MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => AuthCubit(userRepo: userRepo),
      ),
    ],
    child: app,
  );

  /// We provide data we need to shared between blocs using repositories.
  /// Here we are providing a repository to share the current user between
  /// blocs/cubits.
  final appWithRepositories = MultiRepositoryProvider(
    providers: [
      RepositoryProvider.value(value: userRepo),
    ],
    child: appWithBlocs,
  );

  runApp(appWithRepositories);
}
