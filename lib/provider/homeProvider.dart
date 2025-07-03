import 'dart:convert';

import 'package:flutter/material.dart';
import '../model/homeModel.dart';
import 'package:http/http.dart' as http;

class HomeProvider with ChangeNotifier {
  List<HomeField> _homeDataList = [];
  bool _isLoading = false;
  String? _error;

  List<HomeField> get homeDataList => _homeDataList;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchHomeData() async {
    _isLoading = true;
    notifyListeners();

    try {
      final token = await getAuthToken();
      print(token);
      final response = await http.get(
        Uri.parse(
            'https://s419.previewbay.com/fragrance-b2b-backend/api/v1/home'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final fields = responseData["data"]["home_fields"];

        _homeDataList = List<HomeField>.from(
          fields.map((field) => HomeField.fromJson(field)),
        );

        // _homeDataList = List<HomeField>.from(
        //   fields.map((field) => HomeField.fromJson(field)),
        // );
        print(fields);

        _error = null;
      } else {
        _error = 'Failed to load data: ${response.statusCode}';
      }
    } catch (e) {
      _error = 'Error fetching data: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<String?> getAuthToken() async {
    try {
      final response = await http.post(
        Uri.parse(
            "https://s419.previewbay.com/fragrance-b2b-backend/api/v1/anonymous-login?device_token=test_token&device_type=1"),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data["data"]["access_token"];
      }
    } catch (e) {
      print('Error getting auth token: $e');
    }
    return null;
  }
}
