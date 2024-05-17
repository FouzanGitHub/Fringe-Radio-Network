import '../../../resources/exports/index.dart';

class ChatLiveBindings extends Bindings {  
  @override
  void dependencies() {
  Get.lazyPut(() => ChatLiveController());
  }
}
