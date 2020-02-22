// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'headlines_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HeadlinesStore on _HeadlinesStore, Store {
  final _$isLoadingAtom = Atom(name: '_HeadlinesStore.isLoading');

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

  final _$fetchHeadlinesAsyncAction = AsyncAction('fetchHeadlines');

  @override
  Future fetchHeadlines() {
    return _$fetchHeadlinesAsyncAction.run(() => super.fetchHeadlines());
  }

  final _$_HeadlinesStoreActionController =
      ActionController(name: '_HeadlinesStore');

  @override
  dynamic fetchHeadlinesComplete(List<Headlines> headlines) {
    final _$actionInfo = _$_HeadlinesStoreActionController.startAction();
    try {
      return super.fetchHeadlinesComplete(headlines);
    } finally {
      _$_HeadlinesStoreActionController.endAction(_$actionInfo);
    }
  }
}
