import 'package:just_audio/just_audio.dart';

import '../../../resources/exports/index.dart';

class HomeController extends GetxController{
// final AudioPlayer audioPlayer = AudioPlayer();
final List<String> audioUrls = [
'https://dts.podtrac.com/redirect.mp3/mgln.ai/track/api.spreaker.com/download/episode/60054991/a_man_shall_be_as_an_hiding_place_from_the_wind_isaiah_32.mp3',
'https://dts.podtrac.com/redirect.mp3/mgln.ai/track/api.spreaker.com/download/episode/59992872/god_s_word_cannot_fail_isaiah_33_and_34.mp3',
'https://dts.podtrac.com/redirect.mp3/mgln.ai/track/api.spreaker.com/download/episode/60054991/a_man_shall_be_as_an_hiding_place_from_the_wind_isaiah_32.mp3',
'https://dts.podtrac.com/redirect.mp3/mgln.ai/track/api.spreaker.com/download/episode/59992872/god_s_word_cannot_fail_isaiah_33_and_34.mp3',
'https://dts.podtrac.com/redirect.mp3/mgln.ai/track/api.spreaker.com/download/episode/60054991/a_man_shall_be_as_an_hiding_place_from_the_wind_isaiah_32.mp3',
'https://dts.podtrac.com/redirect.mp3/mgln.ai/track/api.spreaker.com/download/episode/59992872/god_s_word_cannot_fail_isaiah_33_and_34.mp3',
'https://dts.podtrac.com/redirect.mp3/mgln.ai/track/api.spreaker.com/download/episode/60054991/a_man_shall_be_as_an_hiding_place_from_the_wind_isaiah_32.mp3',
'https://dts.podtrac.com/redirect.mp3/mgln.ai/track/api.spreaker.com/download/episode/59992872/god_s_word_cannot_fail_isaiah_33_and_34.mp3'
'https://dts.podtrac.com/redirect.mp3/mgln.ai/track/api.spreaker.com/download/episode/60054991/a_man_shall_be_as_an_hiding_place_from_the_wind_isaiah_32.mp3',
'https://dts.podtrac.com/redirect.mp3/mgln.ai/track/api.spreaker.com/download/episode/59992872/god_s_word_cannot_fail_isaiah_33_and_34.mp3',
'https://dts.podtrac.com/redirect.mp3/mgln.ai/track/api.spreaker.com/download/episode/60054991/a_man_shall_be_as_an_hiding_place_from_the_wind_isaiah_32.mp3',
'https://dts.podtrac.com/redirect.mp3/mgln.ai/track/api.spreaker.com/download/episode/59992872/god_s_word_cannot_fail_isaiah_33_and_34.mp3',
'https://dts.podtrac.com/redirect.mp3/mgln.ai/track/api.spreaker.com/download/episode/60054991/a_man_shall_be_as_an_hiding_place_from_the_wind_isaiah_32.mp3',
'https://dts.podtrac.com/redirect.mp3/mgln.ai/track/api.spreaker.com/download/episode/59992872/god_s_word_cannot_fail_isaiah_33_and_34.mp3',
'https://dts.podtrac.com/redirect.mp3/mgln.ai/track/api.spreaker.com/download/episode/60054991/a_man_shall_be_as_an_hiding_place_from_the_wind_isaiah_32.mp3',
'https://dts.podtrac.com/redirect.mp3/mgln.ai/track/api.spreaker.com/download/episode/59992872/god_s_word_cannot_fail_isaiah_33_and_34.mp3'
'https://dts.podtrac.com/redirect.mp3/mgln.ai/track/api.spreaker.com/download/episode/60054991/a_man_shall_be_as_an_hiding_place_from_the_wind_isaiah_32.mp3',
'https://dts.podtrac.com/redirect.mp3/mgln.ai/track/api.spreaker.com/download/episode/59992872/god_s_word_cannot_fail_isaiah_33_and_34.mp3',
'https://dts.podtrac.com/redirect.mp3/mgln.ai/track/api.spreaker.com/download/episode/60054991/a_man_shall_be_as_an_hiding_place_from_the_wind_isaiah_32.mp3',
'https://dts.podtrac.com/redirect.mp3/mgln.ai/track/api.spreaker.com/download/episode/59992872/god_s_word_cannot_fail_isaiah_33_and_34.mp3',
'https://dts.podtrac.com/redirect.mp3/mgln.ai/track/api.spreaker.com/download/episode/60054991/a_man_shall_be_as_an_hiding_place_from_the_wind_isaiah_32.mp3',
'https://dts.podtrac.com/redirect.mp3/mgln.ai/track/api.spreaker.com/download/episode/59992872/god_s_word_cannot_fail_isaiah_33_and_34.mp3',
'https://dts.podtrac.com/redirect.mp3/mgln.ai/track/api.spreaker.com/download/episode/60054991/a_man_shall_be_as_an_hiding_place_from_the_wind_isaiah_32.mp3',
'https://dts.podtrac.com/redirect.mp3/mgln.ai/track/api.spreaker.com/download/episode/59992872/god_s_word_cannot_fail_isaiah_33_and_34.mp3'
'https://dts.podtrac.com/redirect.mp3/mgln.ai/track/api.spreaker.com/download/episode/60054991/a_man_shall_be_as_an_hiding_place_from_the_wind_isaiah_32.mp3',
'https://dts.podtrac.com/redirect.mp3/mgln.ai/track/api.spreaker.com/download/episode/59992872/god_s_word_cannot_fail_isaiah_33_and_34.mp3',
'https://dts.podtrac.com/redirect.mp3/mgln.ai/track/api.spreaker.com/download/episode/60054991/a_man_shall_be_as_an_hiding_place_from_the_wind_isaiah_32.mp3',
'https://dts.podtrac.com/redirect.mp3/mgln.ai/track/api.spreaker.com/download/episode/59992872/god_s_word_cannot_fail_isaiah_33_and_34.mp3',
'https://dts.podtrac.com/redirect.mp3/mgln.ai/track/api.spreaker.com/download/episode/60054991/a_man_shall_be_as_an_hiding_place_from_the_wind_isaiah_32.mp3',
'https://dts.podtrac.com/redirect.mp3/mgln.ai/track/api.spreaker.com/download/episode/59992872/god_s_word_cannot_fail_isaiah_33_and_34.mp3',
'https://dts.podtrac.com/redirect.mp3/mgln.ai/track/api.spreaker.com/download/episode/60054991/a_man_shall_be_as_an_hiding_place_from_the_wind_isaiah_32.mp3',
'https://dts.podtrac.com/redirect.mp3/mgln.ai/track/api.spreaker.com/download/episode/59992872/god_s_word_cannot_fail_isaiah_33_and_34.mp3'


];
final List<AudioPlayer> audioPlayer = [];
final List<bool> _isPlayingList = [];

