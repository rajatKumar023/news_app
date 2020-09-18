// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchStore on _SearchStore, Store {
  final _$isLoadingAtom = Atom(name: '_SearchStore.isLoading');

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

  final _$searchNewsAsyncAction = AsyncAction('searchNews');

  @override
  Future searchNews(String query, {bool force = false}) {
    return _$searchNewsAsyncAction
        .run(() => super.searchNews(query, force: force));
  }

  final _$_SearchStoreActionController = ActionController(name: '_SearchStore');

  @override
  dynamic searchNewsComplete(List<Headlines> headlines) {
    final _$actionInfo = _$_SearchStoreActionController.startAction();
    try {
      return super.searchNewsComplete(headlines);
    } finally {
      _$_SearchStoreActionController.endAction(_$actionInfo);
    }
  }
}
