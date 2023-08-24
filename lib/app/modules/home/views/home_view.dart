import 'package:cpssoft_crud/app/data/models/user.dart';
import 'package:cpssoft_crud/app/modules/home/controllers/home_controller.dart';
import 'package:cpssoft_crud/app/modules/user_add/views/user_add_view.dart';
import 'package:cpssoft_crud/app/modules/widget/custom_dropdown.dart';
import 'package:cpssoft_crud/app/shared/constant_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  final HomeController _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(
              UserAddView(),
            );
          },
          backgroundColor: kPrimaryColor.withOpacity(0.9),
          foregroundColor: kBlackColor,
          child: Icon(
            Icons.add,
            color: kWhiteColor,
          ),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 20,
                        top: 15,
                        bottom: 15,
                      ),
                      decoration: BoxDecoration(
                        color: kGreyColor.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextFormField(
                        controller: _controller.searchController,
                        textAlignVertical: TextAlignVertical.center,
                        onChanged: _controller.searchQuery,
                        cursorColor: kBlackColor,
                        style: TextStyle(
                          color: kBlackColor,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Search by name',
                          prefixIcon: Icon(
                            Icons.search,
                          ),
                          prefixIconColor: kBlackColor,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              _controller.clearSearch();
                            },
                            child: Icon(
                              Icons.highlight_remove_sharp,
                              color: kBlackColor,
                            ),
                          ),
                          focusColor: kRedColor,
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 20,
                  ),
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: kPrimaryColor.withOpacity(0.7),
                    child: GestureDetector(
                      onTap: () {
                        Get.defaultDialog(
                          title: 'Filter',
                          content: Container(
                            height: MediaQuery.sizeOf(context).height * 0.3,
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Obx(
                                        () {
                                          final cityNames = _controller.cityList
                                              .map((city) => city.name)
                                              .toList();
                                          return CustomDropdown(
                                            listData: cityNames,
                                            hintText: 'Search by City',
                                            onChanged: (selectedCity) {
                                              _controller
                                                  .filterByCity(selectedCity!);
                                              Get.back();
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.filter_alt_outlined,
                        color: kWhiteColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Obx(
                        () => ListView.builder(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _controller.filteredUserList.length,
                          itemBuilder: (context, index) {
                            User user = _controller.filteredUserList[index];
                            if (user.name == '' &&
                                user.address == '' &&
                                user.email == '' &&
                                user.phoneNumber == '' &&
                                user.email == '') {
                              return SizedBox();
                            }
                            return Container(
                              margin: EdgeInsets.only(bottom: 10),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: kWhiteColor,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: kGreyColor.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(1, 2),
                                  ),
                                ],
                              ),
                              child: Container(
                                margin: EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      user.name == "" && user.name.isEmpty
                                          ? "Name : Null"
                                          : "Name : ${user.name}",
                                    ),
                                    Text(
                                      user.address == "" && user.address.isEmpty
                                          ? "Address : Null"
                                          : "Address : ${user.address}",
                                    ),
                                    Text(
                                      user.email == "" && user.email.isEmpty
                                          ? "Email : Null"
                                          : "Email : ${user.email}",
                                    ),
                                    Text(
                                      user.phoneNumber == "" &&
                                              user.phoneNumber.isEmpty
                                          ? "Phone : Null"
                                          : "Phone : ${user.phoneNumber}",
                                    ),
                                    Text(
                                      user.city == "" && user.city.isEmpty
                                          ? "City : Null"
                                          : "City : ${user.city}",
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
