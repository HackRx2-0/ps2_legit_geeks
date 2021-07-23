import './chat.dart';
import './user.dart';
import 'package:flutter/material.dart';

class Conversation {
  String id = UniqueKey().toString();
  List<Chat> chats;
  bool read;
  User user;

  Conversation({this.user, this.chats, this.read});
}

class ConversationsList {
  List<Conversation> _conversations;
  User _currentUser = new User.init().getCurrentUser();

  ConversationsList() {
    this._conversations = [
      new Conversation(
          user: new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/temp/group_icon.jpeg',
              userState: UserState.available),
          chats: [
            new Chat(
                text: 'Yeah that\'d be a nice idea',
                time: '63min ago',
                user: new User.basic(
                    firstName: 'Raghav',
                    lastName: 'Shukla',
                    avatar: 'img/temp/Raghav.jpeg',
                    userState: UserState.available)),
            new Chat(
                text: 'Nice, I think you should go for Redmi Note 8',
                time: '15min ago',
                user: _currentUser),
            new Chat(
                text: 'I was looking forward to buy a new phone..',
                time: '16min ago',
                user: new User.basic(
                    firstName: 'Raghav',
                    lastName: 'Shukla',
                    avatar: 'img/temp/Raghav.jpeg',
                    userState: UserState.available))
          ],
          read: false),
      new Conversation(
          user: new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
          chats: [
            new Chat(
                text: 'Here\'s what you looking for',
                time: 'Just now',
                user: new User.basic(
                    firstName: 'Looper',
                    lastName: ' ',
                    avatar: 'img/chatbot.jpg',
                    userState: UserState.available)),
            new Chat(
                text: 'Show me best rated dresses for women',
                time: 'Just now',
                user: _currentUser),
            new Chat(
                text: 'What would you like to shop today?',
                time: 'Just now',
                user: new User.basic(
                    firstName: 'Looper',
                    lastName: ' ',
                    avatar: 'img/chatbot.jpg',
                    userState: UserState.available)),
            new Chat(
                text: 'Hi! I\'m Looper. Happy to chat with you 🙂 ',
                time: '1min ago',
                user: new User.basic(
                    firstName: 'Looper',
                    lastName: ' ',
                    avatar: 'img/chatbot.jpg',
                    userState: UserState.available)),
          ],
          read: true),
      new Conversation(
          user: new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
          chats: [
            new Chat(
                text: 'Accepts one sliver as content. ',
                time: '1day ago',
                user: new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat(text: 'Yes, Ok', time: '6min ago', user: _currentUser),
            new Chat(
                text:
                    'Notifies when the header scrolls outside the viewport.  ',
                time: '33min ago',
                user: new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available))
          ],
          read: true),
      new Conversation(
          user: new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
          chats: [
            new Chat(
                text: 'Can scroll in any direction. ',
                time: '63min ago',
                user: new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat(
                text: 'Can scroll in any direction. ',
                time: '1hour ago',
                user: new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat(
                text: 'Supports overlapping (AppBars for example).',
                time: '33min ago',
                user: _currentUser)
          ],
          read: true),
      new Conversation(
          user: new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
          chats: [
            new Chat(
                text: 'For help getting started with Flutter ',
                time: '31min ago',
                user: new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat(
                text: 'Supports overlapping (AppBars for example). ',
                time: '31min ago',
                user: _currentUser),
            new Chat(
                text: 'Supports overlapping (AppBars for example). ',
                time: '31min ago',
                user: _currentUser),
            new Chat(
              text: 'Accepts one sliver as content. ',
              time: '43min ago',
              user: new User.basic(
                  firstName: 'Jordan',
                  lastName: 'P. Jeffries',
                  avatar: 'img/user1.jpg',
                  userState: UserState.available),
            )
          ],
          read: false),
      new Conversation(
          user: new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
          chats: [
            new Chat(
                text: 'Accepts one sliver as content.',
                time: '45min ago',
                user: new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat(
                text: 'Supports overlapping (AppBars for example).',
                time: '12min ago',
                user: _currentUser),
            new Chat(
                text: 'Can scroll in any direction. ',
                time: '31min ago',
                user: new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available))
          ],
          read: false),
      new Conversation(
          user: new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
          chats: [
            new Chat(
                text: 'Can scroll in any direction.  ',
                time: '33min ago',
                user: User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat(
                text: 'Supports overlapping (AppBars for example). ',
                time: '33min ago',
                user: _currentUser),
            new Chat(
                text: 'Accepts one sliver as content. ',
                time: '33min ago',
                user: new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available))
          ],
          read: true),
      new Conversation(
          user: new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
          chats: [
            new Chat(
                text: 'Supports overlapping AppBars for example. ',
                time: '33min ago',
                user: new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat(
                text: 'Can scroll in any direction.  ',
                time: '33min ago',
                user: _currentUser),
            new Chat(
                text: 'For help getting started with Flutter ',
                time: '33min ago',
                user: new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available))
          ],
          read: false),
    ];
  }

  List<Conversation> get conversations => _conversations;
}

class GroupConversationsList extends ConversationsList {
  List<Conversation> _conversations;
  User _currentUser = new User.init().getCurrentUser();

  GroupConversationsList() {
    this._conversations = [
      new Conversation(
          user: new User.basic(
              firstName: 'Delhi',
              lastName: 'Wholesalers',
              avatar: 'img/temp/group_icon.jpeg',
              userState: UserState.available),
          chats: [
            new Chat(
                text: 'Yeah that\'d be a nice idea',
                time: '63min ago',
                user: new User.basic(
                    firstName: 'Raghav',
                    lastName: 'Shukla',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat(
                text: 'Nice, I think you should go for Redmi Note 8',
                time: '15min ago',
                user: _currentUser),
            new Chat(
                text: 'I was looking forward to buy a new phone..',
                time: '16min ago',
                user: new User.basic(
                    firstName: 'Raghav',
                    lastName: 'Shukla',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available))
          ],
          read: false),
      new Conversation(
          user: new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
          chats: [
            new Chat(
                text: 'Flutter project, add the following dependency ',
                time: '32min ago',
                user: new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat(
                text: 'Can scroll in any direction. ',
                time: '42min ago',
                user: _currentUser),
            new Chat(
                text: 'Notifies when the header scrolls outside the viewport. ',
                time: '12min ago',
                user: new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available))
          ],
          read: true),
      new Conversation(
          user: new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
          chats: [
            new Chat(
                text: 'Accepts one sliver as content. ',
                time: '1day ago',
                user: new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat(text: 'Yes, Ok', time: '6min ago', user: _currentUser),
            new Chat(
                text:
                    'Notifies when the header scrolls outside the viewport.  ',
                time: '33min ago',
                user: new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available))
          ],
          read: true),
      new Conversation(
          user: new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
          chats: [
            new Chat(
                text: 'For help getting started with Flutter ',
                time: '31min ago',
                user: new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat(
                text: 'Supports overlapping (AppBars for example). ',
                time: '31min ago',
                user: _currentUser),
            new Chat(
                text: 'Accepts one sliver as content. ',
                time: '43min ago',
                user: new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available))
          ],
          read: false),
    ];
  }

  List<Conversation> get conversations => _conversations;
}

class PeopleNearbyConversationsList extends ConversationsList {
  List<Conversation> _conversations;
  User _currentUser = new User.init().getCurrentUser();

  PeopleNearbyConversationsList() {
    this._conversations = [
      new Conversation(
          user: new User.basic(
              firstName: 'Vinay',
              lastName: 'Sharma',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
          chats: [
            new Chat(
                text: 'Yeah that\'d be a nice idea',
                time: '63min ago',
                user: new User.basic(
                    firstName: 'Raghav',
                    lastName: 'Shukla',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat(
                text: 'Nice, I think you should go for Redmi Note 8',
                time: '15min ago',
                user: _currentUser),
            new Chat(
                text: 'I was looking forward to buy a new phone..',
                time: '16min ago',
                user: new User.basic(
                    firstName: 'Raghav',
                    lastName: 'Shukla',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available))
          ],
          read: false),
      new Conversation(
          user: new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
          chats: [
            new Chat(
                text: 'Flutter project, add the following dependency ',
                time: '32min ago',
                user: new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat(
                text: 'Can scroll in any direction. ',
                time: '42min ago',
                user: _currentUser),
            new Chat(
                text: 'Notifies when the header scrolls outside the viewport. ',
                time: '12min ago',
                user: new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available))
          ],
          read: true),
      new Conversation(
          user: new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
          chats: [
            new Chat(
                text: 'Accepts one sliver as content. ',
                time: '1day ago',
                user: new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat(text: 'Yes, Ok', time: '6min ago', user: _currentUser),
            new Chat(
                text:
                    'Notifies when the header scrolls outside the viewport.  ',
                time: '33min ago',
                user: new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available))
          ],
          read: true),
      new Conversation(
          user: new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
          chats: [
            new Chat(
                text: 'Can scroll in any direction. ',
                time: '63min ago',
                user: new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat(
                text: 'Can scroll in any direction. ',
                time: '1hour ago',
                user: new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat(
                text: 'Supports overlapping (AppBars for example).',
                time: '33min ago',
                user: _currentUser)
          ],
          read: true),
      new Conversation(
          user: new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
          chats: [
            new Chat(
                text: 'For help getting started with Flutter ',
                time: '31min ago',
                user: new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat(
                text: 'Supports overlapping (AppBars for example). ',
                time: '31min ago',
                user: _currentUser),
            new Chat(
                text: 'Accepts one sliver as content. ',
                time: '43min ago',
                user: new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available))
          ],
          read: false),
      new Conversation(
          user: new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
          chats: [
            new Chat(
                text: 'Accepts one sliver as content.',
                time: '45min ago',
                user: new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat(
                text: 'Supports overlapping (AppBars for example).',
                time: '12min ago',
                user: _currentUser),
            new Chat(
                text: 'Can scroll in any direction. ',
                time: '31min ago',
                user: new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat(
                text: 'Supports overlapping (AppBars for example).',
                time: '12min ago',
                user: _currentUser),
            new Chat(
                text: 'Can scroll in any direction. ',
                time: '31min ago',
                user: new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available))
          ],
          read: false),
      new Conversation(
          user: new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
          chats: [
            new Chat(
                text: 'Can scroll in any direction.  ',
                time: '33min ago',
                user: new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat(
                text: 'Supports overlapping (AppBars for example). ',
                time: '33min ago',
                user: _currentUser),
            new Chat(
                text: 'Accepts one sliver as content. ',
                time: '33min ago',
                user: new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available))
          ],
          read: true),
      new Conversation(
          user: new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
          chats: [
            new Chat(
                text: 'Supports overlapping AppBars for example. ',
                time: '33min ago',
                user: new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat(
                text: 'Can scroll in any direction.  ',
                time: '33min ago',
                user: _currentUser),
            new Chat(
                text: 'For help getting started with Flutter ',
                time: '33min ago',
                user: new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available))
          ],
          read: false),
    ];
  }

  List<Conversation> get conversations => _conversations;
}
