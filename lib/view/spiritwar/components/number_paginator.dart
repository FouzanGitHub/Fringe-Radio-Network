import '../../../dummy/spirit_war.dart';
import '../../../resources/exports/index.dart';


class NumberPaginatorSpirit extends StatelessWidget {
  NumberPaginatorSpirit({super.key});
  final SpiritWarController controller = Get.put(SpiritWarController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: GetBuilder<SpiritWarController>(
        id: 'SpiritAudio',
        builder: (context) {
          final totalPages =
              (spiritWarItems.length / controller.itemsPerPage).ceil();

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
