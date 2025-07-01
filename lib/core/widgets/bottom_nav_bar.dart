import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../generated/assets.dart';
import '../theming/app_colors.dart';
import '../theming/app_text_styles.dart';

class MyBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const MyBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.rect, width: 3),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
      ),
      child: BottomNavigationBar(
        iconSize: 22,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.svgsHome),
            activeIcon: SvgPicture.asset(
              Assets.svgsHome,
              color:  AppColors.primaryColor,
            ),
            label: ""
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(Assets.svgsCalendar,
              color:  AppColors.primaryColor,
            ),
            icon: SvgPicture.asset(Assets.svgsCalendar,),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 16,
              backgroundColor: AppColors.grey300,
              child: Icon(Icons.person, color: AppColors.dartBlue),
            ),
            activeIcon: CircleAvatar(
              radius: 16,
              backgroundColor: AppColors.grey300,
              child: Icon(Icons.person, color: AppColors.primaryColor),
            ),
            label: "",
          ),
        ],
        selectedLabelStyle: AppTextStyles.font12Medium(context),
        unselectedLabelStyle: AppTextStyles.font12Medium(context),
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        backgroundColor: AppColors.transparent,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
