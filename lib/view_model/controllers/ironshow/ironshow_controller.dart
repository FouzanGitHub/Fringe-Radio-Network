
import 'package:just_audio/just_audio.dart';

import '../../../dummy/ironshow_audio_list.dart';
import '../../../resources/exports/index.dart';
import '../../model/ironshow/ironshow_audio_model.dart';

class IronShowController extends GetxController{
  late List<AudioPlayer> audioPlayer;
  late List<bool> _isPlayingList;

  int currentPage = 0;
  int itemsPerPage = 5;

  

  @override
  void onInit() {
    super.onInit();
   audioPlayer = [];
    _isPlayingList = [];
    
    for (IronShowAudioModel audioItem in ironShowAudioItems) {
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

 


List<IronShowAudioModel> getCurrentPageAudioItems() {
  int startIndex = currentPage * itemsPerPage;
  int endIndex = startIndex + itemsPerPage;
  endIndex = endIndex < ironShowAudioItems.length ? endIndex : ironShowAudioItems.length;
  List<IronShowAudioModel> currentPageItems = ironShowAudioItems.sublist(startIndex, endIndex);
  return currentPageItems;
}


  
    void setCurrentPage(int page) {
    currentPage = page;
    stopAudioPlayback();
    for (int i = 0; i < itemsPerPage; i++) {
      int pageIndex = currentPage * itemsPerPage + i;
      if (pageIndex < audioPlayer.length) {
        audioPlayer[pageIndex].setUrl(ironShowAudioItems[pageIndex].audioUrl);
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