import '../../../resources/exports/index.dart';

class DashBoardBindings extends Bindings {  
  @override
  void dependencies() {
   Get.lazyPut(() => DashboardController(), fenix: true);
  }
}
