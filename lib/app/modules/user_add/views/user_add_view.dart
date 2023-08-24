import 'package:cpssoft_crud/app/modules/home/views/home_view.dart';
import 'package:cpssoft_crud/app/modules/user_add/controllers/user_add_controller.dart';
import 'package:cpssoft_crud/app/modules/widget/custom_text_form_field.dart';
import 'package:cpssoft_crud/app/shared/constant_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserAddView extends StatelessWidget {
  final UserAddController _controller = Get.put(UserAddController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: GestureDetector(
            onTap: () {
              Get.offAll(
                () => HomeView(),
              );
            },
            child: CircleAvatar(
              backgroundColor: kGreyColor.withOpacity(0.6),
              child: Padding(
                padding: const EdgeInsets.only(left: 9),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: kBlackColor,
                  size: 20,
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        'Add User',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text('Name'),
                ),
                CustomTextFormField(
                  controller: _controller.nameController,
                  hintText: 'Input name',
                  isBorderOutlined: true,
                  margin: EdgeInsets.only(
                    top: 5,
                    bottom: 10,
                  ),
                ),
                Text('Address'),
                CustomTextFormField(
                  controller: _controller.addressController,
                  hintText: 'Input address',
                  isBorderOutlined: true,
                  margin: EdgeInsets.only(
                    top: 5,
                    bottom: 10,
                  ),
                ),
                Text('Email'),
                CustomTextFormField(
                  controller: _controller.emailController,
                  hintText: 'Input email',
                  isBorderOutlined: true,
                  margin: EdgeInsets.only(
                    top: 5,
                    bottom: 10,
                  ),
                ),
                Text('Phone Number'),
                CustomTextFormField(
                  controller: _controller.phoneNumberController,
                  hintText: 'Input phone number',
                  isBorderOutlined: true,
                  margin: EdgeInsets.only(
                    top: 5,
                    bottom: 10,
                  ),
                ),
                Text('City'),
                CustomTextFormField(
                  controller: _controller.cityController,
                  hintText: 'Input city',
                  isBorderOutlined: true,
                  margin: EdgeInsets.only(
                    top: 5,
                    bottom: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: kBackgroundColor,
          elevation: 0,
          child: GestureDetector(
            onTap: () {
              Get.defaultDialog(
                title: 'Save data?',
                content: Column(
                  children: [
                    Text('The data will be saved'),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Get.offAll(
                                  () => UserAddView(),
                                );
                              },
                              child: Container(
                                width: MediaQuery.sizeOf(context).width,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: kWhiteColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                final userData = {
                                  "name": _controller.nameController.text,
                                  "address": _controller.addressController.text,
                                  "email": _controller.emailController.text,
                                  "phoneNumber":
                                      _controller.phoneNumberController.text,
                                  "city": _controller.cityController.text,
                                };
                                _controller.addUser(userData);
                                Get.offAll(
                                  () => HomeView(),
                                );
                              },
                              child: Container(
                                width: MediaQuery.sizeOf(context).width,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    'Ok',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: kWhiteColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.all(10),
              width: MediaQuery.sizeOf(context).width,
              height: 50,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: kWhiteColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
