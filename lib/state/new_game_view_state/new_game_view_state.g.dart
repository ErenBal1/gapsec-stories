// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_game_view_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NewGameViewState on _NewGameViewStateBase, Store {
  late final _$controllerAtom =
      Atom(name: '_NewGameViewStateBase.controller', context: context);

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

  late final _$updateDefaultValuesAsyncAction = AsyncAction(
      '_NewGameViewStateBase.updateDefaultValues',
      context: context);

  @override
  Future<void> updateDefaultValues() {
    return _$updateDefaultValuesAsyncAction
        .run(() => super.updateDefaultValues());
  }

  late final _$_NewGameViewStateBaseActionController =
      ActionController(name: '_NewGameViewStateBase', context: context);

  @override
  void goToPageRemoveUntilPush(
      {required BuildContext context, required Widget page}) {
    final _$actionInfo = _$_NewGameViewStateBaseActionController.startAction(
        name: '_NewGameViewStateBase.goToPageRemoveUntilPush');
    try {
      return super.goToPageRemoveUntilPush(context: context, page: page);
    } finally {
      _$_NewGameViewStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void goToPage({required BuildContext context, required Widget page}) {
    final _$actionInfo = _$_NewGameViewStateBaseActionController.startAction(
        name: '_NewGameViewStateBase.goToPage');
    try {
      return super.goToPage(context: context, page: page);
    } finally {
      _$_NewGameViewStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
controller: ${controller}
    ''';
  }
}
