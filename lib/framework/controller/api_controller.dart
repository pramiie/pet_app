import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api_end_point.dart';
import '../dio_client.dart';

final cityController = ChangeNotifierProvider((ref) => CityController());

  class CityController extends ChangeNotifier {
  bool isLoading = false;
  List<String> cityList = [];
  final cityController=TextEditingController();

  Future<void> getCity() async {
    isLoading = true;
    cityList = [];
    try {
      final response =
      await DioClient.dioClient.getAPI(endPoint: APIEndPoint.getCity);
      if (response.statusCode == 200) {
        isLoading = false;
        print(response.data);
        for (var i in response.data['data']) {
          cityList.add(i.toString());
        }
      } else {
        isLoading = false;
        cityList = [];
      }
    } catch (e) {
      isLoading = false;
      Future.error(e.toString()); // Corrected error handling
    }
    notifyListeners();
  }
}
