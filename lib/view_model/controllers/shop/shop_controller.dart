import '../../../resources/exports/index.dart';

class ShopController extends GetxController{
final Uri url = Uri.parse("https://www.spreaker.com/episode/let-the-faith-do-the-work-isaiah-50-spiritwars--60157311");

  Future<void> launchUrlWeb() async {
    if (!await launchUrl(url)) {
      throw Exception("Could not launch $url");
    }
  }

  
}