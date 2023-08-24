import 'dart:convert';
import 'package:cpssoft_crud/app/data/models/city.dart';
import 'package:cpssoft_crud/app/data/models/user.dart';
import 'package:cpssoft_crud/app/shared/api_endpoint.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  RxList<User> userList = <User>[].obs;
  RxList<City> cityList = <City>[].obs;
  RxList<User> filteredUserList = <User>[].obs;
  RxString searchQuery = ''.obs;

  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getUser();
    getCity();
    ever(searchQuery, (_) => searchUser(searchQuery.value));
  }

  // Get User
  Future<void> getUser() async {
    final Uri url = Uri.parse(Endpoint.userEndpoint);
    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      final List<User> getUserList = (json.decode(response.body) as List)
          .map((data) => User.fromJson(data))
          .toList();

      getUserList
          .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
      userList.assignAll(getUserList);
      filteredUserList.assignAll(userList);
    } else {
      print('Failed to get data');
    }
  }

  // Get City
  Future<void> getCity() async {
    final Uri url = Uri.parse(Endpoint.cityEndpoint);
    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      final List<City> getCityList = (json.decode(response.body) as List)
          .map((data) => City.fromJson(data))
          .toList();
      cityList.assignAll(getCityList);
    } else {
      print('Failed to get data');
    }
  }

  // Search User
  void searchUser(String query) {
    if (query.isEmpty) {
      filteredUserList.assignAll(userList);
    } else {
      filteredUserList.assignAll(userList
          .where(
              (user) => user.name.toLowerCase().contains(query.toLowerCase()))
          .toList());
    }
  }

  // Clear Search
  void clearSearch() {
    searchController.clear();
    searchQuery.value = '';
  }

  // Filter By City
  void filterByCity(String city) {
    if (city.isEmpty) {
      filteredUserList.assignAll(userList);
    } else {
      filteredUserList.assignAll(userList
          .where((user) => user.city.toLowerCase() == city.toLowerCase())
          .toList());
    }
  }
}
