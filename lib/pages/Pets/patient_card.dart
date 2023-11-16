import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vetmidi/core/utils/functions.dart';

import '../../core/theme/colors_theme.dart';
import '../../core/utils/app_constants.dart';
import '../../models/patients.dart';
import '../../routes/index.dart';
import '../Profile/details_items.dart';

class PatientCard extends StatelessWidget {
  const PatientCard({
    Key? key,
    required this.patient,
  }) : super(key: key);

  final Patient patient;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15 * fem),
      padding: EdgeInsets.all(20 * fem),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10 * fem)),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50 * fem,
            child: Image.asset("assets/images/dog.png"),
          ),
          SizedBox(height: 10 * fem),
          Text(patient.name, style: TextStyle(fontSize: 20 * ffem)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.edit_outlined,
                  color: ThemeColors.secondaryColor),
              SizedBox(width: 3 * fem),
              Text(
                "page.pets.editPet".tr,
                style: const TextStyle(color: ThemeColors.secondaryColor),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.petdetails);
            },
            child: Column(
              children: [
                detailsItem("page.pets.breed".tr, patient.race),
                detailsItem("page.pets.birth".tr, patient.birthDate),
                detailsItem(
                    "page.pets.Type".tr, "page.type.${patient.species}".tr),
                detailsBoolean(
                    "page.pets.Spayed".tr, patient.sterilise.toLowerCase()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
