import 'package:fringe_radio_network/dummy/spirit_war.dart';
import 'package:just_audio/just_audio.dart';

import '../../../resources/exports/index.dart';
import '../../model/spirit_war/spirit_war_model.dart';

class SpiritWarController extends GetxController{

  
  late List<AudioPlayer> audioPlayer;
  late List<bool> _isPlayingList;

  int currentPage = 0;
  int itemsPerPage = 4;

  

  @override
  void onInit() {
    super.onInit();
   audioPlayer = [];
    _isPlayingList = [];
    
    for (SpiritWarModel audioItem in spiritWarItems) {
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



List<SpiritWarModel> getCurrentPageAudioItems() {
  int startIndex = currentPage * itemsPerPage;
  int endIndex = startIndex + itemsPerPage;
  endIndex = endIndex < spiritWarItems.length ? endIndex : spiritWarItems.length;
  List<SpiritWarModel> currentPageItems = spiritWarItems.sublist(startIndex, endIndex);
  return currentPageItems;
}


  
    void setCurrentPage(int page) {
    currentPage = page;
    stopAudioPlayback();
    for (int i = 0; i < itemsPerPage; i++) {
      int pageIndex = currentPage * itemsPerPage + i;
      if (pageIndex < audioPlayer.length) {
        audioPlayer[pageIndex].setUrl(spiritWarItems[pageIndex].audioUrl);
        if (_isPlayingList[pageIndex]) {
          play(pageIndex);
        }
      }
    }
    update(['SpiritAudio']);
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
    update(['SpiritAudio']);
  }

  void pause(int index) {
    final pageIndex = currentPage * itemsPerPage + index;
    if (pageIndex < audioPlayer.length) {
      audioPlayer[pageIndex].pause();
      _isPlayingList[pageIndex] = false;
      
    }
    update(['SpiritAudio']);
  }

  Future<void> seek(int index, Duration position) async {
    final pageIndex = currentPage * itemsPerPage + index;
    if (pageIndex < audioPlayer.length) {
      await audioPlayer[pageIndex].seek(position);
      update(['SpiritAudio']);
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