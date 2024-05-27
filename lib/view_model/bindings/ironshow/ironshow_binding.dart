import '../../../resources/exports/index.dart';

class IronShowBinding extends Bindings {  
@override
  void dependencies() {
    Get.lazyPut(() => IronShowController());
  }
}
