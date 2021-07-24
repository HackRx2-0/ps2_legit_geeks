import 'package:store_app/enum/view_state.dart';
import 'package:store_app/provider/base_view.dart';
import 'package:store_app/src/screens/nearby.dart';
import 'package:store_app/src/widgets/groupMessageItem.dart';
import 'package:store_app/view/groupChatViewModel.dart';

import '../models/conversation.dart' as model;
import '../widgets/EmptyMessagesWidget.dart';
import '../widgets/SearchBarWidget.dart';
import 'package:flutter/material.dart';

class MessagesWidget extends StatefulWidget {
  @override
  _MessagesWidgetState createState() => _MessagesWidgetState();
}

class _MessagesWidgetState extends State<MessagesWidget>
    with SingleTickerProviderStateMixin {
  var topNavigator1 = true,
      topNavigator2 = false,
      topNavigator3 = false,
      topNavigator4 = false;
  model.ConversationsList _conversationList;
  TabController _tabController;

  int _selectedIndex = 0;
  List<Widget> list = [
    Tab(
      text: 'People Nearby',
    ),
    Tab(text: 'Groups Nearby'),
  ];

  @override
  void initState() {
    this._conversationList = new model.GroupConversationsList();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
      print("Selected Index: " + _tabController.index.toString());
    });
    super.initState();
  }

  List<Map<dynamic, dynamic>> contactList = [
    {
      "name": "Saksham Mittal",
      "image": "img/temp/Rahul.jpeg",
    },
    {
      "name": "Raghav Shukla",
      "image": "img/temp/Raghav.jpeg",
    },
    {
      "name": "Ayush Mahajan",
      "image": "img/temp/Vinay.jpeg",
    },
    {
      "name": "Shivam Joshi",
      "image": "img/temp/yuvansh.jpeg",
    },
    {
      "name": "Rahul Dev",
      "image": "img/temp/Rahul.jpeg",
    },
  ];

  Icon newGroup = Icon(Icons.add, size: 23.0, color: Colors.white);
  Container invite = Container(
      height: 30,
      child: Image.asset(
        "img/invite.png",
        fit: BoxFit.fill,
        color: Colors.white,
      ));

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 7),
          child: Column(
            children: <Widget>[
              Container(
                color: Theme.of(context).primaryColor,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        onPressed: () {
                          setState(() {
                            _conversationList =
                                new model.GroupConversationsList();
                            topNavigator1 = true;
                            topNavigator2 = false;
                            topNavigator3 = false;
                            topNavigator4 = false;
                          });
                        },
                        child: topNavigator1
                            ? topNavigator("Group", Theme.of(context).hintColor)
                            : topNavigator("Group", null),
                      ),
                    ),
                    Expanded(
                      child: FlatButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        onPressed: () {
                          setState(() {
                            _conversationList = new model.ConversationsList();
                            topNavigator1 = false;
                            topNavigator2 = true;
                            topNavigator3 = false;
                            topNavigator4 = false;
                          });
                        },
                        child: topNavigator2
                            ? topNavigator("Chats", Theme.of(context).hintColor)
                            : topNavigator("Chats", null),
                      ),
                    ),
                    Expanded(
                      child: FlatButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 6),
                        onPressed: () {
                          setState(() {
                            _conversationList = new model.ConversationsList();
                            topNavigator1 = false;
                            topNavigator2 = false;
                            topNavigator3 = true;
                            topNavigator4 = false;
                          });
                        },
                        child: topNavigator3
                            ? topNavigator(
                                "Contacts", Theme.of(context).hintColor)
                            : topNavigator("Contacts", null),
                      ),
                    ),
                    Expanded(
                      child: FlatButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        onPressed: () {
                          setState(() {
                            _conversationList =
                                new model.PeopleNearbyConversationsList();
                            topNavigator1 = false;
                            topNavigator2 = false;
                            topNavigator3 = false;
                            topNavigator4 = true;
                          });
                        },
                        child: topNavigator4
                            ? topNavigator(
                                "Nearby", Theme.of(context).hintColor)
                            : topNavigator("Nearby", null),
                      ),
                    ),
                  ],
                ),
              ),
              if (!topNavigator4)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SearchBarWidget(),
                ),
              topNavigator4
                  ? Nearby()
                  : topNavigator3
                      ? ListView.separated(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          shrinkWrap: true,
                          primary: false,
                          itemCount: contactList.length,
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 7);
                          },
                          itemBuilder: (context, index) {
                            var person = contactList[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25.0, vertical: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Stack(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 60,
                                        height: 60,
                                        child: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              contactList[index]["image"]),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 35),
                                  Text(
                                    contactList[index]["name"],
                                    overflow: TextOverflow.fade,
                                    softWrap: false,
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                      : BaseView<GroupChatViewModel>(
                          onModelReady: (model) => model.getGroupChat(context),
                          builder: (ctx, model, child) => model.state ==
                                  ViewState.Busy
                              ? Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 150.0,
                                  ),
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                )
                              : Offstage(
                                  offstage: model.groupConversations.isEmpty,
                                  child: ListView.separated(
                                    padding: EdgeInsets.symmetric(vertical: 15),
                                    shrinkWrap: true,
                                    primary: false,
                                    itemCount: model.groupConversations.length,
                                    separatorBuilder: (context, index) {
                                      return SizedBox(height: 7);
                                    },
                                    itemBuilder: (context, index) {
                                      var conversation =
                                          model.groupConversations[index];

                                      return GroupMessageItemWidget(
                                        message: conversation,
                                        onDismissed: (conversation) {
                                          setState(() {
                                            model.groupConversations
                                                .removeAt(index);
                                          });
                                        },
                                      );
                                    },
                                  ),
                                ),
                        ),
              Offstage(
                offstage: _conversationList.conversations.isNotEmpty,
                child: EmptyMessagesWidget(),
              ),
            ],
          ),
        ),
        (topNavigator1 || topNavigator2 || topNavigator3)
            ? Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.all(25.0),
                child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 55.0,
                      width: 55.0,
                      padding: EdgeInsets.all(13.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(35.0),
                      ),
                      child: topNavigator1
                          ? newGroup
                          : (topNavigator2 ? invite : invite),
                    )),
              )
            : Container(),
      ],
    );
  }

  Widget topNavigator(String text, Color color) {
    return Column(
      children: <Widget>[
        Text(
          text,
          style: Theme.of(context).textTheme.title,
        ),
        Container(
          margin: EdgeInsets.all(5.0),
          height: 3.0,
          color: color,
        ),
      ],
    );
  }
}
