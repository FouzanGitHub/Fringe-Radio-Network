import '../../../resources/exports/index.dart';

class DonateBinding extends Bindings { 
   @override
  void dependencies() {
     Get.lazyPut(() =>  DonateController());
  }
}
