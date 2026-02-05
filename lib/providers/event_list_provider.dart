import 'package:easy_localization/easy_localization.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/toast_utils.dart';
import 'package:flutter/material.dart';

import '../model/event.dart';
import '../utils/firebase_utils.dart';

class EventListProvider extends ChangeNotifier {
  /// data
  List<Event> favoriteEvent = [];
  List<Event> eventsList = [];
  List<Event> filterList =
      []; //هنرسم الشاشة بناءا عليها ولها ثلاث اشكال اولا اول ما افتح التطبيق ما بكون في ليست 2)احط فيها كل ال events الموجودة عندي   3)احط فيها المتفلتر وخلص
  int selectedIndex = 0;
  List<String> eventsNameList = [];

  List<String> getEventsNameList() {
    return eventsNameList = [
      'all'.tr(),
      'sport'.tr(),
      'birthday'.tr(),
      'meeting'.tr(),
      'gaming'.tr(),
      'work_shop'.tr(),
      'book_club'.tr(),
      'exhibition'.tr(),
      'holiday'.tr(),
      'eating'.tr(),
    ];
  }

  void getAllEventsFromFireStore() async {
    //todo: 1- get all events
    var querySnapshot = await FirebaseUtils.getEventsCollection().get();

    ///List<Event>   =>   List<QueryDocumentSnapshot<Event>>
    eventsList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    //todo: sorting events
    filterList = eventsList;
    filterList.sort((event1, event2) {
      return event1.eventDate.compareTo(event2.eventDate);
    });
    notifyListeners();
  }

  void getFilterEventsFromFireStore() async {
    //todo: 1- get all events
    var querySnapshot = await FirebaseUtils.getEventsCollection().get();

    ///List<Event>   =>   List<QueryDocumentSnapshot<Event>>
    eventsList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    //todo: 2- filter => eventName
    filterList = eventsList.where((event) {
      return event.eventName == eventsNameList[selectedIndex];
    }).toList();
    //todo: sorting events
    filterList = eventsList;
    filterList.sort((event1, event2) {
      return event1.eventDate.compareTo(event2.eventDate);
    });
    notifyListeners();
  }

  void getFilterEventsFromFireStore1() async {
    //todo: 1- get all events
    var querySnapshot = await FirebaseUtils.getEventsCollection()
        .orderBy('event_date')
        .where('event_name', isEqualTo: eventsNameList[selectedIndex])
        .get();

    ///List<Event>   =>   List<QueryDocumentSnapshot<Event>>
    filterList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();

    notifyListeners();
  }

  void getFavoriteEvents() async {
    //todo: 1- get all events
    var querySnapshot = await FirebaseUtils.getEventsCollection()
        .orderBy('event_date')
        .where('is_favourite', isEqualTo: true)
        .get();

    ///List<Event>   =>   List<QueryDocumentSnapshot<Event>>
    favoriteEvent = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();

    notifyListeners();
  }

  void updateIsFavorite(Event event) {
    FirebaseUtils.getEventsCollection()
        .doc(event.id)
        .update({'is_favourite': !event.isFavourite})
        .timeout(
          (Duration(microseconds: 500)),
          onTimeout: () {
            ToastUtils.toastMessage(
              message: 'event updated successfully',
              backGroundColor: AppColors.mainColor,
              textColor: AppColors.white,
            );
            print('event updated successfully');
            selectedIndex == 0
                ? getAllEventsFromFireStore()
                : getFilterEventsFromFireStore1();
            getFavoriteEvents();
          },
        );
  }

  void changeSelectedIndex(int newSelectedIndex) {
    selectedIndex = newSelectedIndex;
    selectedIndex == 0
        ? getAllEventsFromFireStore()
        : getFilterEventsFromFireStore1();
  }
}
