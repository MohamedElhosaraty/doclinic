import 'package:doclinic/core/helpers/extensions.dart';
import 'package:doclinic/feature/home/presentation/widgets/total_price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/helpers/toast_helper.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/utils/enum_state.dart';
import '../../../../core/utils/step_data.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../domain/entities/home_entity.dart';
import '../cubit/appointment_cubit/appointment_cubit.dart';
import 'custom_step_item.dart';
import 'custom_step_line.dart';
import 'custom_step_three_content.dart';
import 'data_and_time.dart';

class CustomStepper extends StatefulWidget {
  const CustomStepper({super.key, required this.doctorList});

  final DoctorListEntity doctorList;

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  int currentStep = 1;
  DateTime _selectedDate = DateTime.now();
  String? _selectedTime;

  @override
  Widget build(BuildContext context) {
    // to save the state
    final List<StepData> steps = [
      StepData(
        number: 1,
        label: 'Date & Time',
        content: DataAndTime(
          selectedDate: _selectedDate,
          selectedTimeIndex: _selectedTime,
          onDateSelected: (DateTime value) {
            setState(() => _selectedDate = value);
          },
          onTimeSelected: (String value) {
            setState(() => _selectedTime = value);
          },
        ),
      ),
      StepData(
        number: 2,
        label: 'Price',
        content: TotalPrice(price: widget.doctorList.price),
      ),
      StepData(
        number: 3,
        label: 'Summary',
        content: CustomStepThreeContent(
          doctorList: widget.doctorList,
          selectedDate: _selectedDate,
          selectedTime: _selectedTime,
        ),
      ),
    ];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            children: [
              for (int i = 0; i < steps.length; i++) ...[
                CustomStepItem(
                  stepNumber: steps[i].number,
                  label: steps[i].label,
                  status: _getStatus(steps[i].number),
                  onTap: () {
                    if (i + 1 == 1) {
                      setState(() {
                        currentStep = steps[i].number;
                      });
                    } else if (_selectedTime != null) {
                      setState(() {
                        currentStep = steps[i].number;
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please select date and time first'),
                        ),
                      );
                    }
                  },
                ),
                if (i < steps.length - 1)
                  CustomStepLine(status: _getStatus(steps[i + 1].number)),
              ],
            ],
          ),
        ),
        41.verticalSpace,
        Expanded(child: steps[currentStep - 1].content),
        currentStep < steps.length
            ? CustomButton(
          onPressed: () {
            if (currentStep == 1) {
              if (_selectedTime == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please select date and time'),
                  ),
                );
                return;
              }
              setState(() {
                currentStep++;
              });
            } else if (currentStep == 2) {
              setState(() {
                currentStep++;
              });
            }
          },
          yPadding: 15.sp,
          text: "Continue",
        )
            : BlocConsumer<AppointmentCubit, AppointmentState>(
          listener: (context, state) {
            if (state is AppointmentSuccess) {
              ToastHelper().showSuccessToast(context, "'Appointment Booked Successfully'");
              context.pushReplacementNamed(Routes.bookDetailsScreen,arguments:{
                "selectedDate": _selectedDate,
                "doctorList": widget.doctorList,
                "selectedTime": _selectedTime
              });
            }else if (state is AppointmentError) {
              ToastHelper().showErrorToast(context, state.error.toString());
            }
          },
          builder: (context, state) {
           return  state is AppointmentLoading ? CustomButton(
             isLoading: true,
              onPressed: () {

              },
              yPadding: 15.sp,
              text: "Book Now",
            ) :  CustomButton(
              onPressed: () {
                DateTime date = DateTime.parse(_selectedDate.toString());

                String formatted = DateFormat('EEEE, dd MMMM yyyy').format(date);
                String time = "$formatted ${_selectedTime!}";
                context.read<AppointmentCubit>().bookAppointment(
                   widget.doctorList.doctorId.toString(),
                    time,
                );
              },
              yPadding: 15.sp,
              text: "Book Now",
            ) ;
          },
        ),
      ],
    );
  }

  StepStatus _getStatus(int step) {
    if (currentStep == step) return StepStatus.current;
    if (currentStep > step) return StepStatus.completed;
    return StepStatus.inactive;
  }
}
