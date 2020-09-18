// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lifestyle_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LifeStyleStore on _LifeStyleStore, Store {
  final _$isLoadingAtom = Atom(name: '_LifeStyleStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.context.enforceReadPolicy(_$isLoadingAtom);
    _$isLoadingAtom.reportObserved();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.context.conditionallyRunInAction(() {
      super.isLoading = value;
      _$isLoadingAtom.reportChanged();
    }, _$isLoadingAtom, name: '${_$isLoadingAtom.name}_set');
  }

  final _$fetchLifestyleNewsAsyncAction = AsyncAction('fetchLifestyleNews');

  @override
  Future fetchLifestyleNews({bool force = false}) {
    return _$fetchLifestyleNewsAsyncAction
        .run(() => super.fetchLifestyleNews(force: force));
  }

  final _$_LifeStyleStoreActionController =
      ActionController(name: '_LifeStyleStore');

  @override
  dynamic fetchLifestyleNewsComplete(List<Headlines> headlines) {
    final _$actionInfo = _$_LifeStyleStoreActionController.startAction();
    try {
      return super.fetchLifestyleNewsComplete(headlines);
    } finally {
      _$_LifeStyleStoreActionController.endAction(_$actionInfo);
    }
  }
}
