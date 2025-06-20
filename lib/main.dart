import 'package:doclinic/doclinic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/api/dio_factory.dart';
import 'core/di/dependency_injection.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/observer/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait<void>([ScreenUtil.ensureScreenSize(),  setupGetIt(), DioFactory.init()]);
  Bloc.observer = MyBlocObserver();
  runApp(const DoClinicApp());
}

