
import '../../../resources/exports/index.dart';

class AboutBindings extends Bindings {  
  @override
  void dependencies() {
    Get.lazyPut(() => AboutController());
  }
}
