import 'package:store_app/src/screens/chatbotscreen.dart';
import 'package:store_app/src/screens/group_info.dart';
import 'package:store_app/src/screens/messages.dart';
import 'package:store_app/src/screens/shippingaddressmain.dart';
import 'package:store_app/src/screens/chat.dart';
import 'src/models/route_argument.dart';
import 'src/screens/brand.dart';
import 'src/screens/brands.dart';
import 'src/screens/cart.dart';
import 'src/screens/categories.dart';
import 'src/screens/category.dart';
import 'src/screens/checkout.dart';
import 'src/screens/checkout_done.dart';
import 'src/screens/help.dart';
import 'src/screens/languages.dart';
import 'src/screens/on_boarding.dart';
import 'src/screens/orders.dart';
import 'src/screens/grouporders.dart';
import 'src/screens/product.dart';
import 'src/screens/signin.dart';
import 'src/screens/signup.dart';
import 'src/screens/tabs.dart';
import 'src/screens/orderSummary.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => OnBoardingWidget());
      case '/SignUp':
        return MaterialPageRoute(builder: (_) => SignUpWidget());
      case '/SignIn':
        return MaterialPageRoute(builder: (_) => SignInWidget());
      case '/Categories':
        return MaterialPageRoute(builder: (_) => CategoriesWidget());
      case '/Orders':
        return MaterialPageRoute(builder: (_) => OrdersWidget());
      case '/Brands':
        return MaterialPageRoute(builder: (_) => BrandsWidget());
      case '/GroupOrders':
        return MaterialPageRoute(builder: (_) => GroupOrdersWidget());
//      case '/MobileVerification':
//        return MaterialPageRoute(builder: (_) => MobileVerification());
//      case '/MobileVerification2':
//        return MaterialPageRoute(builder: (_) => MobileVerification2());
      case '/Tabs':
        return MaterialPageRoute(
            builder: (_) => TabsWidget(
                  currentTab: args,
                ));
      case '/Category':
        return MaterialPageRoute(
            builder: (_) =>
                CategoryWidget(routeArgument: args as RouteArgument));
      case '/Brand':
        return MaterialPageRoute(
            builder: (_) => BrandWidget(
                  routeArgument: args as RouteArgument,
                ));
      case '/Product':
        return MaterialPageRoute(
            builder: (_) =>
                ProductWidget(routeArgument: args as RouteArgument));
//      case '/Food':
//        return MaterialPageRoute(
//            builder: (_) => FoodWidget(
//              routeArgument: args as RouteArgument,
//            ));
      case '/Cart':
        return MaterialPageRoute(builder: (_) => CartWidget());
      case '/Checkout':
        return MaterialPageRoute(builder: (_) => CheckoutWidget());
      case '/CheckoutDone':
        return MaterialPageRoute(builder: (_) => CheckoutDoneWidget());
      case '/Help':
        return MaterialPageRoute(builder: (_) => HelpWidget());
      case '/Languages':
        return MaterialPageRoute(builder: (_) => LanguagesWidget());
      case '/Shipping Address':
        return MaterialPageRoute(builder: (_) => MyHomePage());
      case '/Order':
        return MaterialPageRoute(builder: (_) => OrderSummaryWidget());
      case '/Chat':
        return MaterialPageRoute(
            builder: (_) => ChatWidget(
                  routeArgument: args,
                ));
      case '/groupInfo':
        return MaterialPageRoute(
            builder: (_) => GroupInfo(
                  routeArgument: args,
                ));
      case '/Chatbot':
        return MaterialPageRoute(builder: (_) => ChatBot());
      case '/Messages':
        return MaterialPageRoute(builder: (_) => MessagesWidget());
//      case '/second':
//      // Validation of correct data type
//        if (args is String) {
//          return MaterialPageRoute(
//            builder: (_) => SecondPage(
//              data: args,
//            ),
//          );
//        }
//        // If args is not of the correct type, return an error page.
//        // You can also throw an exception while in development.
//        return _errorRoute();
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
