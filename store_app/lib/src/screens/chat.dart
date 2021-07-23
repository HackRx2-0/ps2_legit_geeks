import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:store_app/config/app_config.dart' as cfg;
import 'package:store_app/enum/view_state.dart';
import 'package:store_app/provider/base_view.dart';
import 'package:store_app/src/models/product.dart';
import 'package:store_app/src/screens/group_cart_page.dart';
import 'package:store_app/src/screens/group_info.dart';
import 'package:store_app/src/screens/group_wish_list.dart';
import 'package:store_app/src/widgets/ChatRecommendationWidget.dart';
import 'package:store_app/src/widgets/RecommendedCarouselItemWidget.dart';
import 'package:store_app/view/chatviewmodel.dart';

import '../../config/ui_icons.dart';
import '../models/chat.dart';
import '../models/conversation.dart';
import '../models/user.dart';
import '../widgets/ChatMessageListItemWidget.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatefulWidget {
  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  ConversationsList _conversationList = new ConversationsList();
  User _currentUser = new User.init().getCurrentUser();
  final _myListKey = GlobalKey<AnimatedListState>();
  // final myController = TextEditingController();
  final config = cfg.Colors();

  var labelCount = 0;
  ProductsList _productsList = new ProductsList();

  @override
  Widget build(BuildContext context) {
    print('tere naam vs 1');
    return Scaffold(
      appBar: AppBar(
        // titleSpacing: 2,
        backgroundColor: Color.fromRGBO(0, 138, 62, 0.1),
        elevation: 0,
        title: appBarTitle(),
        automaticallyImplyLeading: false,
        leadingWidth: 20.0,
        leading: IconButton(
          icon:
              new Icon(UiIcons.return_icon, color: Theme.of(context).hintColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          appBarActions(),
        ],
      ),
      body: BaseView<ChatViewModel>(
        // onModelDisposed: (model) => model.myController.dispose(),
        onModelReady: (model) => model.initData(),
        builder: (ctx, model, child) {
          print('tere naam');
          return model.state == ViewState.Busy
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        child: StreamBuilder(
                          stream: model.socket.stream,
                          // initialData: model.initialData,
                          builder: (ctx, snapshot) {
                            print('welcome to chats:');
                            print(snapshot.data);
                            if (!snapshot.hasData) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            final data = jsonDecode(snapshot.data.toString())
                                as Map<String, dynamic>;

                            final chat = Chat.fromJson(data);
                            _conversationList.conversations[0].chats
                                .insert(0, chat);
                            _myListKey.currentState.insertItem(0);
                            print(_conversationList.conversations[0].chats);
                            return AnimatedList(
                              key: _myListKey,
                              reverse: true,
                              padding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                              initialItemCount: _conversationList
                                  .conversations[0].chats.length,
                              itemBuilder: (context, index,
                                  Animation<double> animation) {
                                Chat chat = _conversationList
                                    .conversations[0].chats[index];
                                return ChatMessageListItem(
                                  chat: chat,
                                  animation: animation,
                                );
                              },
                            );
                          },
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          boxShadow: [
                            BoxShadow(
                                color: Theme.of(context)
                                    .hintColor
                                    .withOpacity(0.10),
                                offset: Offset(0, -4),
                                blurRadius: 10)
                          ],
                        ),
                        child: TextField(
                          controller: model.myController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(20),
                            hintText: 'Chat text here',
                            hintStyle: TextStyle(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.8)),
                            suffixIcon: IconButton(
                              padding: EdgeInsets.only(right: 30),
                              onPressed: () async {
                                // setState(() {
                                final data = jsonEncode({
                                  "room": 10,
                                  "user": 1,
                                  "message_text": model.myController.text
                                });
                                model.socket.sink.add(data);
                                model.myController.clear();
                                // });

                                // setState(() {
                                //   _conversationList.conversations[0].chats
                                //       .insert(
                                //           0,
                                //           new Chat(
                                //               text: myController.text,
                                //               time: '21min ago',
                                //               user: _currentUser));
                                //   _myListKey.currentState.insertItem(0);
                                // });
                                // Timer(Duration(milliseconds: 100), () {
                                //   model.myController.clear();
                                // });
                              },
                              icon: Icon(
                                UiIcons.cursor,
                                color: Theme.of(context).accentColor,
                                size: 30,
                              ),
                            ),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide.none),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none),
                          ),
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    right: 5,
                    left: 5,
                    top: 10,
                    child: Container(
                      height: 250,
                      // width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: PopupProductsWidget(),
                    ),
                  ),
                ]);
        },
      ),
    );
  }

  appBarTitle() {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => GroupInfo()));
      },
      child: Row(
        children: [
          Container(
              width: 35,
              height: 35,
              margin: EdgeInsets.only(top: 7, bottom: 7, right: 10),
              child: InkWell(
                borderRadius: BorderRadius.circular(300),
                onTap: () {
                  Navigator.of(context).pushNamed('/Tabs', arguments: 1);
                },
                child: CircleAvatar(
                  backgroundImage: AssetImage('img/temp/group_icon.jpeg'),
                ),
              )),
          Container(
            width: 130,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Delhi Wholesalers",
                  style: Theme.of(context).textTheme.body2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "You, Raghav and 7 others",
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.body1,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  popUpOptionMemu() {
    return PopupMenuButton<ChatBoxMenu>(
      onSelected: (ChatBoxMenu result) {},
      itemBuilder: (BuildContext context) => <PopupMenuEntry<ChatBoxMenu>>[
        const PopupMenuItem<ChatBoxMenu>(
          value: ChatBoxMenu.GroupInfo,
          child: Text('Group Info'),
        ),
        const PopupMenuItem<ChatBoxMenu>(
          value: ChatBoxMenu.Search,
          child: Text('Search'),
        ),
        const PopupMenuItem<ChatBoxMenu>(
          value: ChatBoxMenu.GroupMedia,
          child: Text('Group Media'),
        ),
        const PopupMenuItem<ChatBoxMenu>(
          value: ChatBoxMenu.ExitGroup,
          child: Text('Exit Group'),
        ),
        const PopupMenuItem<ChatBoxMenu>(
          value: ChatBoxMenu.AddShortcut,
          child: Text('Add Shortcut'),
        ),
        const PopupMenuItem<ChatBoxMenu>(
          value: ChatBoxMenu.GoToFirstMessage,
          child: Text('Go To First Message'),
        ),
        const PopupMenuItem<ChatBoxMenu>(
          value: ChatBoxMenu.Report,
          child: Text('Report'),
        ),
        const PopupMenuItem<ChatBoxMenu>(
          value: ChatBoxMenu.Orders,
          child: Text('Orders'),
        ),
      ],
    );
  }

  appBarActions() {
    return Container(
      width: 130,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => GroupWishList()));
              },
              icon: new Icon(
                UiIcons.heart,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: new FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => GroupCartPage()));
              },
              child: Stack(
                alignment: AlignmentDirectional.topEnd,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Icon(
                      UiIcons.shopping_cart,
                      color: Theme.of(context).accentColor,
                      size: 28,
                    ),
                  ),
                  Container(
                    child: Text(
                      labelCount.toString(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.caption.merge(
                            TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 9),
                          ),
                    ),
                    padding: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                        color: Theme.of(context).hintColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    constraints: BoxConstraints(
                        minWidth: 15,
                        maxWidth: 15,
                        minHeight: 15,
                        maxHeight: 15),
                  ),
                ],
              ),
              color: Colors.transparent,
            ),
          ),
          Expanded(flex: 2, child: popUpOptionMemu()),
        ],
      ),
    );
  }
}

enum ChatBoxMenu {
  GroupInfo,
  Search,
  GroupMedia,
  ExitGroup,
  AddShortcut,
  GoToFirstMessage,
  Report,
  Orders
}
