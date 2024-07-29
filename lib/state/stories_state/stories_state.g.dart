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
  VideoPlayerController? get controller {
    _$controllerAtom.reportRead();
    return super.controller;
  }

  bool _controllerIsInitialized = false;

  @override
  set controller(VideoPlayerController? value) {
    _$controllerAtom.reportWrite(
        value, _controllerIsInitialized ? super.controller : null, () {
      super.controller = value;
      _controllerIsInitialized = true;
    });
  }

  late final _$isVideoInitializedAtom =
      Atom(name: '_StoriesStateBase.isVideoInitialized', context: context);

  @override
  bool get isVideoInitialized {
    _$isVideoInitializedAtom.reportRead();
    return super.isVideoInitialized;
  }

  @override
  set isVideoInitialized(bool value) {
    _$isVideoInitializedAtom.reportWrite(value, super.isVideoInitialized, () {
      super.isVideoInitialized = value;
    });
  }

  late final _$initializeVideoAsyncAction =
      AsyncAction('_StoriesStateBase.initializeVideo', context: context);

  @override
  Future<void> initializeVideo() {
    return _$initializeVideoAsyncAction.run(() => super.initializeVideo());
  }

  late final _$closeVideoAsyncAction =
      AsyncAction('_StoriesStateBase.closeVideo', context: context);

  @override
  Future<void> closeVideo() {
    return _$closeVideoAsyncAction.run(() => super.closeVideo());
  }

  late final _$_StoriesStateBaseActionController =
      ActionController(name: '_StoriesStateBase', context: context);

  @override
  void printIndexs(int pageIndex, int tabIndex) {
    final _$actionInfo = _$_StoriesStateBaseActionController.startAction(
        name: '_StoriesStateBase.printIndexs');
    try {
      return super.printIndexs(pageIndex, tabIndex);
    } finally {
      _$_StoriesStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void goBack({required BuildContext context}) {
    final _$actionInfo = _$_StoriesStateBaseActionController.startAction(
        name: '_StoriesStateBase.goBack');
    try {
      return super.goBack(context: context);
    } finally {
      _$_StoriesStateBaseActionController.endAction(_$actionInfo);
    }
  }

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
controller: ${controller},
isVideoInitialized: ${isVideoInitialized}
    ''';
  }
}
