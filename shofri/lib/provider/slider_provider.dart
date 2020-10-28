import 'package:flutter/material.dart';
import 'package:shofri/api/api.dart';
import 'package:shofri/models/slider.dart';

class SliderProvider with ChangeNotifier {
  List<SliderModel> _slider;
  List<SliderModel> get slider {
    if (_slider == null) {
      getSlider();
    }

    return slider;
  }

  getSlider() async {
    final response = await api.get("sliders/read.php");
    if (response?.statusCode == 200) {
      _slider = (response.data["document"]["records"] as List)
          .map((e) => SliderModel.fromJson(e))
          .toList();
      notifyListeners();
      return;
    }
  }
}
