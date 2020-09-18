// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entertainment_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EntertainmentStore on _EntertainmentStore, Store {
  final _$isLoadingAtom = Atom(name: '_EntertainmentStore.isLoading');

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

  final _$fetchEntertainmentNewsAsyncAction =
      AsyncAction('fetchEntertainmentNews');

  @override
  Future fetchEntertainmentNews({bool force = false}) {
    return _$fetchEntertainmentNewsAsyncAction
        .run(() => super.fetchEntertainmentNews(force: force));
  }

  final _$_EntertainmentStoreActionController =
      ActionController(name: '_EntertainmentStore');

  @override
  dynamic fetchEntertainmentNewsComplete(List<Headlines> headlines) {
    final _$actionInfo = _$_EntertainmentStoreActionController.startAction();
    try {
      return super.fetchEntertainmentNewsComplete(headlines);
    } finally {
      _$_EntertainmentStoreActionController.endAction(_$actionInfo);
    }
  }
}
