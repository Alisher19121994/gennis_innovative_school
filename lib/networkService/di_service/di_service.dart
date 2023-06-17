import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';

import '../../controller/create_list.dart';
import '../../controller/users_list.dart';

class DIService {

  static Future<void> init() async {
    Get.lazyPut<UserListController>(() => UserListController(), fenix: true);
    Get.lazyPut<CreateController>(() => CreateController(), fenix: true);
  }
}
