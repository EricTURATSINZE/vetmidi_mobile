import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vetmidi/core/theme/colors_theme.dart';

import '../../components/back_button.dart';
import '../../components/button.dart';
import '../../controllers/patient_controller.dart';
import '../../core/utils/app_constants.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeColors.primaryBackground,
        body: Container(
          padding: EdgeInsets.all(20 * fem),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              backButton(),
              SizedBox(height: 10 * fem),
              Text(
                "Notifications",
                style: TextStyle(
                  fontSize: 35 * fem,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 10 * fem),
              Text(
                "12 Sep, 2023, 10:30 PM",
                style: TextStyle(
                  fontSize: 13 * ffem,
                  color: Colors.black38,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 7 * fem),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20 * fem),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10 * fem),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.airline_stops),
                    SizedBox(height: 10),
                    Text(
                      "Your pet's treatment ends tomorrow.",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Ensure their well-being by scheduling a follow-up appointment on our app.",
                      style: TextStyle(
                        color: Colors.black38,
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: Button(
                            "Dial Clinic",
                            (BuildContext ctx) {},
                            context,
                            fontSize: 14 * ffem,
                            radius: 10 * ffem,
                            backgroundColor: ThemeColors.secondaryColor,
                          ),
                        ),
                        SizedBox(width: 20 * fem),
                        Expanded(
                          child: Obx(() {
                            return Button(
                              "View Treatment",
                              (BuildContext ctx) async {
                                // await updatePatientHandler();
                              },
                              context,
                              loading: Get.find<PatientController>().loading,
                              backgroundColor: Colors.white,
                              fontSize: 14 * ffem,
                              radius: 10 * fem,
                              color: ThemeColors.secondaryColor,
                              hasBorder: true,
                            );
                          }),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
