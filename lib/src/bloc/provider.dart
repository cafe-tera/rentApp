import 'package:flutter/material.dart';

Type _getType<T>() => T;

class Provider<T> extends InheritedWidget {
  final T bloc;

  Provider({
    Key key,
    T bloc,
    Widget child,
  })  : assert(bloc != null),
        bloc = bloc,
        super(key: key, child: child);
  
  @override
  bool updateShouldNotify(Provider<T> oldWidget) => oldWidget.bloc != bloc;

  static T of<T>(BuildContext context) => (context.inheritFromWidgetOfExactType(_getType<Provider<T>>()) as Provider<T>).bloc;
}

class BlocProvider<T> extends StatefulWidget {
  BlocProvider({
    Key key,
    // @required this.builder,
    @required this.bloc,
    @required this.child,
    @required this.onDispose,
  }) : super(key: key);

  // final T Function(BuildContext context, T bloc) builder;
  final T bloc;
  final Widget child;
  final void Function(BuildContext context, T bloc) onDispose;

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();
}

class _BlocProviderState<T> extends State<BlocProvider<T>> {
  T bloc;

  @override
  void initState() {
    super.initState();
    if (widget.bloc != null)
      bloc = widget.bloc;
  }

  @override
  void dispose() {
    if (widget.onDispose != null)
      widget.onDispose(context, bloc);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<T>(
      bloc: bloc,
      child: widget.child,
    );
  }
}