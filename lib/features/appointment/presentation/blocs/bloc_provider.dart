import 'package:flutter/material.dart';

import 'bloc.dart';

Type _typeOf<T>() => T;

class BlocProvider<T extends BaseBloc> extends StatefulWidget {
  final Widget child;
  final T bloc;

  const BlocProvider({Key key, @required this.bloc, @required this.child})
      : super(key: key);

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  static T of<T extends BaseBloc>(BuildContext context) {
    final type = _typeOf<_BlocProviderInherited<T>>();

    _BlocProviderInherited<T> provider =
        context.ancestorInheritedElementForWidgetOfExactType(type)?.widget;

    return provider?.bloc;
  }
}

class _BlocProviderState<T extends BaseBloc> extends State<BlocProvider<T>> {
  @override
  void dispose() {
    widget.bloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _BlocProviderInherited<T>(
      bloc: widget.bloc,
      child: widget.child,
    );
  }
}

class _BlocProviderInherited<T> extends InheritedWidget {
  final T bloc;

  _BlocProviderInherited({Key key, @required this.bloc, @required Widget child})
      : super(key: key, child: child);
  @override
  bool updateShouldNotify(_BlocProviderInherited oldWidget) => false;
}
