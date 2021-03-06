import 'package:store_app/provider/getit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/view/home_viewmodel.dart';
import 'base_model.dart';

class BaseView<T extends BaseModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final Function(T) onModelReady;
  final Function(T) onModelDisposed;
  final Widget child;

  BaseView({this.builder, this.onModelReady, this.child, this.onModelDisposed});

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>> {
  T model;

  @override
  void initState() {
    // if (T == HomeViewModel) {
    //   print('ohho hahaha');

    // } else {
    //   model = getIt<T>();
    // }
    model = getIt.get<T>();
    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onModelDisposed != null) {
      widget.onModelDisposed(model);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: model,
        child: Consumer<T>(
          builder: widget.builder,
          child: widget.child,
        ));
  }
}
