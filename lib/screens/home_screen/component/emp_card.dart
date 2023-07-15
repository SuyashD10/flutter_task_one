import 'package:flutter/material.dart';
import 'package:flutter_task_one/app_constants.dart';
import 'package:flutter_task_one/screens/home_screen/home_screen_controller.dart';
import 'package:get/get.dart';


class EmployeeDisplayCard extends StatelessWidget {
  EmployeeDisplayCard({super.key});
  final HomeScreenController ctrl = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Employee Info'),),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            Center(
              child: CircleAvatar(
                radius: 90,
                foregroundImage: NetworkImage(ctrl.empData.value.imageUrl!)
              ),
            ),
            const SizedBox(
              height: 30,
              child: Divider(thickness: 2,indent: 100,endIndent: 100,),
            ),
            Text('Name : ${ctrl.empData.value.firstName} ${ctrl.empData.value.lastName}',style: AppConstant.empCardTextStyle(size: 20,weight: FontWeight.w600),),
            const SizedBox(
              height: 10,
            ),
            Text('Contact : ${ctrl.empData.value.contactNumber}',style: AppConstant.empCardTextStyle(size: 20,weight: FontWeight.w600),),
            const SizedBox(
              height: 10,
            ),
            Text('Email : ${ctrl.empData.value.email}',style: AppConstant.empCardTextStyle(size: 20,weight: FontWeight.w600),),
            const SizedBox(
              height: 10,
            ),
            Text('Dob : ${ctrl.empData.value.dob}',style: AppConstant.empCardTextStyle(size: 20,weight: FontWeight.w600),),
            const SizedBox(
              height: 10,
            ),
            Text('Age : ${ctrl.empData.value.age}',style: AppConstant.empCardTextStyle(size: 20,weight: FontWeight.w600),),
            const SizedBox(
              height: 10,
            ),
            Text('Salary : ${ctrl.empData.value.salary}',style: AppConstant.empCardTextStyle(size: 20,weight: FontWeight.w600),),
            const SizedBox(
              height: 10,
            ),
            Text('Address : ${ctrl.empData.value.address}',style: AppConstant.empCardTextStyle(size: 20,weight: FontWeight.w600),),
          ],
        ),
      ),
    );
  }
}
