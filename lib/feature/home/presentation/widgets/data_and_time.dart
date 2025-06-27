import 'package:doclinic/core/theming/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';

class DataAndTime extends StatefulWidget {
  const DataAndTime({
    super.key,
    required this.onDateSelected,
    required this.onTimeSelected,
    required this.selectedDate,
    required this.selectedTimeIndex,
  });

  final ValueChanged<DateTime> onDateSelected;
  final ValueChanged<String> onTimeSelected;
  final DateTime selectedDate;
  final String? selectedTimeIndex;

  @override
  State<DataAndTime> createState() => _DataAndTimeState();
}

class _DataAndTimeState extends State<DataAndTime> with AutomaticKeepAliveClientMixin {
  late DateTime _selectedDate;
  final DatePickerController _controller = DatePickerController();

  final List<String> times = [
    "08.00 AM",
    "08.30 AM",
    "09.00 AM",
    "09.30 AM",
    "10.00 AM",
    "11.00 AM",
  ];

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.selectedDate;
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Select Date",
              style: AppTextStyles.font16SemiBold(context).copyWith(
                color: AppColors.dartBlue,
              ),
            ),
            const Spacer(),
            Text(
              "Set Manual",
              style: AppTextStyles.font12Medium(context).copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
        24.verticalSpace,
        Row(
          children: [
            IconButton(
              onPressed: () {
                final newDate = _selectedDate.subtract(const Duration(days: 1));
                _controller.setDateAndAnimate(newDate);
                setState(() {
                  _selectedDate = newDate;
                });
                widget.onDateSelected(newDate);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
                size: 20,
                color: AppColors.dartBlue,
              ),
            ),
            Expanded(
              child: DatePicker(
                controller: _controller,
                DateTime.now(),
                height: 90,
                width: 60,
                initialSelectedDate: _selectedDate,
                dayTextStyle: AppTextStyles.font12Medium(context).copyWith(
                  color: AppColors.lightGrey,
                ),
                dateTextStyle: AppTextStyles.font12Medium(context).copyWith(
                  color: AppColors.lightGrey,
                ),
                monthTextStyle: AppTextStyles.font12Medium(context).copyWith(
                  color: AppColors.lightGrey,
                ),
                selectionColor: AppColors.primaryColor,
                selectedTextColor: AppColors.background,
                onDateChange: (date) {
                  setState(() {
                    _selectedDate = date;
                  });
                  widget.onDateSelected(date);
                },
              ),
            ),
            IconButton(
              onPressed: () {
                final newDate = _selectedDate.add(const Duration(days: 1));
                _controller.setDateAndAnimate(newDate);
                setState(() {
                  _selectedDate = newDate;
                });
                widget.onDateSelected(newDate);
              },
              icon: const Icon(
                Icons.arrow_forward_ios_outlined,
                size: 20,
                color: AppColors.dartBlue,
              ),
            ),
          ],
        ),
        24.verticalSpace,
        Text(
          "Available time",
          style: AppTextStyles.font16SemiBold(context).copyWith(
            color: AppColors.dartBlue,
          ),
        ),
        24.verticalSpace,
        Wrap(
          spacing: 12,
          runSpacing: 14,
          children: List.generate(times.length, (index) {
            final isSelected = widget.selectedTimeIndex == times[index];

            return GestureDetector(
              onTap: () {
                widget.onTimeSelected(times[index]);
              },
              child: Container(
                width: MediaQuery.of(context).size.width * .42,
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primaryColor : Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Text(
                  times[index],
                  style: AppTextStyles.font16Medium(context).copyWith(
                    color: isSelected ? AppColors.background : AppColors.moreGrey,
                  ),
                ),
              ),
            );
          }),
        ),
        24.verticalSpace,
      ],
    );
  }
}
