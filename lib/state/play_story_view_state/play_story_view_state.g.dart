// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'play_story_view_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PlayStoryViewState on _PlayStoryViewStateBase, Store {
  late final _$isEnableAtom =
      Atom(name: '_PlayStoryViewStateBase.isEnable', context: context);

  @override
  bool get isEnable {
    _$isEnableAtom.reportRead();
    return super.isEnable;
  }

  @override
  set isEnable(bool value) {
    _$isEnableAtom.reportWrite(value, super.isEnable, () {
      super.isEnable = value;
    });
  }

  late final _$selectedTextsAtom =
      Atom(name: '_PlayStoryViewStateBase.selectedTexts', context: context);

  @override
  String get selectedTexts {
    _$selectedTextsAtom.reportRead();
    return super.selectedTexts;
  }

  @override
  set selectedTexts(String value) {
    _$selectedTextsAtom.reportWrite(value, super.selectedTexts, () {
      super.selectedTexts = value;
    });
  }

  late final _$textCompletedAtom =
      Atom(name: '_PlayStoryViewStateBase.textCompleted', context: context);

  @override
  bool get textCompleted {
    _$textCompletedAtom.reportRead();
    return super.textCompleted;
  }

  @override
  set textCompleted(bool value) {
    _$textCompletedAtom.reportWrite(value, super.textCompleted, () {
      super.textCompleted = value;
    });
  }

  late final _$mp3controllerAtom =
      Atom(name: '_PlayStoryViewStateBase.mp3controller', context: context);

  @override
  VideoPlayerController get mp3controller {
    _$mp3controllerAtom.reportRead();
    return super.mp3controller;
  }

  bool _mp3controllerIsInitialized = false;

  @override
  set mp3controller(VideoPlayerController value) {
    _$mp3controllerAtom.reportWrite(
        value, _mp3controllerIsInitialized ? super.mp3controller : null, () {
      super.mp3controller = value;
      _mp3controllerIsInitialized = true;
    });
  }

  late final _$storyMapIdAtom =
      Atom(name: '_PlayStoryViewStateBase.storyMapId', context: context);

  @override
  int get storyMapId {
    _$storyMapIdAtom.reportRead();
    return super.storyMapId;
  }

  @override
  set storyMapId(int value) {
    _$storyMapIdAtom.reportWrite(value, super.storyMapId, () {
      super.storyMapId = value;
    });
  }

  late final _$repoAtom =
      Atom(name: '_PlayStoryViewStateBase.repo', context: context);

  @override
  List<dynamic> get repo {
    _$repoAtom.reportRead();
    return super.repo;
  }

  bool _repoIsInitialized = false;

  @override
  set repo(List<dynamic> value) {
    _$repoAtom.reportWrite(value, _repoIsInitialized ? super.repo : null, () {
      super.repo = value;
      _repoIsInitialized = true;
    });
  }

  late final _$scrollControllerAtom =
      Atom(name: '_PlayStoryViewStateBase.scrollController', context: context);

  @override
  ScrollController get scrollController {
    _$scrollControllerAtom.reportRead();
    return super.scrollController;
  }

  bool _scrollControllerIsInitialized = false;

  @override
  set scrollController(ScrollController value) {
    _$scrollControllerAtom.reportWrite(
        value, _scrollControllerIsInitialized ? super.scrollController : null,
        () {
      super.scrollController = value;
      _scrollControllerIsInitialized = true;
    });
  }

  late final _$selectedListAtom =
      Atom(name: '_PlayStoryViewStateBase.selectedList', context: context);

  @override
  List<Map<String, dynamic>> get selectedList {
    _$selectedListAtom.reportRead();
    return super.selectedList;
  }

  bool _selectedListIsInitialized = false;

  @override
  set selectedList(List<Map<String, dynamic>> value) {
    _$selectedListAtom.reportWrite(
        value, _selectedListIsInitialized ? super.selectedList : null, () {
      super.selectedList = value;
      _selectedListIsInitialized = true;
    });
  }

  late final _$leftAtom =
      Atom(name: '_PlayStoryViewStateBase.left', context: context);

  @override
  Map<String, dynamic> get left {
    _$leftAtom.reportRead();
    return super.left;
  }

  bool _leftIsInitialized = false;

  @override
  set left(Map<String, dynamic> value) {
    _$leftAtom.reportWrite(value, _leftIsInitialized ? super.left : null, () {
      super.left = value;
      _leftIsInitialized = true;
    });
  }

  late final _$rightAtom =
      Atom(name: '_PlayStoryViewStateBase.right', context: context);

  @override
  Map<String, dynamic> get right {
    _$rightAtom.reportRead();
    return super.right;
  }

  bool _rightIsInitialized = false;

  @override
  set right(Map<String, dynamic> value) {
    _$rightAtom.reportWrite(value, _rightIsInitialized ? super.right : null,
        () {
      super.right = value;
      _rightIsInitialized = true;
    });
  }

  late final _$_PlayStoryViewStateBaseActionController =
      ActionController(name: '_PlayStoryViewStateBase', context: context);

  @override
  void scrollToBottom() {
    final _$actionInfo = _$_PlayStoryViewStateBaseActionController.startAction(
        name: '_PlayStoryViewStateBase.scrollToBottom');
    try {
      return super.scrollToBottom();
    } finally {
      _$_PlayStoryViewStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateStoryMapId(int newId) {
    final _$actionInfo = _$_PlayStoryViewStateBaseActionController.startAction(
        name: '_PlayStoryViewStateBase.updateStoryMapId');
    try {
      return super.updateStoryMapId(newId);
    } finally {
      _$_PlayStoryViewStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isEnable: ${isEnable},
selectedTexts: ${selectedTexts},
textCompleted: ${textCompleted},
mp3controller: ${mp3controller},
storyMapId: ${storyMapId},
repo: ${repo},
scrollController: ${scrollController},
selectedList: ${selectedList},
left: ${left},
right: ${right}
    ''';
  }
}
