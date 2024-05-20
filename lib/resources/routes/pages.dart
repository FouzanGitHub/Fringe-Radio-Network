import '../exports/index.dart';


class Pages  {
    static List<GetPage> getPages(){
    return [
    GetPage(
    name:  Routes.splash, 
    page:() =>  SplashScreen(),
    binding: SplashBindings()
    ),
    
    GetPage(
    name:  Routes.dashboard, 
    page:() => const Dashboard(),
    binding: DashBoardBindings()
    ),  
     GetPage(
    name:  Routes.home, 
    page:() =>  HomeScreen(),
    binding: HomeBindings()
    ),
     GetPage(
    name:  Routes.about, 
    page:() => const AboutScreen(),
    binding: AboutBindings()
    ),
     GetPage(
    name:  Routes.store, 
    page:() => const StoreScreen(),
    binding: StoreBindings()
    ),
     GetPage(
    name:  Routes.liveChat, 
    page:() => const ChatLiveScreen(),
    binding: ChatLiveBindings()
    ),  
    ];
    }
}