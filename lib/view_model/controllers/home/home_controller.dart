import 'package:just_audio/just_audio.dart';

import '../../../resources/exports/index.dart';
class AudioItem {
  final String title;
  final String description;
  final String audioUrl;

  AudioItem({required this.title, required this.description, required this.audioUrl});
}
class HomeController extends GetxController{

 final List<AudioItem> audioItems = [
    AudioItem(
      title: "Title 1",
      description: "Description 1",
      audioUrl: "https://dts.podtrac.com/redirect.mp3/mgln.ai/track/api.spreaker.com/download/episode/60054991/a_man_shall_be_as_an_hiding_place_from_the_wind_isaiah_32.mp3",
    ),
     AudioItem(
      title: "Title 2",
      description: "Description 2",
      audioUrl: "https://dts.podtrac.com/redirect.mp3/mgln.ai/track/api.spreaker.com/download/episode/59992872/god_s_word_cannot_fail_isaiah_33_and_34.mp3",
    ),
    // Add more audio items here
  ];
  late List<AudioPlayer> audioPlayer;
  late List<bool> _isPlayingList;

  int currentPage = 0;
  int itemsPerPage = 2;

  

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