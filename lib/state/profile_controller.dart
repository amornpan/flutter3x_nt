import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  var profile = {}.obs;

  Future<void> getProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    profile.value = json.decode(prefs.getString('profile')!);
  }

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }
}
