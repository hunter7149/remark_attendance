import 'package:attendance/app/api/service/prefrences.dart';
import 'package:attendance/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxMap<String, dynamic> userInfo = <String, dynamic>{
    "userId": 123456,
    "profileImage": "web link",
    "personal": <String, dynamic>{
      "empName": "Mohammad Khalid Bin Oalid",
      "empDob": "4/9/1998",
      "empFather": "Mohammad Toriqul Islam",
      "empMother": "Mosammat Nurjahan Begum",
      "empFatherProf": "Sub Inspector of police",
      "empMotherProf": "Housewife",
      "gender": "Male",
      "bloodGroup": "O+",
      "height": "5.8'",
      "weight": 50,
      "nationality": "Bangladeshi",
      "nid": "1234567890695",
      "religion": "Islam",
      "tinNo": "1231230123123",
      "phone": "01303146132",
      "email": "emonnatbd@gmail.com",
      "maritalStatus": "married",
      "spouseName": "Labonni Akter",
      "spouseDob": "05/09/2001",
      "noOfChildren": 0,
      "children1name": "Abir",
      "children1dob": "10/1/2012",
      "children2name": "Kaniya",
      "children2dob": "3/1/1997",
      "passport": "123129834091283",
      "passportExp": "09/10/2029",
      "drivingLicense": "12031029310293",
      "drivingLicenseExp": "10/12/2028"
    },
    "address": {
      "present": {
        "division": "Dhaka",
        "district": "Dhaka",
        "policeStation": "Vatara",
        "postOffice": "Vatara",
        "postCode": 1229,
        "village": "Block G,Bashundhara RA"
      },
      "permanent": {
        "division": "Natore",
        "district": "Natore",
        "policeStation": "Natore sadar",
        "postOffice": "Natore sadar",
        "postCode": 6400,
        "village": "Mollikhati"
      }
    },
    "academic": [
      {
        "examName": "BSc.",
        "group": "CSE",
        "board": "Dhaka",
        "institute": "American International University-Bangladesh",
        "division": "Dhaka",
        "passingYear": "2021",
        "result": "3.53",
        "scale": "4.00",
        "copy": "wesitelink"
      },
      {
        "examName": "HSC",
        "group": "science",
        "board": "Rajshahi",
        "institute": "Ns Govt. College",
        "division": "Rajshahi",
        "passingYear": "2016",
        "result": "4.75",
        "scale": "5.00",
        "copy": "wesitelink"
      },
      {
        "examName": "SSC",
        "group": "science",
        "board": "Rajshahi",
        "institute": "Natore Govt. Boys' High School",
        "division": "Rajshahi",
        "passingYear": "2014",
        "result": "5.00",
        "scale": "5.00",
        "copy": "wesitelink"
      },
    ],
    "experience": [
      {
        "organization": "Pulse Tech Ltd.",
        "department": "Software",
        "jobTitle": "Mobile Application Developer",
        "startDate": "08/06/2021",
        "endDate": "31/01/2021",
        "tenure": "N/A",
        "reason": "Job switch",
        "responsibility": "Develop mobile application"
      }
    ],
    "contacts": {
      "emergency": {
        "name": "Laboni Akter",
        "organization": "N/A",
        "contactNo": "01723515467",
        "email": "arshi@gmail.com",
        "address": "Dhaka",
        "nid": "12312312",
        "relation": "spouse"
      },
      "reference": {
        "name": "Laboni Akter",
        "organization": "N/A",
        "contactNo": "01723515467",
        "email": "arshi@gmail.com",
        "address": "Dhaka",
        "nid": "12312312",
        "relation": "spouse"
      },
      "nominee": {
        "name": "Laboni Akter",
        "organization": "N/A",
        "contactNo": "01723515467",
        "email": "arshi@gmail.com",
        "address": "Dhaka",
        "nid": "12312312",
        "relation": "spouse"
      },
      "guarantor": {
        "name": "Laboni Akter",
        "organization": "N/A",
        "contactNo": "01723515467",
        "email": "arshi@gmail.com",
        "address": "Dhaka",
        "nid": "12312312",
        "relation": "spouse"
      }
    },
    "training": [
      {
        "name": "Microsoft office",
        "type": "Technical",
        "institute": "Bangladesh Technical Board",
        "startDate": "10/2/2013",
        "endDate": "12/9/2013",
        "duration": "6 months",
        "copy": "web link"
      }
    ],
    "healthinfo": [
      {
        "issueType": "Fever",
        "description": "High fever",
        "prescriptiom": "provided"
      }
    ],
    "languages": [
      {
        "name": "English",
        "speaking": "good",
        "reading": "good",
        "writing": "good",
        "understanding": "good",
        "remarks": "N/A"
      }
    ]
  }.obs;

  requestSignOut() {
    Pref.removeData(key: Pref.USER_ID);
    Pref.removeData(key: Pref.USER_PASSWORD);
    Pref.removeData(key: Pref.LOGIN_INFORMATION);
    Get.offNamed(Routes.LOGINSCREEN);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
