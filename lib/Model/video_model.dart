import 'package:cloud_firestore/cloud_firestore.dart';

class VideoModel {
  String userName;
  String uid;
  String id;
  List like;
  int commentCount;
  int shareCount;
  String songName;
  String caption;
  String videoUrl;
  String thumbnail;
  String profilePhoto;

  VideoModel(
      {required this.userName,
      required this.uid,
      required this.id,
      required this.like,
      required this.commentCount,
      required this.caption,
      required this.shareCount,
      required this.songName,
      required this.profilePhoto,
      required this.thumbnail,
      required this.videoUrl});

  Map<String, dynamic> toJson() => {
        'userName': userName,
        'uid': uid,
        'id': id,
        'like': like,
        'commentCount': commentCount,
        'caption': caption,
        'shareCount': shareCount,
        'songName': songName,
        'profilePhoto': profilePhoto,
        'thumbnail': thumbnail,
        'videoUrl': videoUrl
      };

  static VideoModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return VideoModel(
        userName: snapshot['userName'],
        uid: snapshot['uid'],
        id: snapshot['id'],
        like: snapshot[' like'],
        commentCount: snapshot[' commentCount'],
        caption: snapshot[' caption'],
        shareCount: snapshot[' shareCount'],
        songName: snapshot[' songName'],
        profilePhoto: snapshot['profilePhoto'],
        thumbnail: snapshot['thumbnail'],
        videoUrl: snapshot['videoUrl']);
  }
}
