// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'continue_view_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ContinueViewState on _ContinueViewStateBase, Store {
  late final _$controllerAtom =
      Atom(name: '_ContinueViewStateBase.controller', context: context);

  @override
  VideoPlayerController get controller {
    _$controllerAtom.reportRead();
    return super.controller;
  }

  bool _controllerIsInitialized = false;

  @override
  set controller(VideoPlayerController value) {
    _$controllerAtom.reportWrite(
        value, _controllerIsInitialized ? super.controller : null, () {
      super.controller = value;
      _controllerIsInitialized = true;
    });
  }

  late final _$_ContinueViewStateBaseActionController =
      ActionController(name: '_ContinueViewStateBase', context: context);

  @override
  void goToPageRemoveUntilPush(
      {required BuildContext context, required Widget page}) {
    final _$actionInfo = _$_ContinueViewStateBaseActionController.startAction(
        name: '_ContinueViewStateBase.goToPageRemoveUntilPush');
    try {
      return super.goToPageRemoveUntilPush(context: context, page: page);
    } finally {
      _$_ContinueViewStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void goToPage({required BuildContext context, required Widget page}) {
    final _$actionInfo = _$_ContinueViewStateBaseActionController.startAction(
        name: '_ContinueViewStateBase.goToPage');
    try {
      return super.goToPage(context: context, page: page);
    } finally {
      _$_ContinueViewStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
controller: ${controller}
    ''';
  }
}
