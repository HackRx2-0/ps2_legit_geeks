import 'package:store_app/src/models/route_argument.dart';

import '../../config/ui_icons.dart';
import '../models/groupConversation.dart' as model;
import 'package:flutter/material.dart';

class GroupMessageItemWidget extends StatefulWidget {
  GroupMessageItemWidget({Key key, this.message, this.onDismissed})
      : super(key: key);
  model.GroupConversation message;
  ValueChanged<model.GroupConversation> onDismissed;

  @override
  _GroupMessageItemWidgetState createState() => _GroupMessageItemWidgetState();
}

class _GroupMessageItemWidgetState extends State<GroupMessageItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(this.widget.message.hashCode.toString()),
      background: Container(
        color: Colors.red,
        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Icon(
              UiIcons.trash,
              color: Colors.white,
            ),
          ),
        ),
      ),
      onDismissed: (direction) {
        // Remove the item from the data source.
        setState(() {
          widget.onDismissed(widget.message);
        });

        // Then show a snackbar.
        Scaffold.of(context).showSnackBar(SnackBar(
            content:
                Text("The conversation ${widget.message.title}is dismissed")));
      },
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed('/Chat',
              arguments: RouteArgument(
                  id: widget.message.id, argumentsList: [widget.message]));
        },
        child: Container(
          color: this.widget.message.unseenMessages > 0
              ? Colors.transparent
              : Theme.of(context).focusColor.withOpacity(0.15),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(this.widget.message.image),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 15),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      this.widget.message.title,
                      overflow: TextOverflow.fade,
                      softWrap: false,
                      style: Theme.of(context).textTheme.body2,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            this.widget.message.lastMessage.text,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: Theme.of(context).textTheme.caption.merge(
                                TextStyle(
                                    fontWeight:
                                        this.widget.message.unseenMessages > 0
                                            ? FontWeight.w300
                                            : FontWeight.w600)),
                          ),
                        ),
                        Text(
                          this.widget.message.lastMessage.timestamp,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: Theme.of(context).textTheme.body1,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
