
import 'package:just_audio/just_audio.dart';

import '../../../dummy/home_audio_lists.dart';
import '../../../resources/exports/index.dart';
class AudioItem {
  final String title;
  final String description;
  final String audioUrl;

  AudioItem({required this.title, required this.description, required this.audioUrl});
}
class HomeController extends GetxController{

  
  late List<AudioPlayer> audioPlayer;
  late List<bool> _isPlayingList;

  int currentPage = 0;
  int itemsPerPage = 4;

  

  @override
  void onInit() {
    super.onInit();
   audioPlayer = [];
    _isPlayingList = [];
    
    for (AudioItem audioItem in audioItems) {
      AudioPlayer player = AudioPlayer();
      player.setUrl(audioItem.audioUrl);
      audioPlayer.add(player);
      _isPlayingList.add(false);
    }
  }
final Uri url = Uri.parse("https://www.spreaker.com/episode/let-the-faith-do-the-work-isaiah-50-spiritwars--60157311");

  Future<void> launchUrlWeb() async {
    if (!await launchUrl(url)) {
      throw Exception("Could not launch $url");
    }
  }

  //  void launchURL() async {
  //   String url;
  //   if (Platform.isAndroid) {
  //     // URL to open the Play Store listing of your app
  //     url = 'https://www.spreaker.com/episode/let-the-faith-do-the-work-isaiah-50-spiritwars--60157311';
  //   } else if (Platform.isIOS) {
  //     // URL to open the App Store listing of your app
  //     url = 'https://www.spreaker.com/episode/let-the-faith-do-the-work-isaiah-50-spiritwars--60157311';
  //   } else {
  //     // Handle other platforms if needed
  //     throw 'Unsupported platform';
  //   }

  //   await FlutterWebBrowser.openWebPage(
  //     url: url,
  //     // androidToolbarColor: Colors.deepPurple,
  //   );
  // }


List<AudioItem> getCurrentPageAudioItems() {
  int startIndex = currentPage * itemsPerPage;
  int endIndex = startIndex + itemsPerPage;
  endIndex = endIndex < audioItems.length ? endIndex : audioItems.length;
  List<AudioItem> currentPageItems = audioItems.sublist(startIndex, endIndex);
  return currentPageItems;
}


  
    void setCurrentPage(int page) {
    currentPage = page;
    stopAudioPlayback();
    for (int i = 0; i < itemsPerPage; i++) {
      int pageIndex = currentPage * itemsPerPage + i;
      if (pageIndex < audioPlayer.length) {
        audioPlayer[pageIndex].setUrl(audioItems[pageIndex].audioUrl);
        if (_isPlayingList[pageIndex]) {
          play(pageIndex);
        }
      }
    }
    update(['Audio']);
  }

  void stopAudioPlayback() {
    for (int i = 0; i < audioPlayer.length; i++) {
      if (isPlaying(i)) {
        pause(i);
      }
    }
  }

  bool isPlaying(int index) {
    final pageIndex = currentPage * itemsPerPage + index;
    if (pageIndex < audioPlayer.length) {
      return _isPlayingList[pageIndex];
    }
    return false;
  }

  void play(int index) {
    final pageIndex = currentPage * itemsPerPage + index;
    if (pageIndex < audioPlayer.length) {
      audioPlayer[pageIndex].play();
      _isPlayingList[pageIndex] = true;
      
    }
    update(['Audio']);
  }

  void pause(int index) {
    final pageIndex = currentPage * itemsPerPage + index;
    if (pageIndex < audioPlayer.length) {
      audioPlayer[pageIndex].pause();
      _isPlayingList[pageIndex] = false;
      
    }
    update(['Audio']);
  }

  Future<void> seek(int index, Duration position) async {
    final pageIndex = currentPage * itemsPerPage + index;
    if (pageIndex < audioPlayer.length) {
      await audioPlayer[pageIndex].seek(position);
      update(['Audio']);
    }
  }

  Stream<Duration?> positionStream(int index) {
    final pageIndex = currentPage * itemsPerPage + index;
    if (pageIndex < audioPlayer.length) {
      return audioPlayer[pageIndex].positionStream;
    }
    return Stream.empty();
  }

  Stream<Duration?> durationStream(int index) {
    final pageIndex = currentPage * itemsPerPage + index;
    if (pageIndex < audioPlayer.length) {
      return audioPlayer[pageIndex].durationStream;
    }
    return Stream.empty();
  }

  @override
  void onClose() {
    for (AudioPlayer player in audioPlayer) {
      player.dispose();
    }
    super.onClose();
  }

}