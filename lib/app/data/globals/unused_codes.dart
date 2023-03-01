// Stack(
//           children: [
//             Positioned(
//               top: 0,
//               left: 0,
//               bottom: 60,
//               right: 0,
//               child: SingleChildScrollView(
//                   child: Column(
//                 children: [
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
//                     width: double.maxFinite,
//                     // height: 400,
//                     padding: EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                       color: Colors.grey.shade100,
//                       borderRadius: BorderRadius.circular(10),

//                       // border: Border.all(width: 0.5, color: Colors.grey.shade400)
//                     ),
//                     child: Column(children: [
//                       Container(
//                         child: Image.asset(
//                           'assets/logo/user.png',
//                           height: 100,
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         "Mohammad Khalid Bin Oalid",
//                         style: TextStyle(
//                             fontSize: 20,
//                             color: Colors.grey.shade700,
//                             fontWeight: FontWeight.w500),
//                       ),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       Text(
//                         "IT executive (Software)",
//                         style: TextStyle(
//                             fontSize: 16,
//                             color: Colors.grey.shade600,
//                             fontWeight: FontWeight.w400),
//                       ),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       Text(
//                         "Employee Id: 662",
//                         style: TextStyle(
//                             fontSize: 16,
//                             color: Colors.grey.shade600,
//                             fontWeight: FontWeight.w400),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           leaveCountView(
//                               title: "Total leave", enjoyed: "06", total: "26"),
//                           leaveCountView(
//                               title: "Sick leave", enjoyed: "02", total: "13"),
//                           leaveCountView(
//                               title: "Casual leave", enjoyed: "04", total: "13")
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       )
//                     ]),
//                   ),
//                   Obx(() => controller.leaveApplication.isEmpty
//                       ? Container()
//                       : Container(
//                           margin: EdgeInsets.symmetric(
//                             horizontal: 16,
//                           ),
//                           // padding: EdgeInsets.symmetric(horizontal: 5),
//                           width: double.maxFinite,
//                           decoration: BoxDecoration(
//                               color: Colors.grey.shade200,
//                               borderRadius: BorderRadius.circular(10)),
//                           child: Column(
//                             children: [
//                               Container(
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 10, vertical: 10),
//                                 decoration: BoxDecoration(
//                                     color: AppColors.greyColor,
//                                     borderRadius: BorderRadius.only(
//                                         topLeft: Radius.circular(10),
//                                         topRight: Radius.circular(10))),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text(
//                                       "Last applied leave application",
//                                       style: TextStyle(
//                                           fontSize: 18,
//                                           color: Colors.grey.shade900,
//                                           fontWeight: FontWeight.w500),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Container(
//                                 child: Column(
//                                   children: [
//                                     SizedBox(
//                                       height: 10,
//                                     ),
//                                     Text(
//                                       "Leave type: ${controller.leaveApplication['type']}",
//                                       style: TextStyle(
//                                           fontSize: 18,
//                                           color: Colors.grey.shade900,
//                                           fontWeight: FontWeight.w500),
//                                     ),
//                                     SizedBox(
//                                       height: 10,
//                                     ),
//                                     Text(
//                                       "Start date: ${controller.leaveApplication['start_date']}",
//                                       style: TextStyle(
//                                           fontSize: 18,
//                                           color: Colors.grey.shade900,
//                                           fontWeight: FontWeight.w500),
//                                     ),
//                                     SizedBox(
//                                       height: 10,
//                                     ),
//                                     Text(
//                                       "Total days: ${controller.leaveApplication['days']}",
//                                       style: TextStyle(
//                                           fontSize: 18,
//                                           color: Colors.grey.shade900,
//                                           fontWeight: FontWeight.w500),
//                                     ),
//                                     SizedBox(
//                                       height: 10,
//                                     ),
//                                     Text(
//                                       "Reason: ${controller.leaveApplication['reasonOfLeave']}",
//                                       style: TextStyle(
//                                           fontSize: 18,
//                                           color: Colors.grey.shade900,
//                                           fontWeight: FontWeight.w500),
//                                     ),
//                                     SizedBox(
//                                       height: 10,
//                                     ),
//                                     Text(
//                                       "Applied at: ${controller.leaveApplication['applicationDate']}",
//                                       style: TextStyle(
//                                           fontSize: 18,
//                                           color: Colors.grey.shade900,
//                                           fontWeight: FontWeight.w500),
//                                     ),
//                                     SizedBox(
//                                       height: 10,
//                                     ),
//                                     Container(
//                                       width: double.maxFinite,
//                                       // height: 35,
//                                       padding: EdgeInsets.all(10),
//                                       decoration: BoxDecoration(
//                                           color: controller.leaveApplication[
//                                                       'status'] ==
//                                                   "pending"
//                                               ? Colors.deepOrange
//                                               : controller.leaveApplication[
//                                                           'status'] ==
//                                                       "approved"
//                                                   ? Colors.green
//                                                   : Colors.red,
//                                           borderRadius: BorderRadius.only(
//                                               bottomLeft: Radius.circular(10),
//                                               bottomRight:
//                                                   Radius.circular(10))),
//                                       child: Center(
//                                         child: Text(
//                                           "Status: ${controller.leaveApplication['status']}",
//                                           style: TextStyle(
//                                               fontSize: 18,
//                                               color: Colors.grey.shade100,
//                                               fontWeight: FontWeight.w700),
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               )
//                             ],
//                           ),
//                         )),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 16),
//                     child: Row(
//                       children: [
//                         Text(
//                           "Leave history:",
//                           style: TextStyle(
//                               fontSize: 18,
//                               color: Colors.grey.shade800,
//                               fontWeight: FontWeight.w500),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Obx(() => controller.leaveHistory.length == 0
//                       ? Container()
//                       : Container(
//                           margin: EdgeInsets.symmetric(
//                             horizontal: 16,
//                           ),
//                           // padding: EdgeInsets.symmetric(horizontal: 5),
//                           width: double.maxFinite,
//                           decoration: BoxDecoration(
//                               color: Colors.grey.shade200,
//                               borderRadius: BorderRadius.circular(10)),
//                           child: Column(
//                             children: [
//                               Container(
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 10, vertical: 10),
//                                 decoration: BoxDecoration(
//                                     color: AppColors.greyColor,
//                                     borderRadius: BorderRadius.only(
//                                         topLeft: Radius.circular(10),
//                                         topRight: Radius.circular(10))),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       "Leave type",
//                                       style: TextStyle(
//                                           fontSize: 18,
//                                           color: Colors.grey.shade900,
//                                           fontWeight: FontWeight.w500),
//                                     ),
//                                     Text(
//                                       "Start date",
//                                       style: TextStyle(
//                                           fontSize: 18,
//                                           color: Colors.grey.shade900,
//                                           fontWeight: FontWeight.w500),
//                                     ),
//                                     Text(
//                                       "Days enjoyed",
//                                       style: TextStyle(
//                                           fontSize: 18,
//                                           color: Colors.grey.shade900,
//                                           fontWeight: FontWeight.w500),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               //------Dynamic items------//
//                               Column(
//                                 children: controller.leaveHistory
//                                     .map((element) => Container(
//                                           // margin:
//                                           //     EdgeInsets.symmetric(vertical: 5),
//                                           padding: EdgeInsets.all(10),
//                                           decoration: BoxDecoration(
//                                               color: Colors.white),
//                                           child: Row(
//                                             // mainAxisAlignment:
//                                             //     MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Expanded(
//                                                 child: Text(
//                                                   element["type"],
//                                                   style: TextStyle(
//                                                       fontSize: 16,
//                                                       color:
//                                                           Colors.grey.shade900,
//                                                       fontWeight:
//                                                           FontWeight.w500),
//                                                 ),
//                                               ),
//                                               Expanded(
//                                                 child: Text(
//                                                   element["start_date"],
//                                                   textAlign: TextAlign.center,
//                                                   style: TextStyle(
//                                                       fontSize: 16,
//                                                       color:
//                                                           Colors.grey.shade900,
//                                                       fontWeight:
//                                                           FontWeight.w500),
//                                                 ),
//                                               ),
//                                               Expanded(
//                                                 child: Text(
//                                                   element["days"],
//                                                   textAlign: TextAlign.end,
//                                                   style: TextStyle(
//                                                       fontSize: 16,
//                                                       color:
//                                                           Colors.grey.shade900,
//                                                       fontWeight:
//                                                           FontWeight.w500),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ))
//                                     .toList(),
//                               ),
//                               //---Buttom curve design---------//
//                               Container(
//                                 height: 35,
//                                 padding: EdgeInsets.all(10),
//                                 decoration: BoxDecoration(
//                                     color: AppColors.greyColor,
//                                     borderRadius: BorderRadius.only(
//                                         bottomLeft: Radius.circular(10),
//                                         bottomRight: Radius.circular(10))),
//                               )
//                             ],
//                           ),
//                         )),
//                 ],
//               )),
//             ),
//             Positioned(
//                 bottom: 0,
//                 left: 0,
//                 right: 0,
//                 child: ZoomTapAnimation(
//                   onTap: () {
//                     timeSelectionAlert(controller: controller);
//                   },
//                   child: Container(
//                     height: 60,
//                     color: Color(0xff25ae7a),
//                     child: Center(
//                       child: Text(
//                         "Apply for leave",
//                         style: TextStyle(
//                             fontSize: 20,
//                             color: Colors.grey.shade100,
//                             fontWeight: FontWeight.w500),
//                       ),
//                     ),
//                   ),
//                 ))
//           ],
//         )













