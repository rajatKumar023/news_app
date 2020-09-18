// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'technology_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TechnologyStore on _TechnologyStore, Store {
  final _$isLoadingAtom = Atom(name: '_TechnologyStore.isLoading');

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

  final _$fetchTechnologyNewsAsyncAction = AsyncAction('fetchTechnologyNews');

  @override
  Future fetchTechnologyNews({bool force = false}) {
    return _$fetchTechnologyNewsAsyncAction
        .run(() => super.fetchTechnologyNews(force: force));
  }

  final _$_TechnologyStoreActionController =
      ActionController(name: '_TechnologyStore');

  @override
  dynamic fetchTechnologyNewsComplete(List<Headlines> headlines) {
    final _$actionInfo = _$_TechnologyStoreActionController.startAction();
    try {
      return super.fetchTechnologyNewsComplete(headlines);
    } finally {
      _$_TechnologyStoreActionController.endAction(_$actionInfo);
    }
  }
}