  int currentPage = 0;
  int itemsPerPage = 5;
 void setCurrentPage(int page) {
    currentPage = page;
    print('Current Page: $currentPage');
    update(['Audio']); // Update UI when currentPage changes
  }
  
  @override
  void onInit() {
    super.onInit();
    // audioPlayer.setAsset('assets/audio/audio1.mp3');
    // audioPlayer.setUrl('https://dts.podtrac.com/redirect.mp3/mgln.ai/track/api.spreaker.com/download/episode/60054991/a_man_shall_be_as_an_hiding_place_from_the_wind_isaiah_32.mp3');
    for (String url in audioUrls) {
      AudioPlayer player = AudioPlayer();
      player.setUrl(url);
      audioPlayer.add(player);
      _isPlayingList.add(false);
  
      
    }
  }
List<String> getCurrentPageAudioUrls() {
  int startIndex = currentPage * itemsPerPage;
  int endIndex = startIndex + itemsPerPage;
  endIndex = endIndex < audioUrls.length ? endIndex : audioUrls.length;
  List<String> currentPageUrls = audioUrls.sublist(startIndex, endIndex);
  print('Current Page URLs: $currentPageUrls'); // Add this line for debugging
  
  return currentPageUrls;
  
}


    bool isPlaying(int index) {
    return _isPlayingList[index];
  }

  void play(int index) {
    audioPlayer[index].play();
    _isPlayingList[index] = true;
    update(['Audio']);
  }

  void pause(int index) {
    audioPlayer[index].pause();
    _isPlayingList[index] = false;
    update(['Audio']);
  }

  Future<void> seek(int index,Duration position) async {
    await audioPlayer[index].seek(position);
    update(['Audio']);
  }

  Stream<Duration?>  positionStream(int index) => audioPlayer[index].positionStream;
  Stream<Duration?>  durationStream(int index) => audioPlayer[index].durationStream;

  @override
  void onClose() {
    for (AudioPlayer player in audioPlayer) {
      player.dispose();
    }
    super.onClose();
  }

}