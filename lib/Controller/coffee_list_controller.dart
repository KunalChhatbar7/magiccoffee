import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:magiccoffee/bloc/APIConstants.dart';
import 'package:magiccoffee/bloc/NatworkCubit.dart';
import 'package:magiccoffee/model/coffe_list_model.dart';

class CoffeList extends ChangeNotifier {
  NetworkCubit? networkCubit;
  List<CoffeeListModel> coffeeListModel = [];
  // late Map<String, String> body;
  getListData(context) async {
    http.Response? response;
    response = await NetworkCubit(context: context).networkGetRequest(
      APIConstants.CoffeeList,
      // body,
    );

    print("response ${response}");

    if (response != null && response.statusCode == 200) {
      // var responseData = json.decode(response.body);

      // print(responseData.toString());
      final List parsedList = json.decode(response.body);
      coffeeListModel.clear();
      coffeeListModel =
          parsedList.map((val) => CoffeeListModel.fromJson(val)).toList();
      // CoffeeListModel? coffeeListModel = CoffeeListModel.fromJson(responseData);

      return coffeeListModel;
    } else {
      print("no data");
    }
  }

  notifyListeners();
}
