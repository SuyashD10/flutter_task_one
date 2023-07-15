import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter_task_one/dio_client.dart';
import 'package:flutter_task_one/screens/home_screen/home_screen_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeScreenController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final radioValues = 0.obs;
  final selectedDate = DateTime(DateTime.now().year - 18).obs;
  final employeeData = EmployeeData().obs;
  final empDataList = <EmployeeData>[].obs;
  final empSearchDataList = <EmployeeData>[].obs;
  final empData = EmployeeData().obs;

  final firstNameController  = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final contactNoController = TextEditingController();
  final salaryController = TextEditingController();
  final dobController = TextEditingController();
  final ageController = TextEditingController();
  final addressController = TextEditingController();
  DioClient dioClient = DioClient();

  void updateRadioValues(int? val) {
    radioValues.value = val!;
    sortingEmployees(val);
    Get.back();
  }

  void sortingEmployees(int order) {
    //order :  1 -Ascending Salary, 2-Descending Salary,3 -Ascending Age, 4-Descending Age,
    if (order == 1) {
      empDataList.sort((item1, item2) =>
          item1.salary!.round().compareTo(item2.salary!.round()));
    } else if (order == 2) {
      empDataList.sort((item1, item2) =>
          item2.salary!.round().compareTo(item1.salary!.round()));
    } else if (order == 3) {
      empDataList.sort((item1, item2) => item1.age!.compareTo(item2.age!));
    } else if (order == 4) {
      empDataList.sort((item1, item2) => item2.age!.compareTo(item1.age!));
    }
  }

  Future<void> getEmployeeData() async {
    dio.Response response;
    try {
      response = await dioClient.dio.get('employee',
          queryParameters: {'noofRecords': 10, 'idStarts': 1001});
      print(response.statusCode);
      if (response.statusCode == 200) {
        empDataList.value = employeeDataFromJson(jsonEncode(response.data));

        // List<EmployeeData> data = employeeDataFromJson(response.data);
        // return data;
      }
    } catch (e) {
      print(e);
    }
  }

  pickDOBDate() async {
    DateTime? pickDate = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(DateTime.now().year - 80),
        lastDate: DateTime(DateTime.now().year - 18));
    if (pickDate != null && pickDate != selectedDate.value) {
      selectedDate.value = pickDate;
      dobController.text = DateFormat('dd-MM-yyyy').format(pickDate).toString();
      ageController.text = (DateTime.now().year - pickDate.year).toString();
    }
  }

  addNewEmployee() {
    if(formKey.currentState!.validate()){
      empData.value = EmployeeData(
          id: empDataList.last.id! + 1,
          imageUrl: 'https://hub.dummyapis.com/Image?text=${firstNameController.text[0]}${lastNameController.text[0]}&height=120&width=120',
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          email: emailController.text,
          contactNumber: contactNoController.text,
          dob: dobController.text,
          age: int.parse(ageController.text),
          salary: double.parse(salaryController.text),
          address: addressController.text
      );
      empDataList.add(empData.value);
      Get.back();
      Get.snackbar('Alert', 'Employee Added Successfully');

    }

  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getEmployeeData();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
