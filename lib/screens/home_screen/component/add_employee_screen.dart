import 'package:flutter/material.dart';
import 'package:flutter_task_one/app_constants.dart';
import 'package:flutter_task_one/screens/home_screen/home_screen_controller.dart';
import 'package:get/get.dart';

class AddNewEmployee extends StatelessWidget {
  AddNewEmployee({super.key});
  final HomeScreenController controller = Get.find();
  //final homeController = Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add New Employee'),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppConstant.commonTextField(
                        controller: controller.firstNameController,
                        maxLength: 20,
                        hintText: 'First Name',
                        validate: (firstName) {
                          if(firstName==null||firstName.isEmpty){
                            return 'First Name must be filled out';
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 15,
                    ),
                    AppConstant.commonTextField(
                        controller: controller.lastNameController,
                        maxLength: 20,
                        hintText: 'Last Name',
                        validate: (lastName) {
                          if(lastName==null||lastName.isEmpty){
                            return 'Last Name must be filled out';
                          }
                          return null;
                        }),

                    const SizedBox(
                      height: 15,
                    ),
                    AppConstant.commonTextField(
                        controller: controller.contactNoController,
                        maxLength: 10,
                        hintText: 'Contact Number',
                        keyboardType: TextInputType.phone,
                        validate: (contactNo) {
                          if(contactNo==null||contactNo.isEmpty){
                            return 'Contact No must be filled out';
                          }
                          return null;
                        }),

                    const SizedBox(
                      height: 15,
                    ),
                    AppConstant.commonTextField(
                        controller: controller.emailController,
                        maxLength: 50,
                        hintText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        validate: (email) {
                      if(email==null||email.isEmpty){
                        return 'Email must be filled out';
                      }
                      return null;
                    }),
                    const SizedBox(
                      height: 15,
                    ),
                    AppConstant.customDatePicker(
                        controller: controller.dobController,
                        hintText: 'dob',
                        onPress: () {
                          controller.pickDOBDate();
                        },
                        validate: (dob) {
                          if(dob==null||dob.isEmpty){
                            return 'DOB must be filled out';
                          }
                          return null;
                        }
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    AppConstant.commonTextField(
                        controller: controller.ageController,
                        maxLength: 2,
                        hintText: 'Age',
                        keyboardType: TextInputType.number,
                        validate: (age) {
                          if(age==null||age.isEmpty){
                            return 'Age must be filled out';
                          }
                          return null;
                        }
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    AppConstant.commonTextField(
                        controller: controller.salaryController,
                        maxLength: 4,
                        hintText: 'Salary',
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        validate: (salary) {
                          if(salary==null||salary.isEmpty){
                            return 'Salary must be filled out';
                          }
                          return null;
                        }
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    AppConstant.commonTextField(
                        controller: controller.addressController,
                        maxLength: 50,
                        hintText: 'Address',
                        keyboardType: TextInputType.text,
                        validate: (address) {
                          if(address==null||address.isEmpty){
                            return 'Address must be filled out';
                          }
                          return null;
                        }
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(onPressed: () {
                      controller.addNewEmployee();
                    }, child: const Text('ADD EMPLOYEE'))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
