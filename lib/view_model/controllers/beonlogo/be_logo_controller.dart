import '../../../resources/exports/index.dart';

class BeOnLogoController extends GetxController{
 
 final Uri url = Uri.parse('https://fringe-radio-network.printify.me/products');
 Future<void> launchUrlWeb() async{
  if(!await launchUrl(url)){
     throw Exception('Could Not Launch $url');
  }
 }
}