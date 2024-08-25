// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ShopState on _ShopStateBase, Store {
  late final _$amountAtom =
      Atom(name: '_ShopStateBase.amount', context: context);

  @override
  int get amount {
    _$amountAtom.reportRead();
    return super.amount;
  }

  @override
  set amount(int value) {
    _$amountAtom.reportWrite(value, super.amount, () {
      super.amount = value;
    });
  }

  late final _$updateAmountAsyncAction =
      AsyncAction('_ShopStateBase.updateAmount', context: context);

  @override
  Future<void> updateAmount(int newAmount) {
    return _$updateAmountAsyncAction.run(() => super.updateAmount(newAmount));
  }

  late final _$_ShopStateBaseActionController =
      ActionController(name: '_ShopStateBase', context: context);

  @override
  void goBack(BuildContext context) {
    final _$actionInfo = _$_ShopStateBaseActionController.startAction(
        name: '_ShopStateBase.goBack');
    try {
      return super.goBack(context);
    } finally {
      _$_ShopStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
amount: ${amount}
    ''';
  }
}
