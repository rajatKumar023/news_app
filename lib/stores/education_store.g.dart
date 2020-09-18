// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EducationStore on _EducationStore, Store {
  final _$isLoadingAtom = Atom(name: '_EducationStore.isLoading');

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

  final _$fetchEducationNewsAsyncAction = AsyncAction('fetchEducationNews');

  @override
  Future fetchEducationNews({bool force = false}) {
    return _$fetchEducationNewsAsyncAction
        .run(() => super.fetchEducationNews(force: force));
  }

  final _$_EducationStoreActionController =
      ActionController(name: '_EducationStore');

  @override
  dynamic fetchEducationNewsComplete(List<Headlines> headlines) {
    final _$actionInfo = _$_EducationStoreActionController.startAction();
    try {
      return super.fetchEducationNewsComplete(headlines);
    } finally {
      _$_EducationStoreActionController.endAction(_$actionInfo);
    }
  }
}
