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
      leading: new IconButton(
        icon: new Icon(Icons.sort, color: Theme.of(context).hintColor),
        onPressed: () => _scaffoldKey.currentState.openDrawer(),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        widget.currentTitle,
        style: Theme.of(context).textTheme.display1,
      ),
      actions: <Widget>[
        new ShoppingCartButtonWidget(
            iconColor: Theme.of(context).hintColor,
            labelColor: Theme.of(context).accentColor),
        Container(
            width: 30,
            height: 30,
            margin: EdgeInsets.only(top: 12.5, bottom: 12.5, right: 20),
            child: InkWell(
              borderRadius: BorderRadius.circular(300),
              onTap: () {
                Navigator.of(context).pushNamed('/Tabs', arguments: 4);
              },
              child: CircleAvatar(
                backgroundImage: AssetImage('img/user2.jpg'),
              ),
            )),
      ],
    );
  }
}
