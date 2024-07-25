// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stories_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StoriesState on _StoriesStateBase, Store {
  late final _$controllerAtom =
      Atom(name: '_StoriesStateBase.controller', context: context);

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

  late final _$initializeVideoAsyncAction =
      AsyncAction('_StoriesStateBase.initializeVideo', context: context);

  @override
  Future<void> initializeVideo() {
    return _$initializeVideoAsyncAction.run(() => super.initializeVideo());
  }

  late final _$_StoriesStateBaseActionController =
      ActionController(name: '_StoriesStateBase', context: context);

  @override
  void dispose() {
    final _$actionInfo = _$_StoriesStateBaseActionController.startAction(
        name: '_StoriesStateBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$_StoriesStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
controller: ${controller}
    ''';
  }
}
