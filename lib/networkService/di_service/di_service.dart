import 'package:gennis_innovative_school/controller/entrance_list.dart';
import 'package:gennis_innovative_school/controller/profile_page.dart';
import 'package:gennis_innovative_school/controller/splash_page.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';
import '../../controller/create_list.dart';
import '../../controller/point_list.dart';
import '../../controller/users_list.dart';

class DIService {
  static Future<void> init() async {
    Get.lazyPut<SplashController>(() => SplashController(), fenix: true);
    Get.lazyPut<ProfileController>(() => ProfileController(), fenix: true);
    Get.lazyPut<EntranceController>(() => EntranceController(), fenix: true);
    Get.lazyPut<UserListController>(() => UserListController(), fenix: true);
    Get.lazyPut<CreateController>(() => CreateController(), fenix: true);
    Get.lazyPut<PointListController>(() => PointListController(), fenix: true);
    Get.put(EntranceController(),permanent: true);
  }
}
