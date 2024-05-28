import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/services.dart' show PlatformException;
import '../../../resources/exports/index.dart';
import 'package:http/http.dart' as http;
class BeOnLogoController extends GetxController{
 
 final Uri url = Uri.parse('https://fringe-radio-network.printify.me/products');
final String imageUrl = "https://fringeradionetwork.com/logo/fringeradio_cr.jpg";
 
 Future<void> launchUrlWeb() async{
  if(!await launchUrl(url)){
     throw Exception('Could Not Launch $url');
  }
 }





}