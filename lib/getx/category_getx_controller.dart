
import 'package:budget_planner_project/Database/controllers/category_db_controller.dart';
import 'package:budget_planner_project/models/category.dart';
import 'package:get/get.dart';

class CategoryGetxController extends GetxController {
  List<Category> category = <Category>[];
  CategoryDbController dbController = CategoryDbController();
  RxDouble totalExpenses = 0.0.obs;
  RxDouble totalIncomes = 0.0.obs;

  static CategoryGetxController get to => Get.find();

  @override
  void onInit() {
    readCategory();
    super.onInit();
  }

  @override
  void onClose() {
    category.clear();
    super.onClose();
  }

  Future<void> readCategory() async {
    category = await dbController.read();
    update();
  }

  Future<bool> createCategory(Category newCategory) async {
    int id = await dbController.create(newCategory);
    if (id != 0) {
      newCategory.id = id;
      category.add(newCategory);
      update();
      return true;
    }
    return false;
  }

  Future<bool> updateCategory(Category updatedCategory) async {
    bool updated = await dbController.update(updatedCategory);
    if (updated) {
      int index =
          category.indexWhere((element) => element.id == updatedCategory.id);
      if (index != -1) {
        category[index] = updatedCategory;
        update();
        return true;
      }
    }
    return false;
  }

  Future<void> deleteAllRows() async {
    await dbController.deleteAllRows();
    category.clear();
  }

  String getCategoryName(int id){
    int index = category.indexWhere((element) => id == element.id);
    return category[index].name;
  }

}
