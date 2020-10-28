import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shofri/UI/FollowingPage/followingpage.dart';
import 'package:shofri/UI/Homepage/homepage.dart';
import 'package:shofri/UI/LogIn/loginpage.dart';
import 'package:shofri/UI/LogIn/userlogin.dart';
import 'package:shofri/UI/MyWalletPage/mywallet.dart';
import 'package:shofri/UI/OfferPage/add_offer_page.dart';
import 'package:shofri/UI/OrderPage/confirm_order_page.dart';
import 'package:shofri/UI/OrderPage/my_order_page.dart';
import 'package:shofri/UI/ProductPage/add_product_page.dart';
import 'package:shofri/UI/ProductPage/add_product_page_2.dart';
import 'package:shofri/UI/ProductPage/my_product_page.dart';
import 'package:shofri/UI/ProductPage/search_product_page.dart';
import 'package:shofri/UI/ProfilePage/profile_page.dart';
import 'package:shofri/UI/ProfilePage/public_shop_page.dart';
import 'package:shofri/UI/ProfilePage/tabs/product_tab.dart';
import 'package:shofri/UI/PurchaseHistory/purchase_history_page.dart';
import 'package:shofri/UI/QRcodePage/qr_code_page.dart';
import 'package:shofri/UI/ScanPage/scan_page.dart';
import 'package:shofri/UI/ShopSettingPage/shop_settings_page.dart';
import 'package:shofri/UI/SignUp/registersellerpage.dart';
import 'package:shofri/UI/SignUp/signuppage.dart';
import 'package:shofri/UI/SignUp/verificationpage.dart';
import 'package:shofri/UI/SplashScreen/splashscreen.dart';
import 'package:shofri/UI/OnbordingScreen/pagecontrollerscreen.dart';
import 'package:shofri/UI/WithdrawPage/withdraw_page.dart';


void main()async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
    create: (_)=>UserLogin(),
    child: MyApp()));
}

class MyApp extends StatelessWidget {
final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        
        debugShowCheckedModeBanner: false,
        routes: {
          "/home": (context) => HomePage(),
          "/splash": (context) => SplashScreen(),
          "/onbording": (context) => PageControllerScreen(),
          "/login": (context) => LoginPage(),
          "/register": (context) => RegisterPage(),
          "/verification": (context) => VerificationPage(),
          "/register-seller": (context) => RegisterSellerPage(),
          "/search-product": (context) => SearchProductPage(),
          "/my-order": (context) => MyOrderPage(),
          "/confirm-order": (context) => ConfirmOrderPage(),
          "/shop-settings": (context) => ShopSettingsPage(),
          "/withdraw": (context) => WithdrawPage(),
          "/qr-code": (context) => QrCodePage(),
          "/product": (context) => MyProductPage(),
          "/add-offer": (context) => AddOfferPage(),
          "/add-product": (context) => AddProductPage(),
          "/add-product2": (context) => AddProductPage2(),
          "/purchase-history": (context) => PurchaseHistoryPage(),
          "/public-shop": (context) => PublicShopPage(),
          "/products": (context) => ProductTab(),
          "/manage-profile": (context) => ProfilePage(),
          "/scan":(context)=>ScanPage(),
          "/following":(context)=>FollowingPage(),
          "/wallet":(context)=>MyWalletPage(),
        },
        home: SplashScreen(),
      );
  }
}

  

