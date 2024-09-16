// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeState on _HomeStateBase, Store {
  late final _$isLanguageExpandedAtom =
      Atom(name: '_HomeStateBase.isLanguageExpanded', context: context);

  @override
  bool get isLanguageExpanded {
    _$isLanguageExpandedAtom.reportRead();
    return super.isLanguageExpanded;
  }

  @override
  set isLanguageExpanded(bool value) {
    _$isLanguageExpandedAtom.reportWrite(value, super.isLanguageExpanded, () {
      super.isLanguageExpanded = value;
    });
  }

  late final _$_HomeStateBaseActionController =
      ActionController(name: '_HomeStateBase', context: context);

  @override
  void toggleLanguageMenu() {
    final _$actionInfo = _$_HomeStateBaseActionController.startAction(
        name: '_HomeStateBase.toggleLanguageMenu');
    try {
      return super.toggleLanguageMenu();
    } finally {
      _$_HomeStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void goToPage({required BuildContext context, required Widget page}) {
    final _$actionInfo = _$_HomeStateBaseActionController.startAction(
        name: '_HomeStateBase.goToPage');
    try {
      return super.goToPage(context: context, page: page);
    } finally {
      _$_HomeStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void goToPageRemoveUntilPush(
      {required BuildContext context, required Widget page}) {
    final _$actionInfo = _$_HomeStateBaseActionController.startAction(
        name: '_HomeStateBase.goToPageRemoveUntilPush');
    try {
      return super.goToPageRemoveUntilPush(context: context, page: page);
    } finally {
      _$_HomeStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void goBackDefault({required BuildContext context}) {
    final _$actionInfo = _$_HomeStateBaseActionController.startAction(
        name: '_HomeStateBase.goBackDefault');
    try {
      return super.goBackDefault(context: context);
    } finally {
      _$_HomeStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void goToPageBottomToTop(
      {required BuildContext context, required Widget page}) {
    final _$actionInfo = _$_HomeStateBaseActionController.startAction(
        name: '_HomeStateBase.goToPageBottomToTop');
    try {
      return super.goToPageBottomToTop(context: context, page: page);
    } finally {
      _$_HomeStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLanguageExpanded: ${isLanguageExpanded}
    ''';
  }
}
