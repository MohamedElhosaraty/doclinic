class ApiConstants {

  static const String login = "auth/login";
  static const String signUp = "auth/register";
  static const String home = "specialization/index";
  static String search(String nameDoctor) => "doctor/doctor-search?name=$nameDoctor";
  static String filter(int cityId) => "doctor/doctor-filter?city=$cityId";
 static const String bookAppointment = "appointment/store";

}
