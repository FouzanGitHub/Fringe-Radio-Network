import 'package:fringe_radio_network/view/home/components/audio_detail_list.dart';
import 'package:fringe_radio_network/view/home/components/top_single_audio.dart';
import '../../resources/exports/index.dart';
import 'components/about_us.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({super.key});
  @override
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(
        id: 'Audio',
        builder: (context) {
          return Column(
            children: [
              const Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TopSingleAudioHome(),
                      CustomDivider(),
                      SpaceH10(),
                      AudioDetailListHome(),
                      HomeAboutUs(),
                      SpaceH20(),
                    ],
                  ),
                ),
              ),
              NumberPaginatorHome(),
            ],
          );
        }
      ),
    );
  }
}
