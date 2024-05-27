import '../../../resources/exports/index.dart';

class SpiritWarBinding extends Bindings {  
@override
  void dependencies() {
   Get.lazyPut(() => SpiritWarController());
  }
}
