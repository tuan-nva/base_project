import 'base_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseController<TModel extends BaseModel> {
  BaseController();

  BaseController changeValues(
    BuildContext context, {
    BaseModelStatus status,
    Widget child,
    String title,
    String message,
  }) {
    final viewModel = Provider.of<TModel>(context, listen: false);

    viewModel.changeValues(
        status: status, child: child, title: title, message: message);

    return this;
  }

  BaseController changeStatus(BuildContext context, {BaseModelStatus status}) {
    final viewModel = Provider.of<TModel>(context, listen: false);

    viewModel.changeValues(
      status: status,
    );

    return this;
  }

  BaseController showLoading(BuildContext context) {
    return changeStatus(context, status: BaseModelStatus.Loading);
  }

  BaseController showError(
    BuildContext context, {
    Widget child,
  }) {
    return changeValues(
      context,
      status: BaseModelStatus.Error,
      child: child,
    );
  }

  BaseController showView(
    BuildContext context, {
    Widget child,
  }) {
    return changeValues(
      context,
      status: BaseModelStatus.View,
      child: child,
    );
  }
}
