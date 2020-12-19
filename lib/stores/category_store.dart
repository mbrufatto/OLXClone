import 'package:mobx/mobx.dart';
import 'package:xlo_clone/models/category.dart';
import 'package:xlo_clone/repositories/category_repository.dart';

part 'category_store.g.dart';

class CategoryStore = _CategoryStore with _$CategoryStore;

abstract class _CategoryStore with Store {
  _CategoryStore() {
    _loadCategories();
  }

  ObservableList<Category> categoryList = ObservableList<Category>();

  @computed
  List<Category> get allCategoryList =>
      List.from(categoryList)..insert(0, Category('*', 'Todas'));

  @action
  void setCategories(List<Category> categories) {
    categoryList.clear();
    categoryList.addAll(categories);
  }

  @observable
  String error;

  @action
  void setError(String value) => error = value;

  Future<void> _loadCategories() async {
    try {
      final categories = await CategoryRepository().getlist();
      setCategories(categories);
    } catch (e) {
      setError(e);
    }
  }
}
