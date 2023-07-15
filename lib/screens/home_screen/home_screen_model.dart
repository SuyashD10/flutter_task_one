// To parse this JSON data, do
//
//     final employeeData = employeeDataFromJson(jsonString);

import 'dart:convert';

List<EmployeeData> employeeDataFromJson(String str) => List<EmployeeData>.from(json.decode(str).map((x) => EmployeeData.fromJson(x)));

String employeeDataToJson(List<EmployeeData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmployeeData {
  int? id;
  String? imageUrl;
  String? firstName;
  String? lastName;
  String? email;
  String? contactNumber;
  int? age;
  String? dob;
  double? salary;
  String? address;

  EmployeeData({
    this.id,
    this.imageUrl,
    this.firstName,
    this.lastName,
    this.email,
    this.contactNumber,
    this.age,
    this.dob,
    this.salary,
    this.address,
  });

  EmployeeData.fromJson(Map<String, dynamic> json){
    id= json["id"];
    imageUrl= json["imageUrl"];
    firstName= json["firstName"];
    lastName= json["lastName"];
    email= json["email"];
    contactNumber= json["contactNumber"];
    age= json["age"];
    dob= json["dob"];
    salary= json["salary"];
    address= json["address"];
  }


  Map<String, dynamic> toJson() => {
    "id": id,
    "imageUrl": imageUrl,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "contactNumber": contactNumber,
    "age": age,
    "dob": dob,
    "salary": salary,
    "address": address,
  };
}
