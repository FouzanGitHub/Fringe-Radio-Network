
import '../../../resources/exports/index.dart';

class StoreBindings extends Bindings {  
  @override
  void dependencies() {
  Get.lazyPut(() => StoreController());
  }
}