//-------------------

      //  Container(
      //             width: double.maxFinite,
      //             decoration: BoxDecoration(
      //               color: AppColors.modernBlue,
      //               borderRadius: BorderRadius.circular(10),
      //             ),
      //             child: Stack(
      //               children: [
      //                 Positioned(
      //                     child: Container(
      //                   height: 40,
      //                   width: 200,
      //                   decoration: (BoxDecoration(
      //                       color: Colors.blue,
      //                       borderRadius: BorderRadius.only(
      //                           bottomRight: Radius.circular(15), topLeft: Radius.circular(15)))),
      //                   child: Center(
      //                     child: textView(text: "Family information"),
      //                   ),
      //                 )),
      //                 Positioned(
               
      //                   child: Padding(
      //                     padding: const EdgeInsets.symmetric(
      //                         horizontal: 16, vertical: 10),
      //                     child: Column(
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: [
                        
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //                 Positioned(
      //                     right: 5,
      //                     top: 5,
      //                     child: Container(
      //                       height: 35,
      //                       width: 35,
      //                       decoration: BoxDecoration(
      //                           color: AppColors.greyColor,
      //                           borderRadius: BorderRadius.circular(100)),
      //                       child: Center(
      //                           child: Icon(
      //                         Icons.edit,
      //                         color: Colors.grey,
      //                       )),
      //                     ))
      //               ],
      //             ),
      //           )


      //-------------------------------------------------Code for profileeditpage with list view options----------------------//

//       import 'package:attendance/app/data/globals/app_colors.dart';
// import 'package:attendance/app/data/globals/common_widgets.dart';
// import 'package:flutter/material.dart';

// import 'package:get/get.dart';
// import 'package:zoom_tap_animation/zoom_tap_animation.dart';

// import '../../../routes/app_pages.dart';
// import '../controllers/profileeditscreen_controller.dart';

// class ProfileeditscreenView extends GetView<ProfileeditscreenController> {
//   const ProfileeditscreenView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: COMMONWIDGET.globalAppBar(
//           tittle: "My account",
//           backFunction: () {
//             Get.back();
//           }),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Container(
//             padding: EdgeInsets.symmetric(horizontal: 16),
//             width: MediaQuery.of(context).size.width,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 menuItem(
//                     menuTitle: "Personal information",
//                     imageLink: "assets/images/personal.png",
//                     color: AppColors.modernBlue,
//                     function: () {
//                       Get.toNamed(Routes.PERSONALINFO,
//                           arguments: controller.userProfile);
//                     }),
//                 menuItem(
//                     menuTitle: "Family information",
//                     imageLink: "assets/images/family.png",
//                     color: AppColors.modernCoolPink,
//                     function: () {
//                       Get.toNamed(Routes.MOVEMENTSCREEN);
//                     }),
//                 menuItem(
//                     menuTitle: "Academical information",
//                     imageLink: "assets/images/education.png",
//                     color: AppColors.modernPlantation,
//                     function: () {
//                       Get.toNamed(Routes.MOVEMENTSCREEN);
//                     }),
//                 menuItem(
//                     menuTitle: "Address information",
//                     imageLink: "assets/images/contact.png",
//                     color: AppColors.modernGreen,
//                     function: () {
//                       Get.toNamed(Routes.MOVEMENTSCREEN);
//                     }),
//                 menuItem(
//                     menuTitle: "Previous experience",
//                     imageLink: "assets/images/experience.png",
//                     color: AppColors.modernCoolPink,
//                     function: () {
//                       Get.toNamed(Routes.MOVEMENTSCREEN);
//                     }),
//                 menuItem(
//                     menuTitle: "Contact personnel",
//                     imageLink: "assets/images/phone.png",
//                     color: AppColors.modernPurple,
//                     function: () {
//                       Get.toNamed(Routes.MOVEMENTSCREEN);
//                     }),
//                 menuItem(
//                     menuTitle: "Training information",
//                     imageLink: "assets/images/training.png",
//                     color: Colors.amber,
//                     function: () {
//                       Get.toNamed(Routes.MOVEMENTSCREEN);
//                     }),
//                 menuItem(
//                     menuTitle: "Health information",
//                     imageLink: "assets/images/health.png",
//                     color: Colors.red,
//                     function: () {
//                       Get.toNamed(Routes.MOVEMENTSCREEN);
//                     }),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   static menuItem(
//       {required String menuTitle,
//       required String imageLink,
//       required Color color,
//       required VoidCallback function}) {
//     return ZoomTapAnimation(
//       onTap: function,
//       child: Container(
//         margin: EdgeInsets.symmetric(vertical: 10),
//         child: Row(
//           children: [
//             Container(
//               height: 100,
//               width: 100,
//               padding: EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 color: color,
//               ),
//               child: Image.asset(
//                 imageLink,
//                 color: Colors.white,
//                 // color: color.shade900,
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 height: 60,
//                 padding: EdgeInsets.symmetric(horizontal: 5),
//                 // width: 80,
//                 decoration: BoxDecoration(
//                     color: color.withOpacity(0.7),
//                     borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(30),
//                       bottomRight: Radius.circular(30),
//                     )),
//                 child: Center(
//                   child: Text(
//                     menuTitle,
//                     style: TextStyle(
//                         fontSize: 24,
//                         color: Colors.white,
//                         fontWeight: FontWeight.w500),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }



//---------------------------------Profile view page code-----------------------------------------------------------//


// import 'package:attendance/app/data/globals/common_widgets.dart';
// import 'package:flutter/material.dart';

// import 'package:get/get.dart';

// import '../../../data/globals/app_colors.dart';
// import '../controllers/profileviewscreen_controller.dart';

// class ProfileviewscreenView extends GetView<ProfileviewscreenController> {
//   const ProfileviewscreenView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         appBar: COMMONWIDGET.globalAppBar(
//             tittle: "Profile",
//             backFunction: () {
//               Get.back();
//             }),
//         body: SafeArea(
//             child: Container(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           padding: EdgeInsets.symmetric(horizontal: 16),
//           child: SingleChildScrollView(
//               child: Obx(
//             () => Column(
//               children: [
//                 //-------------------------User Profile--------------------------------//
//                 personalInformation(
//                   controller: controller,
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 documentInformation(controller: controller),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 presentAddressInformation(controller: controller),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 permanentAddressInformation(controller: controller),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 familyInformation(controller: controller),
//                 SizedBox(
//                   height: 20,
//                 ),
//               ],
//             ),
//           )),
//         )));
//   }

//   textView({required String text}) {
//     return Text(
//       text,
//       style: TextStyle(
//           fontSize: 16,
//           color: Colors.grey.shade100,
//           fontWeight: FontWeight.w400),
//     );
//   }

//   personalInformation({required ProfileviewscreenController controller}) {
//     return Container(
//       width: double.maxFinite,
//       decoration: BoxDecoration(
//         color: AppColors.modernGreen,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Stack(
//         children: [
//           Positioned(
//               child: Container(
//             height: 40,
//             width: 200,
//             decoration: (BoxDecoration(
//                 color: Color.fromARGB(255, 32, 146, 99),
//                 borderRadius: BorderRadius.only(
//                     bottomRight: Radius.circular(15),
//                     topLeft: Radius.circular(15)))),
//             child: Center(
//               child: textView(text: "Personal information"),
//             ),
//           )),
//           Positioned(
//               child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//                   child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           height: 50,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Container(
//                               child: Image.asset(
//                                 'assets/logo/user.png',
//                                 height: 100,
//                               ),
//                             ),
//                           ],
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SizedBox(
//                               height: 20,
//                             ),
//                             textView(
//                               text: controller.userProfile.isEmpty
//                                   ? "N/A"
//                                   : controller.userProfile["personal"]
//                                       ["empName"],
//                             ),
//                             SizedBox(
//                               height: 5,
//                             ),
//                             textView(
//                                 text:
//                                     "Gender:  ${controller.userProfile["personal"]["empDob"] ?? "N/A"}"),
//                             SizedBox(
//                               height: 5,
//                             ),
//                             textView(
//                                 text:
//                                     "Date of birth:  ${controller.userProfile["personal"]["gender"] ?? "N/A"}"),
//                             SizedBox(
//                               height: 5,
//                             ),
//                             textView(
//                                 text:
//                                     "Blood group:  ${controller.userProfile["personal"]["bloodGroup"] ?? "N/A"}"),
//                             SizedBox(
//                               height: 5,
//                             ),
//                             textView(
//                                 text:
//                                     "Nationality:  ${controller.userProfile["personal"]["nationality"] ?? "N/A"}"),
//                             SizedBox(
//                               height: 5,
//                             ),
//                             textView(
//                                 text:
//                                     "National ID no:  ${controller.userProfile["personal"]["nid"] ?? "N/A"}"),
//                             SizedBox(
//                               height: 5,
//                             ),
//                             textView(
//                                 text:
//                                     "Weight:  ${controller.userProfile["personal"]["weight"] ?? "N/A"} KG"),
//                             SizedBox(
//                               height: 5,
//                             ),
//                             textView(
//                                 text:
//                                     "Religion:  ${controller.userProfile["personal"]["religion"] ?? "N/A"}"),
//                             SizedBox(
//                               height: 5,
//                             ),
//                           ],
//                         ),
//                       ]))),
//           Positioned(
//               right: 5,
//               top: 5,
//               child: Container(
//                 height: 35,
//                 width: 35,
//                 decoration: BoxDecoration(
//                     color: AppColors.greyColor,
//                     borderRadius: BorderRadius.circular(100)),
//                 child: Center(
//                     child: Icon(
//                   Icons.edit,
//                   color: Colors.grey,
//                 )),
//               ))
//         ],
//       ),
//     );
//   }

//   familyInformation({required ProfileviewscreenController controller}) {
//     return Container(
//       width: double.maxFinite,
//       // height: 400,
//       // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//       decoration: BoxDecoration(
//         color: AppColors.modernBlue,
//         // color: Colors.grey.shade100,
//         borderRadius: BorderRadius.circular(10),

//         // border: Border.all(width: 0.5, color: Colors.grey.shade400)
//       ),
//       child: Stack(
//         children: [
//           Positioned(
//               child: Container(
//             height: 40,
//             width: 200,
//             decoration: (BoxDecoration(
//                 color: Colors.blue,
//                 borderRadius: BorderRadius.only(
//                     bottomRight: Radius.circular(15),
//                     topLeft: Radius.circular(15)))),
//             child: Center(
//               child: textView(text: "Family information"),
//             ),
//           )),
//           Positioned(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: 50,
//                   ),
//                   textView(
//                       text:
//                           "Father name:  ${controller.userProfile["personal"]["empFather"] ?? "N/A"}"),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   textView(
//                       text:
//                           "Father profession:  ${controller.userProfile["personal"]["empFatherProf"] ?? "N/A"}"),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   textView(
//                       text:
//                           "Mother name:  ${controller.userProfile["personal"]["empMother"] ?? "N/A"}"),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   textView(
//                       text:
//                           "Mother profession:  ${controller.userProfile["personal"]["empMotherProf"] ?? "N/A"}"),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   textView(
//                       text:
//                           "Marital status:  ${controller.userProfile["personal"]["maritalStatus"] ?? "N/A"}"),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   textView(
//                       text:
//                           "Spouse name:  ${controller.userProfile["personal"]["spouseName"] ?? "N/A"}"),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   textView(
//                       text:
//                           "Spouse date of birth:  ${controller.userProfile["personal"]["spouseDob"] ?? "N/A"}"),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   textView(
//                       text:
//                           "No of children:  ${controller.userProfile["personal"]["noOfChildren"] ?? "N/A"}"),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   textView(
//                       text:
//                           "First child name:  ${controller.userProfile["personal"]["children"][0]['name'] ?? "N/A"}"),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   textView(
//                       text:
//                           "First child date of birth:  ${controller.userProfile["personal"]["children"][0]["dob"] ?? "N/A"}"),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   textView(
//                       text:
//                           "Second child name:  ${controller.userProfile["personal"]["children"][1]['name'] ?? "N/A"}"),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   textView(
//                       text:
//                           "Second child date of birth:  ${controller.userProfile["personal"]["children"][1]["dob"] ?? "N/A"}"),
//                   SizedBox(
//                     height: 5,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Positioned(
//               right: 5,
//               top: 5,
//               child: Container(
//                 height: 35,
//                 width: 35,
//                 decoration: BoxDecoration(
//                     color: AppColors.greyColor,
//                     borderRadius: BorderRadius.circular(100)),
//                 child: Center(
//                     child: Icon(
//                   Icons.edit,
//                   color: Colors.grey,
//                 )),
//               ))
//         ],
//       ),
//     );
//   }

//   documentInformation({required ProfileviewscreenController controller}) {
//     return Container(
//       width: double.maxFinite,
//       decoration: BoxDecoration(
//         color: AppColors.modernLightBrown,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Stack(
//         children: [
//           Positioned(
//               child: Container(
//             height: 40,
//             width: 200,
//             decoration: (BoxDecoration(
//                 color: Colors.deepOrange,
//                 borderRadius: BorderRadius.only(
//                     bottomRight: Radius.circular(15),
//                     topLeft: Radius.circular(15)))),
//             child: Center(
//               child: textView(text: "Document information"),
//             ),
//           )),
//           Positioned(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: 50,
//                   ),
//                   textView(
//                       text:
//                           "TIN no:  ${controller.userProfile["personal"]["tinNo"] ?? "N/A"}"),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   textView(
//                       text:
//                           "Driving License:  ${controller.userProfile["personal"]["drivingLicense"] ?? "N/A"}"),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   textView(
//                       text:
//                           "Driving license expire:  ${controller.userProfile["personal"]["drivingLicenseExp"] ?? "N/A"}"),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   textView(
//                       text:
//                           "Passport:  ${controller.userProfile["personal"]["passport"] ?? "N/A"}"),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   textView(
//                       text:
//                           "Passport expire:  ${controller.userProfile["personal"]["passportExp"] ?? "N/A"}"),
//                   SizedBox(
//                     height: 5,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Positioned(
//               right: 5,
//               top: 5,
//               child: Container(
//                 height: 35,
//                 width: 35,
//                 decoration: BoxDecoration(
//                     color: AppColors.greyColor,
//                     borderRadius: BorderRadius.circular(100)),
//                 child: Center(
//                     child: Icon(
//                   Icons.edit,
//                   color: Colors.grey,
//                 )),
//               ))
//         ],
//       ),
//     );
//   }

//   presentAddressInformation({required ProfileviewscreenController controller}) {
//     return Container(
//       width: double.maxFinite,
//       decoration: BoxDecoration(
//         color: AppColors.modernSexyRed,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Stack(
//         children: [
//           Positioned(
//               child: Container(
//             height: 40,
//             width: 200,
//             decoration: (BoxDecoration(
//                 color: Color.fromARGB(255, 236, 2, 34),
//                 borderRadius: BorderRadius.only(
//                     bottomRight: Radius.circular(15),
//                     topLeft: Radius.circular(15)))),
//             child: Center(
//               child: textView(text: "Present address"),
//             ),
//           )),
//           Positioned(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: 50,
//                   ),
//                   textView(
//                       text:
//                           "Village:  ${controller.userProfile["address"]["present"]['village'] ?? "N/A"}"),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   textView(
//                       text:
//                           "Police station:  ${controller.userProfile["address"]["present"]['policeStation'] ?? "N/A"}"),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   textView(
//                       text:
//                           "Post code:  ${controller.userProfile["address"]["present"]['postCode'] ?? "N/A"}"),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   textView(
//                       text:
//                           "District:  ${controller.userProfile["address"]["present"]['district'] ?? "N/A"}"),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   textView(
//                       text:
//                           "Division:  ${controller.userProfile["address"]["present"]['division'] ?? "N/A"}"),
//                   SizedBox(
//                     height: 5,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Positioned(
//               right: 5,
//               top: 5,
//               child: Container(
//                 height: 35,
//                 width: 35,
//                 decoration: BoxDecoration(
//                     color: AppColors.greyColor,
//                     borderRadius: BorderRadius.circular(100)),
//                 child: Center(
//                     child: Icon(
//                   Icons.edit,
//                   color: Colors.grey,
//                 )),
//               ))
//         ],
//       ),
//     );
//   }

//   permanentAddressInformation(
//       {required ProfileviewscreenController controller}) {
//     return Container(
//       width: double.maxFinite,
//       decoration: BoxDecoration(
//         color: AppColors.modernPlantation,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Stack(
//         children: [
//           Positioned(
//               child: Container(
//             height: 40,
//             width: 200,
//             decoration: (BoxDecoration(
//                 color: Colors.blueGrey,
//                 borderRadius: BorderRadius.only(
//                     bottomRight: Radius.circular(15),
//                     topLeft: Radius.circular(15)))),
//             child: Center(
//               child: textView(text: "Permanent address"),
//             ),
//           )),
//           Positioned(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: 50,
//                   ),
//                   textView(
//                       text:
//                           "Village:  ${controller.userProfile["address"]["permanent"]['village'] ?? "N/A"}"),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   textView(
//                       text:
//                           "Police station:  ${controller.userProfile["address"]["permanent"]['policeStation'] ?? "N/A"}"),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   textView(
//                       text:
//                           "Post code:  ${controller.userProfile["address"]["permanent"]['postCode'] ?? "N/A"}"),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   textView(
//                       text:
//                           "District:  ${controller.userProfile["address"]["permanent"]['district'] ?? "N/A"}"),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   textView(
//                       text:
//                           "Division:  ${controller.userProfile["address"]["permanent"]['division'] ?? "N/A"}"),
//                   SizedBox(
//                     height: 5,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Positioned(
//               right: 5,
//               top: 5,
//               child: Container(
//                 height: 35,
//                 width: 35,
//                 decoration: BoxDecoration(
//                     color: AppColors.greyColor,
//                     borderRadius: BorderRadius.circular(100)),
//                 child: Center(
//                     child: Icon(
//                   Icons.edit,
//                   color: Colors.grey,
//                 )),
//               ))
//         ],
//       ),
//     );
//   }
// }

//-----------------------------------------------Code responsible for both views in profile page------------------------//


// //-----------------------Section responsible for personal information-----------------------------//


// Scaffold(
//         backgroundColor: Colors.white,
//         appBar: COMMONWIDGET.globalAppBar(
//             tittle: "Profile",
//             backFunction: () {
//               Get.back();
//             }),
//         body: SafeArea(
//             child: Container(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           padding: EdgeInsets.symmetric(horizontal: 16),
//           child: SingleChildScrollView(
//               child: Column(
//             children:
            
//              [
//               expandedPersonal(context: context),
//               SizedBox(
//                 height: 20,
//               ),
//               expandedPresentAddress(context: context),
//               SizedBox(
//                 height: 20,
//               ),
//               expandedPermanentAddress(context: context),
//               SizedBox(
//                 height: 20,
//               ),
//               expanedAcademicInformation(
//                   context: context, controller: controller),
//               SizedBox(
//                 height: 20,
//               ),
//               expanedAcademicInformation2(
//                   context: context, controller: controller),
//               SizedBox(
//                 height: 20,
//               ),
//             ],
//           )),
//         )));

//   expandedPersonal({required BuildContext context}) {
//     return ExpandablePanel(
//       theme: ExpandableThemeData(
//           tapBodyToCollapse: true,
//           // hasIcon: false,
//           headerAlignment: ExpandablePanelHeaderAlignment.center,
//           // iconPlacement: ExpandablePanelIconPlacement.right,

//           animationDuration: const Duration(milliseconds: 500),
//           // tapBodyToExpand: true,
//           expandIcon: Icons.arrow_circle_down,
//           collapseIcon: Icons.arrow_circle_up),

//       // ...

//       header: Container(
//         // height: 100,
//         width: double.maxFinite,
//         color: AppColors.modernBlue,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                     color: AppColors.modernBlue,
//                     borderRadius: BorderRadius.circular(100)),
//                 padding: EdgeInsets.all(30),
//                 child: Image.asset(
//                   "assets/images/personal.png",
//                   color: Colors.white,
//                   height: 50,
//                   width: 50,
//                 ),
//               ),
//               SizedBox(
//                 width: 5,
//               ),
//               Text(
//                 "Personal information",
//                 style: TextStyle(fontSize: 18, color: Colors.white),
//                 textAlign: TextAlign.start,
//               ),
//             ],
//           ),
//         ),
//       ),
//       collapsed: Container(),

//       expanded: Container(

//           // height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           // padding: EdgeInsets.symmetric(horizontal: 16),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 10,
//                 ),
//                 commonTextField(controller: controller.name, title: "Name"),
//                 commonTextField(
//                     controller: controller.dateOfBirth, title: "Date of birth"),
//                 commonTextField(controller: controller.email, title: "Email"),
//                 commonTextField(controller: controller.phone, title: "Phone"),
//                 commonTextField(controller: controller.gender, title: "Gender"),
//                 commonTextField(
//                     controller: controller.bloodGroup, title: "Blood group"),
//                 commonTextField(
//                     controller: controller.nationality, title: "Nationality"),
//                 commonTextField(
//                     controller: controller.nid, title: "National identity"),
//                 commonTextField(controller: controller.height, title: "Height"),
//                 commonTextField(controller: controller.weight, title: "Weight"),
//                 commonTextField(
//                     controller: controller.religion, title: "Religion"),
//                 commonTextField(controller: controller.tin, title: "TIN no"),
//                 commonTextField(
//                     controller: controller.maritalStatus,
//                     title: "Marital status"),
//                 commonTextField(
//                     controller: controller.spouseName, title: "Spouse name"),
//                 commonTextField(
//                     controller: controller.spouseDob,
//                     title: "Spouse date of birth"),
//                 commonTextField(
//                     controller: controller.noOfChildren,
//                     title: "No of children"),
//                 commonTextField(
//                     controller: controller.childOneName,
//                     title: "Children 1 name"),
//                 commonTextField(
//                     controller: controller.childOneDob,
//                     title: "Children 1 date of birth"),
//                 commonTextField(
//                     controller: controller.childTwoName, title: "Child 2 name"),
//                 commonTextField(
//                     controller: controller.childTwoDob,
//                     title: "Child 2 date of birth"),
//               ],
//             ),
//           )),
//     );
//   }

// //-----------------------Section responsible for present address information-----------------------------//
//   expandedPresentAddress({required BuildContext context}) {
//     return ExpandablePanel(
//       theme: ExpandableThemeData(
//           tapBodyToCollapse: true,
//           headerAlignment: ExpandablePanelHeaderAlignment.center,
//           animationDuration: const Duration(milliseconds: 500),
//           expandIcon: Icons.arrow_circle_down,
//           collapseIcon: Icons.arrow_circle_up),
//       header: Container(
//         width: double.maxFinite,
//         color: AppColors.modernGreen,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                     color: AppColors.modernGreen,
//                     borderRadius: BorderRadius.circular(100)),
//                 padding: EdgeInsets.all(30),
//                 child: Image.asset(
//                   "assets/images/contact.png",
//                   color: Colors.white,
//                   height: 50,
//                   width: 50,
//                 ),
//               ),
//               SizedBox(
//                 width: 5,
//               ),
//               Text(
//                 "Present address",
//                 style: TextStyle(fontSize: 18, color: Colors.white),
//                 textAlign: TextAlign.start,
//               ),
//             ],
//           ),
//         ),
//       ),
//       collapsed: Container(),
//       expanded: Container(

//           // height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           // padding: EdgeInsets.symmetric(horizontal: 16),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 10,
//                 ),
//                 commonTextField(
//                     controller: controller.presentVillage,
//                     title: "Village/House no/Area"),
//                 commonTextField(
//                     controller: controller.presentPoliceStation,
//                     title: "Police station"),
//                 commonTextField(
//                     controller: controller.presentPostOffice,
//                     title: "Post office"),
//                 commonTextField(
//                     controller: controller.presentDistrict, title: "District"),
//                 commonTextField(
//                     controller: controller.presentDivision, title: "Division"),
//                 commonTextField(
//                     controller: controller.presentPostCode, title: "Post code"),
//               ],
//             ),
//           )),
//     );
//   }

// //-----------------------Section responsible for permanent address information-----------------------------//
//   expandedPermanentAddress({required BuildContext context}) {
//     return ExpandablePanel(
//       theme: ExpandableThemeData(
//           tapBodyToCollapse: true,
//           headerAlignment: ExpandablePanelHeaderAlignment.center,
//           animationDuration: const Duration(milliseconds: 500),
//           expandIcon: Icons.arrow_circle_down,
//           collapseIcon: Icons.arrow_circle_up),
//       header: Container(
//         width: double.maxFinite,
//         color: AppColors.modernSexyRed,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                     color: AppColors.modernSexyRed,
//                     borderRadius: BorderRadius.circular(100)),
//                 padding: EdgeInsets.all(30),
//                 child: Image.asset(
//                   "assets/images/contact.png",
//                   color: Colors.white,
//                   height: 50,
//                   width: 50,
//                 ),
//               ),
//               SizedBox(
//                 width: 5,
//               ),
//               Text(
//                 "Permanent address",
//                 style: TextStyle(fontSize: 18, color: Colors.white),
//                 textAlign: TextAlign.start,
//               ),
//             ],
//           ),
//         ),
//       ),
//       collapsed: Container(),
//       expanded: Container(

//           // height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           // padding: EdgeInsets.symmetric(horizontal: 16),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 10,
//                 ),
//                 commonTextField(
//                     controller: controller.permanentVillage,
//                     title: "Village/House no/Area"),
//                 commonTextField(
//                     controller: controller.permanentPoliceStation,
//                     title: "Police station"),
//                 commonTextField(
//                     controller: controller.permanentPostOffice,
//                     title: "Post office"),
//                 commonTextField(
//                     controller: controller.permanentDistrict,
//                     title: "District"),
//                 commonTextField(
//                     controller: controller.permanentDivision,
//                     title: "Division"),
//                 commonTextField(
//                     controller: controller.permanentPostCode,
//                     title: "Post code"),
//               ],
//             ),
//           )),
//     );
//   }

//   expanedAcademicInformation(
//       {required BuildContext context,
//       required ProfileviewscreenController controller}) {
//     return ExpandablePanel(
//       theme: ExpandableThemeData(
//           tapBodyToCollapse: true,
//           headerAlignment: ExpandablePanelHeaderAlignment.center,
//           animationDuration: const Duration(milliseconds: 500),
//           expandIcon: Icons.arrow_circle_down,
//           collapseIcon: Icons.arrow_circle_up),
//       header: Container(
//         width: double.maxFinite,
//         color: AppColors.modernPlantation,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                     color: AppColors.modernPlantation,
//                     borderRadius: BorderRadius.circular(100)),
//                 padding: EdgeInsets.all(30),
//                 child: Image.asset(
//                   "assets/images/education.png",
//                   color: Colors.white,
//                   height: 50,
//                   width: 50,
//                 ),
//               ),
//               SizedBox(
//                 width: 5,
//               ),
//               Text(
//                 "Academic information",
//                 style: TextStyle(fontSize: 18, color: Colors.white),
//                 textAlign: TextAlign.start,
//               ),
//             ],
//           ),
//         ),
//       ),
//       collapsed: Container(),
//       expanded: Container(
//           width: MediaQuery.of(context).size.width,
//           child: Container(
//             width: double.infinity,
//             height: 400,
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: SingleChildScrollView(
//                 child: DataTable(
//                   columns: <DataColumn>[
//                     DataColumn(
//                       label: Text('Exam name'),
//                     ),
//                     DataColumn(
//                       label: Text('Group'),
//                     ),
//                     DataColumn(
//                       label: Text('Board/University'),
//                     ),
//                     DataColumn(
//                       label: Text('Institute name'),
//                     ),
//                     DataColumn(
//                       label: Text('Division'),
//                     ),
//                     DataColumn(
//                       label: Text('Year'),
//                     ),
//                     DataColumn(
//                       label: Text('Result'),
//                     ),
//                     DataColumn(
//                       label: Text('Out of'),
//                     ),
//                     DataColumn(
//                       label: Text('Copy'),
//                     ),
//                   ],
//                   rows: controller.userProfile["academic"]
//                       .map(
//                         (e) => DataRow(
//                           cells: <DataCell>[
//                             DataCell(Text(e["examName"])),
//                             DataCell(Text(e["group"])),
//                             DataCell(Text(e["board"])),
//                             DataCell(Text(e["institute"])),
//                             DataCell(Text(e["division"])),
//                             DataCell(Text(e["passingYear"])),
//                             DataCell(Text(e["result"])),
//                             DataCell(Text(e["scale"])),
//                             DataCell(Text(e["copy"])),
//                           ],
//                         ),
//                       )
//                       .toList()
//                       .cast<DataRow>(),

//                   //  List<DataRow>.generate(
//                   //   10,
//                   //   (int index) => DataRow(
//                   //     cells: <DataCell>[
//                   //       DataCell(Text('Row ${index + 1} - Col 1')),
//                   //       DataCell(Text('Row ${index + 1} - Col 2')),
//                   //       DataCell(Text('Row ${index + 1} - Col 3')),
//                   //       DataCell(Text('Row ${index + 1} - Col 3')),
//                   //       DataCell(Text('Row ${index + 1} - Col 3')),
//                   //       DataCell(Text('Row ${index + 1} - Col 3')),
//                   //       DataCell(Text('Row ${index + 1} - Col 3')),
//                   //       DataCell(Text('Row ${index + 1} - Col 3')),
//                   //       DataCell(Text('Row ${index + 1} - Col 3')),
//                   //     ],
//                   //   ),
//                   // ),
//                 ),
//               ),
//             ),
//           )

//           // SingleChildScrollView(
//           //   child: Obx(() => Column(
//           //       children: controller.userProfile.isNotEmpty
//           //           ? controller.userProfile["academic"]
//           //               .map((e) {
//           //                 TextEditingController examName =
//           //                     TextEditingController();
//           //                 TextEditingController examGroup =
//           //                     TextEditingController();
//           //                 TextEditingController examBoard =
//           //                     TextEditingController();
//           //                 TextEditingController examInstitute =
//           //                     TextEditingController();
//           //                 TextEditingController examDivision =
//           //                     TextEditingController();
//           //                 TextEditingController examYear =
//           //                     TextEditingController();
//           //                 TextEditingController examResult =
//           //                     TextEditingController();
//           //                 TextEditingController examOutof =
//           //                     TextEditingController();
//           //                 TextEditingController examCopy =
//           //                     TextEditingController();
//           //                 return Container(
//           //                   width: double.maxFinite,
//           //                   // color: Colors.red,
//           //                   decoration: BoxDecoration(
//           //                       borderRadius: BorderRadius.circular(5),
//           //                       border: Border.all(
//           //                           width: 1, color: Colors.grey.shade700)),
//           //                   margin: EdgeInsets.all(10),
//           //                   padding: EdgeInsets.symmetric(),
//           //                   child: Column(
//           //                     children: [
//           //                       Container(
//           //                         height: 40,
//           //                         decoration: BoxDecoration(
//           //                             color: AppColors.modernBlue,
//           //                             borderRadius: BorderRadius.only(
//           //                                 topLeft: Radius.circular(5),
//           //                                 topRight: Radius.circular(5))),
//           //                       ),
//           //                       Padding(
//           //                         padding: EdgeInsets.symmetric(horizontal: 10),
//           //                         child: Column(
//           //                           children: [
//           //                             commonTextField(
//           //                                 controller: examGroup,
//           //                                 title: "Group"),
//           //                             commonTextField(
//           //                                 controller: examBoard,
//           //                                 title: "Board/University"),
//           //                             commonTextField(
//           //                                 controller: examInstitute,
//           //                                 title: "Institute name"),
//           //                             commonTextField(
//           //                                 controller: examDivision,
//           //                                 title: "Division/Grade"),
//           //                             commonTextField(
//           //                                 controller: examYear,
//           //                                 title: "Passing year"),
//           //                             commonTextField(
//           //                                 controller: examResult,
//           //                                 title: "Result"),
//           //                             commonTextField(
//           //                                 controller: examOutof,
//           //                                 title: "Out of"),
//           //                             commonTextField(
//           //                                 controller: examCopy, title: "Copy"),
//           //                           ],
//           //                         ),
//           //                       ),
//           //                       Container(
//           //                         height: 40,
//           //                         decoration: BoxDecoration(
//           //                             color: AppColors.modernBlue,
//           //                             borderRadius: BorderRadius.only(
//           //                                 bottomLeft: Radius.circular(5),
//           //                                 bottomRight: Radius.circular(5))),
//           //                       ),
//           //                     ],
//           //                   ),
//           //                 );
//           //               })
//           //               .toList()
//           //               .cast<Widget>()
//           //           : [])),
//           // )

//           ),
//     );
//   }

//   expanedAcademicInformation2(
//       {required BuildContext context,
//       required ProfileviewscreenController controller}) {
//     return ExpandablePanel(
//       theme: ExpandableThemeData(
//           tapBodyToCollapse: true,
//           headerAlignment: ExpandablePanelHeaderAlignment.center,
//           animationDuration: const Duration(milliseconds: 500),
//           expandIcon: Icons.arrow_circle_down,
//           collapseIcon: Icons.arrow_circle_up),
//       header: Container(
//         width: double.maxFinite,
//         color: AppColors.modernSexyRed,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                     color: AppColors.modernSexyRed,
//                     borderRadius: BorderRadius.circular(100)),
//                 padding: EdgeInsets.all(30),
//                 child: Image.asset(
//                   "assets/images/education.png",
//                   color: Colors.white,
//                   height: 50,
//                   width: 50,
//                 ),
//               ),
//               SizedBox(
//                 width: 5,
//               ),
//               Text(
//                 "Academic information",
//                 style: TextStyle(fontSize: 18, color: Colors.white),
//                 textAlign: TextAlign.start,
//               ),
//             ],
//           ),
//         ),
//       ),
//       collapsed: Container(),
//       expanded: Container(
//           width: MediaQuery.of(context).size.width,
//           child:

//               // Container(
//               //   width: double.infinity,
//               //   height: 400,
//               //   child: SingleChildScrollView(
//               //     scrollDirection: Axis.horizontal,
//               //     child: SingleChildScrollView(
//               //       child: DataTable(
//               //         columns: <DataColumn>[
//               //           DataColumn(
//               //             label: Text('Exam name'),
//               //           ),
//               //           DataColumn(
//               //             label: Text('Group'),
//               //           ),
//               //           DataColumn(
//               //             label: Text('Board/University'),
//               //           ),
//               //           DataColumn(
//               //             label: Text('Institute name'),
//               //           ),
//               //           DataColumn(
//               //             label: Text('Division'),
//               //           ),
//               //           DataColumn(
//               //             label: Text('Year'),
//               //           ),
//               //           DataColumn(
//               //             label: Text('Result'),
//               //           ),
//               //           DataColumn(
//               //             label: Text('Out of'),
//               //           ),
//               //           DataColumn(
//               //             label: Text('Copy'),
//               //           ),
//               //         ],
//               //         rows: controller.userProfile["academic"]
//               //             .map(
//               //               (e) => DataRow(
//               //                 cells: <DataCell>[
//               //                   DataCell(Text(e["examName"])),
//               //                   DataCell(Text(e["group"])),
//               //                   DataCell(Text(e["board"])),
//               //                   DataCell(Text(e["institute"])),
//               //                   DataCell(Text(e["division"])),
//               //                   DataCell(Text(e["passingYear"])),
//               //                   DataCell(Text(e["result"])),
//               //                   DataCell(Text(e["scale"])),
//               //                   DataCell(Text(e["copy"])),
//               //                 ],
//               //               ),
//               //             )
//               //             .toList()
//               //             .cast<DataRow>(),

//               //         //  List<DataRow>.generate(
//               //         //   10,
//               //         //   (int index) => DataRow(
//               //         //     cells: <DataCell>[
//               //         //       DataCell(Text('Row ${index + 1} - Col 1')),
//               //         //       DataCell(Text('Row ${index + 1} - Col 2')),
//               //         //       DataCell(Text('Row ${index + 1} - Col 3')),
//               //         //       DataCell(Text('Row ${index + 1} - Col 3')),
//               //         //       DataCell(Text('Row ${index + 1} - Col 3')),
//               //         //       DataCell(Text('Row ${index + 1} - Col 3')),
//               //         //       DataCell(Text('Row ${index + 1} - Col 3')),
//               //         //       DataCell(Text('Row ${index + 1} - Col 3')),
//               //         //       DataCell(Text('Row ${index + 1} - Col 3')),
//               //         //     ],
//               //         //   ),
//               //         // ),
//               //       ),
//               //     ),
//               //   ),
//               // )

//               SingleChildScrollView(
//             child: Obx(() => Column(
//                 children: controller.userProfile.isNotEmpty
//                     ? controller.userProfile["academic"]
//                         .map((e) {
//                           TextEditingController examName =
//                               TextEditingController();
//                           TextEditingController examGroup =
//                               TextEditingController();
//                           TextEditingController examBoard =
//                               TextEditingController();
//                           TextEditingController examInstitute =
//                               TextEditingController();
//                           TextEditingController examDivision =
//                               TextEditingController();
//                           TextEditingController examYear =
//                               TextEditingController();
//                           TextEditingController examResult =
//                               TextEditingController();
//                           TextEditingController examOutof =
//                               TextEditingController();
//                           TextEditingController examCopy =
//                               TextEditingController();
//                           return Container(
//                             width: double.maxFinite,
//                             // color: Colors.red,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(5),
//                                 border: Border.all(
//                                     width: 1, color: Colors.grey.shade700)),
//                             margin: EdgeInsets.all(10),
//                             padding: EdgeInsets.symmetric(),
//                             child: Column(
//                               children: [
//                                 Container(
//                                   height: 40,
//                                   decoration: BoxDecoration(
//                                       color: AppColors.modernBlue,
//                                       borderRadius: BorderRadius.only(
//                                           topLeft: Radius.circular(5),
//                                           topRight: Radius.circular(5))),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.symmetric(horizontal: 10),
//                                   child: Column(
//                                     children: [
//                                       commonTextField(
//                                           controller: examGroup,
//                                           title: "Group"),
//                                       commonTextField(
//                                           controller: examBoard,
//                                           title: "Board/University"),
//                                       commonTextField(
//                                           controller: examInstitute,
//                                           title: "Institute name"),
//                                       commonTextField(
//                                           controller: examDivision,
//                                           title: "Division/Grade"),
//                                       commonTextField(
//                                           controller: examYear,
//                                           title: "Passing year"),
//                                       commonTextField(
//                                           controller: examResult,
//                                           title: "Result"),
//                                       commonTextField(
//                                           controller: examOutof,
//                                           title: "Out of"),
//                                       commonTextField(
//                                           controller: examCopy, title: "Copy"),
//                                     ],
//                                   ),
//                                 ),
//                                 Container(
//                                   height: 40,
//                                   decoration: BoxDecoration(
//                                       color: AppColors.modernBlue,
//                                       borderRadius: BorderRadius.only(
//                                           bottomLeft: Radius.circular(5),
//                                           bottomRight: Radius.circular(5))),
//                                 ),
//                               ],
//                             ),
//                           );
//                         })
//                         .toList()
//                         .cast<Widget>()
//                     : [])),
//           )),
//     );
//   }

///----------------------Version 2 ---------------------------//
///  commonTextField(
  //     {required TextEditingController controller,
  //     required String title,
  //     bool? enabled}) {
  //   return Container(
  //     padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
  //     margin: EdgeInsets.symmetric(vertical: 5),
  //     decoration: BoxDecoration(
  //         color: AppColors.sexySkyBlue,
  //         borderRadius: BorderRadius.circular(10)),
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           title,
  //           style: TextStyle(
  //               fontSize: 22,
  //               color: Colors.grey.shade700,
  //               fontWeight: FontWeight.w400),
  //           textAlign: TextAlign.center,
  //         ),
  //         SizedBox(
  //           height: 5,
  //         ),
  //         Container(
  //           height: 40,
  //           decoration: BoxDecoration(
  //             color: Colors.white,
  //             borderRadius: BorderRadius.circular(10),
  //           ),
  //           child: COMMONWIDGET.commonTextEdit(
  //               hinttext: title,
  //               controller: controller,
  //               obsecure: false,
  //               enabled: enabled ?? true),
  //         ),
  //         SizedBox(
  //           height: 10,
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // personalInfoSection(
  //     {required ProfileviewscreenController controller,
  //     required BuildContext context,
  //     required Color color}) {
  //   return Container(
  //     decoration: BoxDecoration(
  //         color: color.withOpacity(0.03),
  //         border: Border.all(color: color, width: 2),
  //         borderRadius: BorderRadius.circular(5)),
  //     child: Stack(
  //       children: [
  //         Padding(
  //           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
  //           child: Column(
  //             children: [
  //               SizedBox(
  //                 height: 50,
  //               ),
  //               personalRow(
  //                   label: "Employee name:",
  //                   controller: controller.name,
  //                   hinttext: "Name"),
  //               personalRow(
  //                   label: "Employee date of birth:",
  //                   controller: controller.dateOfBirth,
  //                   hinttext: "Date of birth"),
  //               personalRow(
  //                   label: "Gender :",
  //                   controller: controller.gender,
  //                   hinttext: "Gender"),
  //               personalRow(
  //                   label: "Blood group :",
  //                   controller: controller.bloodGroup,
  //                   hinttext: "Blood group"),
  //               personalRow(
  //                   label: "Mobile :",
  //                   controller: controller.phone,
  //                   hinttext: "Mobile number"),
  //               personalRow(
  //                   label: "Email :",
  //                   controller: controller.email,
  //                   hinttext: "Email"),
  //               personalRow(
  //                   label: "Father's name :",
  //                   controller: controller.fatherName,
  //                   hinttext: "Fathers's name"),
  //               personalRow(
  //                   label: "Father's profession :",
  //                   controller: controller.fatherProf,
  //                   hinttext: "Father's profession"),
  //               personalRow(
  //                   label: "Mother's name :",
  //                   controller: controller.motherName,
  //                   hinttext: "Mohter's name"),
  //               personalRow(
  //                   label: "Mother's profession :",
  //                   controller: controller.motherProf,
  //                   hinttext: "Mother's proffesion"),
  //               personalRow(
  //                   label: "Nationality :",
  //                   controller: controller.nationality,
  //                   hinttext: "Nationality"),
  //               personalRow(
  //                   label: "Nid:",
  //                   controller: controller.nid,
  //                   hinttext: "National Identification Card(NID)"),
  //               personalRow(
  //                   label: "Height :",
  //                   controller: controller.height,
  //                   hinttext: "Height"),
  //               personalRow(
  //                   label: "Weight :",
  //                   controller: controller.weight,
  //                   hinttext: "Weight"),
  //               personalRow(
  //                   label: "Religion :",
  //                   controller: controller.religion,
  //                   hinttext: "Religion"),
  //               personalRow(
  //                   label: "TIN :",
  //                   controller: controller.tin,
  //                   hinttext: "TIN"),
  //               personalRow(
  //                   label: "Marital status :",
  //                   controller: controller.maritalStatus,
  //                   hinttext: "Marital status"),
  //               personalRow(
  //                   label: "Spouse name :",
  //                   controller: controller.spouseName,
  //                   hinttext: "Spouse name"),
  //               personalRow(
  //                   label: "Spouse date of birth :",
  //                   controller: controller.spouseDob,
  //                   hinttext: "Spouse date of birth"),
  //               personalRow(
  //                   label: "Number of children :",
  //                   controller: controller.noOfChildren,
  //                   hinttext: "Number of children"),
  //               personalRow(
  //                   label: "Children 1 name :",
  //                   controller: controller.childOneName,
  //                   hinttext: "Children 1 name"),
  //               personalRow(
  //                   label: "Children 1 date of birth :",
  //                   controller: controller.childOneDob,
  //                   hinttext: "Children 1 date of birth"),
  //               personalRow(
  //                   label: "Children 2 name :",
  //                   controller: controller.childTwoName,
  //                   hinttext: "Children 2 name"),
  //               personalRow(
  //                   label: "Children 2 date of birth :",
  //                   controller: controller.childTwoDob,
  //                   hinttext: "Children 2 date of birth"),
  //               personalRow(
  //                   label: "Passport no:",
  //                   controller: controller.passportNo,
  //                   hinttext: "Passport no"),
  //               personalRow(
  //                   label: "Passport expiry:",
  //                   controller: controller.passportExp,
  //                   hinttext: "Passport expiry"),
  //               personalRow(
  //                   label: "Driving l;icense no:",
  //                   controller: controller.drivingLicenseNo,
  //                   hinttext: "Driving l;icense no"),
  //               personalRow(
  //                   label: "Driving license expiry:",
  //                   controller: controller.drivingLicenseExp,
  //                   hinttext: "Driving license expiry"),
  //             ],
  //           ),
  //         ),
  //         Positioned(
  //             child: Container(
  //           height: 40,
  //           width: 180,
  //           decoration: BoxDecoration(
  //               color: color,
  //               borderRadius: BorderRadius.only(
  //                   topLeft: Radius.circular(2),
  //                   bottomRight: Radius.circular(20))),
  //           child: Center(
  //             child: Text(
  //               'Academic information',
  //               style: TextStyle(color: Colors.white),
  //             ),
  //           ),
  //         ))
  //       ],
  //     ),
  //   );
  // }

  // presentAddressInfoSection(
  //     {required ProfileviewscreenController controller,
  //     required BuildContext context,
  //     required Color color}) {
  //   return Container(
  //     decoration: BoxDecoration(
  //         color: color.withOpacity(0.03),
  //         border: Border.all(color: color, width: 2),
  //         borderRadius: BorderRadius.circular(5)),
  //     child: Stack(
  //       children: [
  //         Padding(
  //           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
  //           child: Column(
  //             children: [
  //               SizedBox(
  //                 height: 50,
  //               ),
  //               personalRow(
  //                   label: "Vill/House No/Area:",
  //                   controller: controller.presentVillage,
  //                   hinttext: "Village/Area"),
  //               personalRow(
  //                   label: "Police statios :",
  //                   controller: controller.presentPoliceStation,
  //                   hinttext: "Police statios "),
  //               personalRow(
  //                   label: "District:",
  //                   controller: controller.presentDistrict,
  //                   hinttext: "District"),
  //               personalRow(
  //                   label: "Division:",
  //                   controller: controller.presentDivision,
  //                   hinttext: "Division"),
  //               personalRow(
  //                   label: "Post office:",
  //                   controller: controller.presentPostOffice,
  //                   hinttext: "Post office"),
  //               personalRow(
  //                   label: "Post code:",
  //                   controller: controller.presentPostCode,
  //                   hinttext: "Post code"),
  //             ],
  //           ),
  //         ),
  //         Positioned(
  //             child: Container(
  //           height: 40,
  //           width: 180,
  //           decoration: BoxDecoration(
  //               color: color,
  //               borderRadius: BorderRadius.only(
  //                   topLeft: Radius.circular(2),
  //                   bottomRight: Radius.circular(20))),
  //           child: Center(
  //             child: Text(
  //               'Present address',
  //               style: TextStyle(color: Colors.white),
  //             ),
  //           ),
  //         ))
  //       ],
  //     ),
  //   );
  // }

  // permanentAddressInfoSection(
  //     {required ProfileviewscreenController controller,
  //     required BuildContext context,
  //     required Color color}) {
  //   return Container(
  //     decoration: BoxDecoration(
  //         color: color.withOpacity(0.03),
  //         border: Border.all(color: color, width: 2),
  //         borderRadius: BorderRadius.circular(5)),
  //     child: Stack(
  //       children: [
  //         Padding(
  //           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
  //           child: Column(
  //             children: [
  //               SizedBox(
  //                 height: 50,
  //               ),
  //               personalRow(
  //                   label: "Children 2 name :",
  //                   controller: controller.childTwoName,
  //                   hinttext: "Children 2 name"),
  //               personalRow(
  //                   label: "Children 2 date of birth :",
  //                   controller: controller.childTwoDob,
  //                   hinttext: "Children 2 date of birth"),
  //             ],
  //           ),
  //         ),
  //         Positioned(
  //             child: Container(
  //           height: 40,
  //           width: 180,
  //           decoration: BoxDecoration(
  //               color: color,
  //               borderRadius: BorderRadius.only(
  //                   topLeft: Radius.circular(2),
  //                   bottomRight: Radius.circular(20))),
  //           child: Center(
  //             child: Text(
  //               'Permanent address',
  //               style: TextStyle(color: Colors.white),
  //             ),
  //           ),
  //         ))
  //       ],
  //     ),
  //   );
  // }

  // academicInfoSection(
  //     {required ProfileviewscreenController controller,
  //     required BuildContext context,
  //     required Color color}) {
  //   return Container(
  //     decoration: BoxDecoration(
  //         color: color.withOpacity(0.03),
  //         border: Border.all(color: color, width: 2),
  //         borderRadius: BorderRadius.circular(5)),
  //     child: Stack(
  //       children: [
  //         Padding(
  //           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
  //           child: Column(
  //             children: [
  //               SizedBox(
  //                 height: 50,
  //               ),
  //               personalRow(
  //                   label: "Children 2 name :",
  //                   controller: controller.childTwoName,
  //                   hinttext: "Children 2 name"),
  //               personalRow(
  //                   label: "Children 2 date of birth :",
  //                   controller: controller.childTwoDob,
  //                   hinttext: "Children 2 date of birth"),
  //             ],
  //           ),
  //         ),
  //         Positioned(
  //             child: Container(
  //           height: 40,
  //           width: 180,
  //           decoration: BoxDecoration(
  //               color: color,
  //               borderRadius: BorderRadius.only(
  //                   topLeft: Radius.circular(2),
  //                   bottomRight: Radius.circular(20))),
  //           child: Center(
  //             child: Text(
  //               'Academic information',
  //               style: TextStyle(color: Colors.white),
  //             ),
  //           ),
  //         ))
  //       ],
  //     ),
  //   );
  // }

  // personalRow(
  //     {required String label,
  //     required TextEditingController controller,
  //     required String hinttext}) {
  //   return Container(
  //     margin: EdgeInsets.symmetric(vertical: 2),
  //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
  //     // decoration: BoxDecoration(
  //     //     border: Border.all(color: Colors.black, width: 1),
  //     //     borderRadius: BorderRadius.circular(5)),
  //     child: Row(
  //       children: [
  //         Expanded(flex: 1, child: textView(text: label)),
  //         SizedBox(
  //           width: 5,
  //         ),
  //         Expanded(
  //             flex: 2,
  //             child: Container(
  //               height: 40,
  //               decoration: BoxDecoration(
  //                   color: Colors.grey.shade100,
  //                   borderRadius: BorderRadius.circular(10)),
  //               child: COMMONWIDGET.commonTextEdit(
  //                   hinttext: hinttext,
  //                   controller: controller,
  //                   obsecure: false,
  //                   enabled: true,
  //                   radius: 5,
  //                   borderColor: Colors.white),
  //             ))
  //       ],
  //     ),
  //   );
  // }
