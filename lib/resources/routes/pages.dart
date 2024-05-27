
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
    page:() => const ShopScreen(),
    binding: ShopBindings()
    ),
     GetPage(
    name:  Routes.liveChat, 
    page:() => const ChatLiveScreen(),
    binding: ChatLiveBindings()
    ), 
    GetPage(
    name:  Routes.chatting, 
    page:() =>  ChattingScreen(),
    binding: ChatLiveBindings()
    ),

   GetPage(
    name:  Routes.donate, 
    page:() =>   const DonateScreen(),
    binding: DonateBinding()
    ),

     GetPage(
    name:  Routes.ironShow, 
    page:() =>   IronShowScreen(),
    binding: IronShowBinding()
    ),
     GetPage(
    name:  Routes.spiritWar, 
    page:() =>   SpiritWarScreen(),
    binding: SpiritWarBinding()
    ),


     GetPage(
    name:  Routes.beOnLogo, 
    page:() =>   BeOnLogoScreen(),
    binding: SpiritWarBinding()
    ),
    GetPage(
    name:  Routes.contactUs, 
    page:() =>  ContactUsScreen(),
    binding: ContactUsBinding()
    ),
    ];
    }
}