import '../../../resources/exports/index.dart';

class SplashController extends GetxController{
@override
void onInit() {
    Timer(const Duration(seconds: 3),(){
      Get.offAllNamed(Routes.dashboard);
    });
    super.onInit();
  }
}