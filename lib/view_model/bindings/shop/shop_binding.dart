
import '../../../resources/exports/index.dart';

class ShopBindings extends Bindings {  
  @override
  void dependencies() {
  Get.lazyPut(() => ShopController());
  }
}
