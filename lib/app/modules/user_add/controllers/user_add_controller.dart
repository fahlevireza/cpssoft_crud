import 'dart:convert';
import 'package:cpssoft_crud/app/modules/home/controllers/home_controller.dart';
import 'package:cpssoft_crud/app/shared/api_endpoint.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserAddController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  // Add User
  Future<void> addUser(Map<String, dynamic> userData) async {
    final Uri url = Uri.parse(Endpoint.userEndpoint);
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(userData),
    );
    print(response.statusCode);

    if (response.statusCode == 201) {
      print('User added successfully');
    } else {
      print('Failed to add user. Status code: ${response.statusCode}');
    }

    Get.find<HomeController>().getUser();
  }
}
