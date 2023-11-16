import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theme/colors_theme.dart';
import '../../core/utils/app_constants.dart';
import '../../core/utils/functions.dart';

Column detailsItem(String label, String value) {
  return Column(
    children: [
      const Divider(color: Colors.black12, thickness: 1),
      SizedBox(height: 8 * fem),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(
            value,
            style: const TextStyle(color: Colors.black87),
          ),
        ],
      ),
      SizedBox(height: 5 * fem),
    ],
  );
}

Column detailsBoolean(String label, String value) {
  return Column(
    children: [
      const Divider(color: Colors.black12, thickness: 1),
      SizedBox(height: 8 * fem),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Row(
            children: [
              getTranslationKeys(value) == "page.general.yes"
                  ? const Icon(
                      Icons.check_circle_outline,
                      color: ThemeColors.secondaryColor,
                      size: 18,
                    )
                  : Icon(
                      Icons.highlight_off,
                      color: ThemeColors.deleteRed2.withOpacity(0.6),
                      size: 18,
                    ),
              SizedBox(width: 4 * fem),
              Text(
                getTranslationKeys(value).tr,
                style: const TextStyle(color: Colors.black38),
              ),
            ],
          ),
        ],
      ),
      SizedBox(height: 5 * fem),
    ],
  );
}