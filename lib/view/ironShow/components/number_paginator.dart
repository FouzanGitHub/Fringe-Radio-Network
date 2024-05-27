import '../../../dummy/ironshow_audio_list.dart';
import '../../../resources/exports/index.dart';


class NumberPaginatorIron extends StatelessWidget {
  NumberPaginatorIron({super.key});
  final IronShowController controller = Get.put(IronShowController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: GetBuilder<IronShowController>(
        id: 'Audio',
        builder: (context) {
          final totalPages =
              (ironShowAudioItems.length / controller.itemsPerPage).ceil();

          return CustomNumberPaginatorWidget(
            initialPage: 0,
            onPageChanged:(int index) {
               controller.setCurrentPage(index);
           }, 
            totalPages:totalPages,
          );
      
        },
      ),
    );
  }
}
