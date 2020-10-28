import 'package:flutter/material.dart';
import 'package:shofri/api/api.dart';
import 'package:shofri/models/flash_deal.dart';

class FlashDealProvider with ChangeNotifier {
  List<FlashDeal> _flashDeal = [];
  List<FlashDeal> get flashDeal {
    if (_flashDeal?.isEmpty ?? true) {
      _getFlashDeal();
    }

    return _flashDeal ?? [];
  }

  _getFlashDeal() async {
    final response = await api.get("flash_deals/read.php?pageno=1&pagesize=30");
    if (response?.statusCode == 200) {
      _flashDeal = (response.data["document"]["records"] as List)
          .map((e) => FlashDeal.fromJson(e))
          .toList();
      notifyListeners();
      return;
    }
  }
}
