// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sports_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SportsStore on _SportsStore, Store {
  final _$isLoadingAtom = Atom(name: '_SportsStore.isLoading');

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

  final _$fetchSportsNewsAsyncAction = AsyncAction('fetchSportsNews');

  @override
  Future fetchSportsNews({bool force = false}) {
    return _$fetchSportsNewsAsyncAction
        .run(() => super.fetchSportsNews(force: force));
  }

  final _$_SportsStoreActionController = ActionController(name: '_SportsStore');

  @override
  dynamic fetchSportsNewsComplete(List<Headlines> headlines) {
    final _$actionInfo = _$_SportsStoreActionController.startAction();
    try {
      return super.fetchSportsNewsComplete(headlines);
    } finally {
      _$_SportsStoreActionController.endAction(_$actionInfo);
    }
  }
}
