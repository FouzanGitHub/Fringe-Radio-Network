import '../../../resources/exports/index.dart';

class SplashBindings extends Bindings {  
  @override
  void dependencies() {
   Get.lazyPut(() => SplashController());
  }
}
