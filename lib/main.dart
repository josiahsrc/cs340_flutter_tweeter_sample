import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tweeter/model/model.dart';
import 'package:tweeter/view/app.dart';

void main() {
  final app = App();

  /// Place your global blocs here. All widgets will share these
  /// blocs. If you want a bloc to only exist for one view, place
  /// a new provider for that bloc in that view.
  final appWithBlocs = MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => AuthCubit()),
    ],
    child: app,
  );

  runApp(appWithBlocs);
}
