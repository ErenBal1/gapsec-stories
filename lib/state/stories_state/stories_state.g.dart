// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stories_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StoriesState on _StoriesStateBase, Store {
  late final _$mp4controllerAtom =
      Atom(name: '_StoriesStateBase.mp4controller', context: context);

  @override
  VideoPlayerController get mp4controller {
    _$mp4controllerAtom.reportRead();
    return super.mp4controller;
  }

  bool _mp4controllerIsInitialized = false;

  @override
  set mp4controller(VideoPlayerController value) {
    _$mp4controllerAtom.reportWrite(
        value, _mp4controllerIsInitialized ? super.mp4controller : null, () {
      super.mp4controller = value;
      _mp4controllerIsInitialized = true;
    });
  }

  late final _$carouselControllerAtom =
      Atom(name: '_StoriesStateBase.carouselController', context: context);

  @override
  CarouselSliderController get carouselController {
    _$carouselControllerAtom.reportRead();
    return super.carouselController;
  }

  bool _carouselControllerIsInitialized = false;

  @override
  set carouselController(CarouselSliderController value) {
    _$carouselControllerAtom.reportWrite(value,
        _carouselControllerIsInitialized ? super.carouselController : null, () {
      super.carouselController = value;
      _carouselControllerIsInitialized = true;
    });
  }

  late final _$activeIndexAtom =
      Atom(name: '_StoriesStateBase.activeIndex', context: context);

  @override
  int get activeIndex {
    _$activeIndexAtom.reportRead();
    return super.activeIndex;
  }

  @override
  set activeIndex(int value) {
    _$activeIndexAtom.reportWrite(value, super.activeIndex, () {
      super.activeIndex = value;
    });
  }

  late final _$iconSelectedIndexAtom =
      Atom(name: '_StoriesStateBase.iconSelectedIndex', context: context);

  @override
  int get iconSelectedIndex {
    _$iconSelectedIndexAtom.reportRead();
    return super.iconSelectedIndex;
  }

  @override
  set iconSelectedIndex(int value) {
    _$iconSelectedIndexAtom.reportWrite(value, super.iconSelectedIndex, () {
      super.iconSelectedIndex = value;
    });
  }

  late final _$priceAtom =
      Atom(name: '_StoriesStateBase.price', context: context);

  @override
  int get price {
    _$priceAtom.reportRead();
    return super.price;
  }

  @override
  set price(int value) {
    _$priceAtom.reportWrite(value, super.price, () {
      super.price = value;
    });
  }

  late final _$itsFreeAtom =
      Atom(name: '_StoriesStateBase.itsFree', context: context);

  @override
  bool get itsFree {
    _$itsFreeAtom.reportRead();
    return super.itsFree;
  }

  @override
  set itsFree(bool value) {
    _$itsFreeAtom.reportWrite(value, super.itsFree, () {
      super.itsFree = value;
    });
  }

  late final _$newBackgroundAtom =
      Atom(name: '_StoriesStateBase.newBackground', context: context);

  @override
  String get newBackground {
    _$newBackgroundAtom.reportRead();
    return super.newBackground;
  }

  @override
  set newBackground(String value) {
    _$newBackgroundAtom.reportWrite(value, super.newBackground, () {
      super.newBackground = value;
    });
  }

  late final _$selectedTitleAtom =
      Atom(name: '_StoriesStateBase.selectedTitle', context: context);

  @override
  String get selectedTitle {
    _$selectedTitleAtom.reportRead();
    return super.selectedTitle;
  }

  @override
  set selectedTitle(String value) {
    _$selectedTitleAtom.reportWrite(value, super.selectedTitle, () {
      super.selectedTitle = value;
    });
  }

  late final _$selectedDescriptionAtom =
      Atom(name: '_StoriesStateBase.selectedDescription', context: context);

  @override
  String get selectedDescription {
    _$selectedDescriptionAtom.reportRead();
    return super.selectedDescription;
  }

  @override
  set selectedDescription(String value) {
    _$selectedDescriptionAtom.reportWrite(value, super.selectedDescription, () {
      super.selectedDescription = value;
    });
  }

  late final _$mp4PathAtom =
      Atom(name: '_StoriesStateBase.mp4Path', context: context);

  @override
  String get mp4Path {
    _$mp4PathAtom.reportRead();
    return super.mp4Path;
  }

  @override
  set mp4Path(String value) {
    _$mp4PathAtom.reportWrite(value, super.mp4Path, () {
      super.mp4Path = value;
    });
  }

  late final _$deleteAllStoriesAsyncAction =
      AsyncAction('_StoriesStateBase.deleteAllStories', context: context);

  @override
  Future<void> deleteAllStories({required TextType type}) {
    return _$deleteAllStoriesAsyncAction
        .run(() => super.deleteAllStories(type: type));
  }

  late final _$updateIndexAsyncAction =
      AsyncAction('_StoriesStateBase.updateIndex', context: context);

  @override
  Future<void> updateIndex(int index, String title, String description) {
    return _$updateIndexAsyncAction
        .run(() => super.updateIndex(index, title, description));
  }

  late final _$playNewTrackAsyncAction =
      AsyncAction('_StoriesStateBase.playNewTrack', context: context);

  @override
  Future<void> playNewTrack({required String mp4Path}) {
    return _$playNewTrackAsyncAction
        .run(() => super.playNewTrack(mp4Path: mp4Path));
  }

  late final _$_StoriesStateBaseActionController =
      ActionController(name: '_StoriesStateBase', context: context);

  @override
  void goToPageRemoveUntilPush(
      {required BuildContext context, required Widget page}) {
    final _$actionInfo = _$_StoriesStateBaseActionController.startAction(
        name: '_StoriesStateBase.goToPageRemoveUntilPush');
    try {
      return super.goToPageRemoveUntilPush(context: context, page: page);
    } finally {
      _$_StoriesStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateMp4Path({required String newPath}) {
    final _$actionInfo = _$_StoriesStateBaseActionController.startAction(
        name: '_StoriesStateBase.updateMp4Path');
    try {
      return super.updateMp4Path(newPath: newPath);
    } finally {
      _$_StoriesStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateBackground({required String newImagePath}) {
    final _$actionInfo = _$_StoriesStateBaseActionController.startAction(
        name: '_StoriesStateBase.updateBackground');
    try {
      return super.updateBackground(newImagePath: newImagePath);
    } finally {
      _$_StoriesStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateTitle({required String newTitle}) {
    final _$actionInfo = _$_StoriesStateBaseActionController.startAction(
        name: '_StoriesStateBase.updateTitle');
    try {
      return super.updateTitle(newTitle: newTitle);
    } finally {
      _$_StoriesStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateDescription({required String newDescription}) {
    final _$actionInfo = _$_StoriesStateBaseActionController.startAction(
        name: '_StoriesStateBase.updateDescription');
    try {
      return super.updateDescription(newDescription: newDescription);
    } finally {
      _$_StoriesStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateIconSelectedIndex({required int newIconSelectedIndex}) {
    final _$actionInfo = _$_StoriesStateBaseActionController.startAction(
        name: '_StoriesStateBase.updateIconSelectedIndex');
    try {
      return super
          .updateIconSelectedIndex(newIconSelectedIndex: newIconSelectedIndex);
    } finally {
      _$_StoriesStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateItsFree({required bool newItsFree}) {
    final _$actionInfo = _$_StoriesStateBaseActionController.startAction(
        name: '_StoriesStateBase.updateItsFree');
    try {
      return super.updateItsFree(newItsFree: newItsFree);
    } finally {
      _$_StoriesStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updatePrice({required int newPrice}) {
    final _$actionInfo = _$_StoriesStateBaseActionController.startAction(
        name: '_StoriesStateBase.updatePrice');
    try {
      return super.updatePrice(newPrice: newPrice);
    } finally {
      _$_StoriesStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateActiveIndex({required int newIndex}) {
    final _$actionInfo = _$_StoriesStateBaseActionController.startAction(
        name: '_StoriesStateBase.updateActiveIndex');
    try {
      return super.updateActiveIndex(newIndex: newIndex);
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
  void goToPage({required BuildContext context, required Widget page}) {
    final _$actionInfo = _$_StoriesStateBaseActionController.startAction(
        name: '_StoriesStateBase.goToPage');
    try {
      return super.goToPage(context: context, page: page);
    } finally {
      _$_StoriesStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
mp4controller: ${mp4controller},
carouselController: ${carouselController},
activeIndex: ${activeIndex},
iconSelectedIndex: ${iconSelectedIndex},
price: ${price},
itsFree: ${itsFree},
newBackground: ${newBackground},
selectedTitle: ${selectedTitle},
selectedDescription: ${selectedDescription},
mp4Path: ${mp4Path}
    ''';
  }
}
