import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';

import '../../controller/create_list.dart';

class DIService {

  static Future<void> init() async {
    Get.lazyPut<CreateController>(() => CreateController(), fenix: true);
  }
}
