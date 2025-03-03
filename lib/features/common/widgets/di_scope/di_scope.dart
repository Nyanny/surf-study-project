import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_study_project/features/app/di/app_scope.dart';

/// Factory that returns the dependency scope.
typedef ScopeFactory<T> = T Function();

/// Di container. T - return type(for example [AppScope]).
class DiScope<T> extends StatefulWidget {
  /// Factory that returns the dependency scope.
  final ScopeFactory<T> factory;

  /// The widget below this widget in the tree.
  final Widget child;

  /// Create an instance [DiScope].
  const DiScope({
    required this.factory,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  _DiScopeState createState() => _DiScopeState<T>();
}

class _DiScopeState<T> extends State<DiScope<T>> {
  late T scope;

  @override
  void initState() {
    super.initState();
    scope = widget.factory();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<T>(
      create: (_) => scope,
      child: widget.child,
    );
  }
}
