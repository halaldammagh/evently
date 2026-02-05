import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/model/event.dart';
/*class FirebaseUtils {
  static void addEventToFireStore() {
    FirebaseFirestore.instance
        .collection(Event.collectionName)
        .withConverter<Event>(///  لو انت عايز تعرف الفاير بيز نوع الحاجة الي انت مخزنها بنستخدم هي ..... ومش دايما بنستخدمها ... بنستخدمها لو انت عاوز تتعامل بالاوبجيكتر بتاخد منكط نوع الداتا الي عاوز تخزنا ك تيمبليمنت <>
          fromFirestore: (snapshot, _) => Event.fromFireStore(snapshot.data()!),
          toFirestore: (event, options) => event.toFireStore(),
        ); //هتروح اول تدور اذا عندها كولكشن اسمو events ولا لا واذا معندهاش هتروح تعمل واحد بال الاسم الي انت بعتو
  }
}*/

class FirebaseUtils {
  static CollectionReference<Event> getEventsCollection() {
    return FirebaseFirestore.instance
        .collection(Event.collectionName)
        .withConverter<Event>(
          ///  لو انت عايز تعرف الفاير بيز نوع الحاجة الي انت مخزنها بنستخدم هي ..... ومش دايما بنستخدمها ... بنستخدمها لو انت عاوز تتعامل بالاوبجيكتر بتاخد منكط نوع الداتا الي عاوز تخزنا ك تيمبليمنت <>
          fromFirestore: (snapshot, _) => Event.fromFireStore(snapshot.data()!),
          toFirestore: (event, options) => event.toFireStore(),
        ); //هتروح اول تدور اذا عندها كولكشن اسمو events ولا لا واذا معندهاش هتروح تعمل واحد بال الاسم الي انت بعتو
  }

  static Future<void> addEventToFireStore(Event event) {
    CollectionReference<Event> collectionRef = getEventsCollection();
    DocumentReference<Event> docRef = collectionRef.doc();

    ///document
    event.id = docRef.id;

    /// auto Id
    return docRef.set(event);
  }

  /// firebase => json  => map   API الفايربيز بتفهم حاجة اسمها جايسون خلينا حاليا نعتربها بالدارت ماب هنعرفها بالتفصيل الممل بال
  /// java script object notation  طريقة معينة لفورمات الداتا بيها بنعملها جايسون عندو نوعين وهما  هيهم  بالسطر التالي
  /// [] json array , {} json object
  /// ------------------------------------------
  /// firebase   =>  json
  /// developers =>  object
  /// object => json    => firebase
  /// json => object    => developers
}
