import 'resources/exports/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
        title: 'Fringe Radio Network',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        scaffoldBackgroundColor: AppColors.scaffoldBlack
        ),
        builder: (context, widget) {
          return ResponsiveWrapper.builder(
            MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: const TextScaler.linear(1),
              ),
              child: BouncingScrollWrapperX.builder(
                context,
                widget!,
                dragWithMouse: true,
              ),
            ),
            defaultScale: true,
            breakpoints: const [
              ResponsiveBreakpoint.autoScaleDown(450, name: MOBILE),
            ],
          );
        },
       
        initialRoute: Routes.splash,
        getPages: Pages.getPages(),
        defaultTransition: Transition.rightToLeft,
        smartManagement: SmartManagement.full,
      );
    
  }
}
