import '../../resources/exports/index.dart';


class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Lynz Piper Loomis: Aliens, Shapeshifting and Church - Discovering Truth with Dan Duval',
          style: CustomTextTheme.regular18,
          )
        ],
      ),
    );
  }
}
