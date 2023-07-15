import 'package:flutter/material.dart';
import 'package:flutter_task_one/screens/home_screen/component/add_employee_screen.dart';
import 'package:flutter_task_one/screens/home_screen/home_screen_controller.dart';
import 'package:get/get.dart';

import 'component/emp_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final homeController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          IconButton(onPressed: () {
            showSearch(context: context, delegate: CustomSearchDelegate());
          }, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {
            Get.bottomSheet(
              homeScreenBottomSheet(context)
            );
            //_scaffoldKey.currentState!.showBottomSheet((context) => sortBottomSheet(context));
          }
              ,padding: const EdgeInsets.only(top: 0), icon: const Icon(Icons.filter_list)),
        ],
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Employee List',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(() => SizedBox(
                    height: 560,
                    child: homeController.isLoading.value? const Center(child: CircularProgressIndicator(),) :ListView.builder(itemBuilder: (context,index){
                        return Card(
                          color: Colors.blue.shade50,
                          child: homeController.empDataList.isEmpty? const Text('No Data Found'): ListTile(
                            onTap: () {
                              homeController.empData.value = homeController.empDataList[index];
                              Get.to(()=> EmployeeDisplayCard());
                            },
                            contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 7),
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.network(homeController.empDataList[index].imageUrl!),
                            ),
                            title: Text('${homeController.empDataList[index].firstName} ${homeController.empDataList[index].lastName!}',style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                            subtitle: Row(children: [Expanded(child: Text('Age : ${homeController.empDataList[index].age}')),Expanded(child: Text('Salary : ${homeController.empDataList[index].salary}')),const Spacer(flex: 2,)],),
                          ),
                        );
                      },itemCount: homeController.empDataList.length,padding: const EdgeInsets.symmetric(vertical: 5),)

                  ),
                ),
              ],
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(()=>AddNewEmployee());
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Container homeScreenBottomSheet(BuildContext context) {
    return Container(
              height: MediaQuery.of(context).size.height / 3,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: GetX<HomeScreenController>(builder: (_){
                return Column(
                  children: [
                    const Text('SORT BY',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
                    const Divider(),
                    RadioListTile(value: 1, groupValue: homeController.radioValues.value,title: const Text('Salary -- Asc'), onChanged: (val){
                      homeController.updateRadioValues(int.parse(val.toString()));
                    }
                    ),
                    RadioListTile(value: 2, groupValue: homeController.radioValues.value,title: const Text('Salary -- Desc'), onChanged: (val){
                      homeController.updateRadioValues(int.parse(val.toString()));
                    }),
                    RadioListTile(value: 3, groupValue: homeController.radioValues.value,title: const Text('Age -- Asc'), onChanged: (val){
                      homeController.updateRadioValues(int.parse(val.toString()));
                    }),
                    RadioListTile(value: 4, groupValue: homeController.radioValues.value,title: const Text('Age -- Des'), onChanged: (val){
                      homeController.updateRadioValues(int.parse(val.toString()));
                    }),
                  ],
                );
              }

              ),
            );
  }

  // Container sortBottomSheet() {
  //   return Container(
  //     height: 400,
  //     padding: const EdgeInsets.symmetric(horizontal: 15),
  //     child:
  //
  //
  //   );
  // }
}
// Column(
// children: [
// GetX(builder: (_) {
// return Text('Clicks: ${homeController.count}');
// }),
// ElevatedButton(onPressed: () {
// homeController.increment();
// }, child: const Icon(Icons.add))
// ],
// ),


class CustomSearchDelegate extends SearchDelegate{
  final HomeScreenController controller = Get.find();
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){
        if(query.isEmpty) close(context, null);
        query = '';
      }, icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: () {
      close(context, null);
    }, icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {

    if(query.isNotEmpty){
      controller.empSearchDataList.value = controller.empDataList.where((emp) {
        String fName = emp.firstName!.toLowerCase();
        return fName.contains(query.toLowerCase());
      }).toList();
    }else{
      controller.empSearchDataList.value = [];
    }

    return ListView.builder(itemBuilder: (context,index){
      return ListTile(
        title: Text(controller.empSearchDataList[index].firstName!),
      );
    },itemCount: controller.empSearchDataList.length,);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.isNotEmpty){
      controller.empSearchDataList.value = controller.empDataList.where((emp) {

        String fName = emp.firstName!.toLowerCase();
        String lName = emp.lastName!.toLowerCase();
        return fName.contains(query.toLowerCase()) || lName.contains(query.toLowerCase());
      }).toList();
    }else{
        controller.empSearchDataList.value = [];
  }
    return ListView.builder(itemBuilder: (context,index){
      return ListTile(
        onTap: (){
          controller.empData.value = controller.empSearchDataList[index];
          Get.to(() => EmployeeDisplayCard());
        },
        title: Text('${controller.empSearchDataList[index].firstName} ${controller.empSearchDataList[index].lastName}'),
      );
    },itemCount: controller.empSearchDataList.length,);
  }

}

