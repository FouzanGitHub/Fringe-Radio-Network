import '../../../resources/exports/index.dart';

class DonateController extends GetxController {
final Uri url = Uri.parse('https://www.paypal.com/paypalme/photondan');
Future<void> launchUrlWeb() async{
   if(!await launchUrl(url)){
     throw Exception('Could Not Launch $url');
   }
}
}