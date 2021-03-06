import 'package:store_app/services/notification_service.dart';
import 'package:store_app/src/widgets/FilterWidget.dart';
import '../screens/account.dart';
import '../screens/chat.dart';
import '../screens/favorites.dart';
import '../screens/home.dart';
import '../screens/messages.dart';
import '../screens/notifications.dart';
import '../widgets/DrawerWidget.dart';
import '../widgets/ShoppingCartButtonWidget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TabsWidget extends StatefulWidget {
  int currentTab = 3;
  int selectedTab = 3;
  String currentTitle = 'Store App';
  Widget currentPage = MessagesWidget();

  TabsWidget({
    Key key,
    this.currentTab,
  }) : super(key: key);

  @override
  _TabsWidgetState createState() {
    return _TabsWidgetState();
  }
}

class _TabsWidgetState extends State<TabsWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  NotificationsWidget _notificationsWidget =
      NotificationsWidget(NotificationService().showNotification);
  FavoritesWidget _favoritesWidget = FavoritesWidget();
  HomeWidget _homeWidget = HomeWidget();
  MessagesWidget _messagesWidget = MessagesWidget();
  AccountWidget _accountWidget = AccountWidget();
  ChatWidget _chatWidget = ChatWidget();

  @override
  initState() {
    _selectTab(widget.currentTab);
    super.initState();
  }

  @override
  void didUpdateWidget(TabsWidget oldWidget) {
    _selectTab(oldWidget.currentTab);
    super.didUpdateWidget(oldWidget);
  }

  void _selectTab(int tabItem) {
    setState(() {
      widget.currentTab = tabItem;
      widget.selectedTab = tabItem;
      switch (tabItem) {
        case 0:
          widget.currentTitle = 'Notifications';
          widget.currentPage = _notificationsWidget;
          break;
        case 1:
          widget.currentTitle = 'Favorites';
          widget.currentPage = _favoritesWidget;
          break;
        case 2:
          widget.currentTitle = 'Home';
          widget.currentPage = _homeWidget;
          break;
        case 3:
          widget.currentTitle = 'Messages';
          widget.currentPage = _messagesWidget;
          break;
        case 4:
          widget.currentTitle = 'Account';
          widget.currentPage = _accountWidget;
          break;
        case 5:
          widget.selectedTab = 3;
          widget.currentTitle = 'Chat';
          widget.currentPage = _chatWidget;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerWidget(),
      endDrawer: FilterWidget(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: MessagesWidget(),
//      bottomNavigationBar: CurvedNavigationBar(
//        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//        buttonBackgroundColor: Theme.of(context).accentColor,
//        color: Theme.of(context).focusColor.withOpacity(0.2),
//        height: 60,
//        index: widget.selectedTab,
//        onTap: (int i) {
//          this._selectTab(i);
//        },
//        items: <Widget>[
//          Icon(
//            UiIcons.bell,
//            size: 23,
//            color: Theme.of(context).focusColor,
//          ),
//          Icon(
//            UiIcons.user_1,
//            size: 23,
//            color: Theme.of(context).focusColor,
//          ),
//          Icon(
//            UiIcons.home,
//            size: 23,
//            color: Theme.of(context).focusColor,
//          ),
//          Icon(
//            UiIcons.chat,
//            size: 23,
//            color: Theme.of(context).focusColor,
//          ),
//          Icon(
//            UiIcons.heart,
//            size: 23,
//            color: Theme.of(context).focusColor,
//          ),
//        ],
//      ),
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: Theme.of(context).accentColor,
//         selectedFontSize: 0,
//         unselectedFontSize: 0,
//         iconSize: 22,
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         selectedIconTheme: IconThemeData(size: 25),
//         unselectedItemColor: Theme.of(context).hintColor.withOpacity(1),
//         currentIndex: widget.selectedTab,
//         onTap: (int i) {
//           this._selectTab(i);
//         },
//         // this will be set when a new tab is tapped
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(UiIcons.bell),
//             title: new Container(height: 0.0),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(UiIcons.heart),
//             title: new Container(height: 0.0),
//           ),
//           BottomNavigationBarItem(
//               title: new Container(height: 5.0),
//               icon: Container(
//                 width: 45,
//                 height: 45,
//                 decoration: BoxDecoration(
//                   color: Theme.of(context).accentColor,
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(50),
//                   ),
//                   boxShadow: [
//                     BoxShadow(
//                         color: Theme.of(context).accentColor.withOpacity(0.4),
//                         blurRadius: 40,
//                         offset: Offset(0, 15)),
//                     BoxShadow(
//                         color: Theme.of(context).accentColor.withOpacity(0.4),
//                         blurRadius: 13,
//                         offset: Offset(0, 3))
//                   ],
//                 ),
//                 child: new Icon(UiIcons.home,
//                     color: Theme.of(context).primaryColor),
//               )),
//           BottomNavigationBarItem(
//             icon: new Icon(UiIcons.chat),
//             title: new Container(height: 0.0),
//           ),
//           BottomNavigationBarItem(
//             icon: new Icon(UiIcons.user_1),
//             title: new Container(height: 0.0),
//           ),
//         ],
//       ),
      // floatingActionButton: FloatingActionButton(
      //   child: ClipRRect(
      //       borderRadius: BorderRadius.circular(50),
      //       child: Image.asset('img/chatbot.jpg')),
      //   onPressed: () {
      //     Navigator.of(context).pushNamed(ChatBot.routeName);
      //   },
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
    );
  }
}
