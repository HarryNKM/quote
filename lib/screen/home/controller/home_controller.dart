import 'package:get/get.dart';

import '../../../utils/helper/json_helper.dart';
import '../../../utils/helper/shared_pref.dart';
import '../model/home_model.dart';

class HomeController extends GetxController {
  RxList<HomeModel> quotesList = <HomeModel>[].obs;
  RxBool themeData = true.obs;

  Future<void> getJsonData() async {
    quotesList.value = await JsonHelper.jsonHelper.getJson();
  }
  Future<void> getTheme() async {
    themeData.value = await SharedHelper.sHelper.getTheme();
  }
}
