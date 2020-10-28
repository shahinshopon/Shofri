import 'package:flutter/widgets.dart';
import 'package:shofri/api/api.dart';
import 'package:shofri/models/category.dart';

class CategoryProvider with ChangeNotifier {
  List<Category> _category = [];
  List<Category> get category {
    if (_category.isEmpty ?? true) {
      _getCategory();
    }

    return _category ?? [];
  }

  _getCategory() async {
    final response = await api.get("categories/read.php?pageno=1&pagesize=30");
    if (response?.statusCode == 200) {
      _category = (response.data["document"]["records"] as List)
          .map((e) => Category.fromJson(e))
          .toList();
      notifyListeners();
      return;
    }
  }
}
