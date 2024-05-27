import '../../../resources/exports/index.dart';


class ContactUsBinding extends Bindings { 
   @override
  void dependencies() {
    Get.lazyPut(() => ContactUsController());
  }
}
