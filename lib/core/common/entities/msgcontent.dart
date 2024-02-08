import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tdd_clean/core/utils/typedefs.dart';

class Msgcontent {
  final String? token;
  final String? content;
  final String? type;
  final Timestamp? addtime;

  Msgcontent({
    this.token,
    this.content,
    this.type,
    this.addtime,
  });

  factory Msgcontent.fromFirestore(
      DocumentSnapshot<DataMap> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Msgcontent(
      token: data?['token'],
      content: data?['content'],
      type: data?['type'],
      addtime: data?['addtime'],
    );
  }

  DataMap toFirestore() {
    return {
      if (token != null) "token": token,
      if (content != null) "content": content,
      if (type != null) "type": type,
      if (addtime != null) "addtime": addtime,
    };
  }
}