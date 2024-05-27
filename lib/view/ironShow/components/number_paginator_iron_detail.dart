import '../../../dummy/iron_show_list.dart';
import '../../../resources/exports/index.dart';


class NumberPaginatorIronDetail extends StatelessWidget {
  NumberPaginatorIronDetail({super.key});
  final IronShowAudioDetailController ironDetailController = Get.put(IronShowAudioDetailController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: GetBuilder<IronShowAudioDetailController>(
        id: 'AudioDetail',
        builder: (context) {
          final totalPages =
              (ironShowDetailItems.length / ironDetailController.itemsPerPage).ceil();

          return CustomNumberPaginatorWidget(
            initialPage: 0,
            onPageChanged:(int index) {
               ironDetailController.setCurrentPage(index);
           }, 
            totalPages:totalPages,
          );
      
        },
      ),
    );
  }
}
