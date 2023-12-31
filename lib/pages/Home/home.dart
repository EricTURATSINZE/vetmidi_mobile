import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vetmidi/pages/Home/home_pet_avatar.dart';
import 'package:vetmidi/pages/Home/treatments_list.dart';
import 'package:vetmidi/routes/index.dart';

import '../../controllers/auth_controller.dart';
import '../../controllers/patient_controller.dart';
import '../../controllers/profile_controller.dart';
import '../../core/theme/colors_theme.dart';
import '../../core/utils/app_constants.dart';
import 'appointments_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    String token = Get.find<AuthController>().token?.accessToken ?? "";

    if (!Get.find<PatientController>().fetchedPatients) {
      Future.delayed(const Duration(seconds: 0), () {
        Get.find<PatientController>().getPatients(token);
      });
    }

    if (!Get.find<ProfileController>().fetchedProfile) {
      Future.delayed(const Duration(seconds: 0), () {
        Get.find<ProfileController>().getProfile(token);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Obx(() {
      return Container(
        color: ThemeColors.primaryBackground,
        padding: EdgeInsets.all(20 * fem),
        height: Get.height,
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${"page.home.hello".tr}, ${Get.find<ProfileController>().profile?.firstName}!",
                  style: TextStyle(
                    fontSize: 33 * ffem,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.notifications),
                  child: Container(
                    padding: EdgeInsets.all(8 * fem),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10 * fem),
                        color: Colors.white),
                    child: Icon(
                      Icons.notifications_outlined,
                      size: 29,
                      color: ThemeColors.secondaryColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10 * fem),
            Text("Your Pets"),
            SizedBox(height: 10 * fem),
            Container(
              height: 120 * fem,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: Get.find<PatientController>().loading
                    ? [
                        homePetAvatarLoading(),
                        homePetAvatarLoading(),
                      ]
                    : [
                        ...Get.find<PatientController>()
                            .patients
                            .map((pet) => homePetAvatar(pet.webImage, pet.name))
                            .toList(),
                        GestureDetector(
                          onTap: () => Get.toNamed(AppRoutes.addpet),
                          child: Container(
                            height: 95 * fem,
                            width: 75 * fem,
                            margin: EdgeInsets.only(top: 7 * fem),
                            decoration: BoxDecoration(
                              color:
                                  ThemeColors.secondaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20 * fem),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add,
                                  color: ThemeColors.secondaryColor,
                                  size: 30 * ffem,
                                ),
                                SizedBox(height: 5 * fem),
                                Text(
                                  "Add Pet",
                                  style: TextStyle(
                                    fontSize: 13 * ffem,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
              ),
            ),
            SizedBox(height: 20 * fem),
            appointmentList(),
            treatmentList(),
          ],
        ),
      );
    }));
  }
}
