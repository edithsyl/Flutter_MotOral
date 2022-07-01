import 'dart:async';

import 'package:beta_version/repositories/category/category_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/category_model.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  StreamSubscription? _categorySubscription;
  final CategoryRepository _categoryRepository;

  CategoryBloc({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository,
        super(CategoryLoading());

  @override
  Stream<CategoryState> mapEventToState(
    CategoryEvent event,
  ) async* {
    if (event is LoadCategories) {
      yield* _mapLoadCategoriesToState();
    }
    if (event is UpdateCategories) {
      yield* _mapUpdateCategoriesToState(event);
    }
  }

  Stream<CategoryState> _mapLoadCategoriesToState() async* {
    _categorySubscription?.cancel();
    _categorySubscription = _categoryRepository
        .getAllCategories()
        .listen((categories) => add(UpdateCategories(categories)));
  }

  Stream<CategoryState> _mapUpdateCategoriesToState(
      UpdateCategories event) async* {
    yield CategoryLoaded(categories: event.categories);
  }
}

// review: https://www.youtube.com/watch?v=O8-Q6RyO8QY&ab_channel=MaxonFlutter