import '../../../resources/exports/index.dart';

class BeOnLogoBinding extends Bindings {  
  @override
  void dependencies() {
    Get.lazyPut(() => BeOnLogoController());
  }
}
