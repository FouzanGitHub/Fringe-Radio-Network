import '../../resources/exports/index.dart';

class SpiritWarScreen extends GetView<SpiritWarController> {
  const SpiritWarScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(showImage: true),
      endDrawer: MyDrawer(),
      body: GetBuilder<SpiritWarController>(
          id: 'SpiritAudio',
          builder: (context) {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TopAudioSpirt(),
                        AudioDetailListSpirit(),
                        const SpaceH20(),
                      ],
                    ),
                  ),
                ),
                NumberPaginatorSpirit()
              ],
            );
          }),
    );
  }
}
