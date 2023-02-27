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
