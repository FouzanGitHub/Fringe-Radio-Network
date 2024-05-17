import '../../../resources/exports/index.dart';

class HomeBindings extends Bindings { 
   @override
  void dependencies() {
  Get.lazyPut(() => HomeController());
  }
}
