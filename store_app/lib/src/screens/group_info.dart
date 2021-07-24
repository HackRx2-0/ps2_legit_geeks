import 'package:flutter/material.dart';
import 'package:store_app/config/ui_icons.dart';
import 'package:store_app/provider/base_view.dart';
import 'package:store_app/src/models/route_argument.dart';
import 'package:store_app/src/screens/group_cart_page.dart';
import 'package:store_app/view/group_info_viewmodel.dart';

import 'group_wish_list.dart';

class GroupInfo extends StatefulWidget {
  static const routeName = '/groupInfo';
  final RouteArgument routeArgument;
  GroupInfo({this.routeArgument});
  @override
  _GroupInfoState createState() => _GroupInfoState();
}

class _GroupInfoState extends State<GroupInfo> {
  var groupName = "Delhi Wholesalers", labelCount = 0;
  Image groupIcon = Image.network(
      "https://www.seoclerk.com/pics/want55776-16Dnv61508955325.png");
  var description =
      "Group Description:- aaaaaaaaaaa bbbbb vfddddddddds aaaaaaaafffgbnjk dyuhfcffffffds";
  List<dynamic> members = [
    {
      "name": "member 1",
      "imageUrl":
          "https://www.publicdomainpictures.net/pictures/270000/velka/avatar-people-person-business-.jpg"
    },
    {
      "name": "member 2",
      "imageUrl":
          "https://www.publicdomainpictures.net/pictures/270000/velka/avatar-people-person-business-.jpg"
    },
    {
      "name": "member 3",
      "imageUrl":
          "https://www.publicdomainpictures.net/pictures/270000/velka/avatar-people-person-business-.jpg"
    },
    {
      "name": "member 4",
      "imageUrl":
          "https://static.vecteezy.com/system/resources/thumbnails/001/980/744/small/little-boy-using-face-mask-for-covid19-in-the-camp-free-vector.jpg"
    },
    {
      "name": "member 5",
      "imageUrl":
          "https://static.vecteezy.com/system/resources/thumbnails/001/980/744/small/little-boy-using-face-mask-for-covid19-in-the-camp-free-vector.jpg"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leadingWidth: 20.0,
        leading: IconButton(
          icon:
              new Icon(UiIcons.return_icon, color: Theme.of(context).hintColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: BaseView<GroupInfoViewModel>(
        // onModelReady: ,
        builder: (ctx, model, child) {
          return ListView(
            children: [
              Stack(
                children: [
                  Container(
                    child: groupIcon,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.35,
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.35,
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "${groupName}",
                      maxLines: 2,
                      style: Theme.of(context).textTheme.headline,
                    ),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.all(15.0),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Description",
                      style: Theme.of(context).textTheme.body2,
                    ),
                    Text(
                      "${description}",
                      style: Theme.of(context).textTheme.body1,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(15.0),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Group Members",
                            style: Theme.of(context).textTheme.body2,
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: CircleAvatar(
                                    child: Image.network(
                                        "https://www.divinesolitaires.com/upload/images/slug-master/jklmn07083png.png")),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  child: Text(
                                    "Add Participants",
                                    style: Theme.of(context).textTheme.body2,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        for (int i = 0; i < members.length; i++)
                          memberContainer(i),
                      ],
                    ),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }

  memberContainer(int i) {
    return Container(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CircleAvatar(child: Image.network(members[i]["imageUrl"])),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Text(
                members[i]["name"],
                style: Theme.of(context).textTheme.body2,
              ),
            ),
          )
        ],
      ),
    );
  }

  appBarTitle() {
    return GestureDetector(
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
                  backgroundImage: AssetImage('img/user2.jpg'),
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
                  style: Theme.of(context).textTheme.body1,
                  overflow: TextOverflow.ellipsis,
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
