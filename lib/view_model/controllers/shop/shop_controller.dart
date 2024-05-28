import '../../../resources/exports/index.dart';

class ShopController extends GetxController{
final Uri url = Uri.parse("https://fringe-radio-network.printify.me/");

  Future<void> launchUrlWeb() async {
    if (!await launchUrl(url)) {
      throw Exception("Could not launch $url");
    }
  }

  
}