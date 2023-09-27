import 'package:gennis_innovative_school/controller/entrance_list.dart';
import 'package:gennis_innovative_school/controller/profile_page.dart';
import 'package:gennis_innovative_school/controller/splash_page.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';
import '../../controller/attendance_list.dart';
import '../../controller/create_list.dart';
import '../../controller/edu_plan_list.dart';
import '../../controller/profile_changable_details.dart';
import '../../controller/profile_photo.dart';
import '../../controller/sign_in.dart';
import '../../controller/users_list.dart';

class DIService {
  static Future<void> init() async {
    Get.lazyPut<SplashController>(() => SplashController(), fenix: true);
    Get.lazyPut<ProfileController>(() => ProfileController(), fenix: true);
    Get.lazyPut<EntranceController>(() => EntranceController(), fenix: true);
    Get.lazyPut<UserListController>(() => UserListController(), fenix: true);
    Get.lazyPut<CreateController>(() => CreateController(), fenix: true);
    Get.lazyPut<EduLessonPlanController>(() => EduLessonPlanController(), fenix: true);
    Get.lazyPut<AttendanceController>(() => AttendanceController(), fenix: true);
    Get.lazyPut<SignInController>(() => SignInController(), fenix: true);
    Get.lazyPut<ProfileDetailsController>(() => ProfileDetailsController(), fenix: true);
    Get.lazyPut<ProfilePhotoController>(() => ProfilePhotoController(), fenix: true);
  }
}
