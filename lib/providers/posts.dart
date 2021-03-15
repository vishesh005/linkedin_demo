import 'package:flutter/foundation.dart';

class Post {

  String postBy;
  String postByImageUrl;
  String postByTitle;
  bool isPostEdited;
  DateTime postedOn;
  DateTime editedOn;
  String postMessage;
  String attachmentUrl;
  bool isAttachmentImage;
  bool isAttachmentVideo;
  bool isAttachmentDocument;
  List<Like> likes;
  List <Comment> comments;

}

class Like{
  String likeBy;
  LikeType likeType;

  Like({
    @required this.likeBy,
    @required this.likeType,
  });

  Like copyWith({
    String likeBy,
    LikeType likeType,
  }) {
    return new Like(
      likeBy: likeBy ?? this.likeBy,
      likeType: likeType ?? this.likeType,
    );
  }
}

class Comment{
 final String commentBy;
 final String commentId;
 final List<Comment> subComment;
 final List<Like> subLikes;
 final DateTime updatedOn;
 final DateTime createdOn;

 const Comment({
    @required this.commentBy,
    @required this.commentId,
    @required this.subComment,
    @required this.subLikes,
    @required this.updatedOn,
    @required this.createdOn,
  });

 Comment copyWith({
    List<Comment> subComment,
    List<Like> subLikes,
    DateTime updatedOn,
  }) {
    if ((subComment == null || identical(subComment, this.subComment)) &&
        (subLikes == null || identical(subLikes, this.subLikes)) &&
        (updatedOn == null || identical(updatedOn, this.updatedOn))) {
      return this;
    }

    return new Comment(
      commentBy: commentBy ?? this.commentBy,
      subComment: subComment ?? this.subComment,
      subLikes: subLikes ?? this.subLikes,
      updatedOn: updatedOn ?? this.updatedOn,
      createdOn: createdOn ?? this.createdOn,
    );
  }
}



enum LikeType{
  LIKE,CELEBRATE,LOVE,SUPPORT,INSIGHTFUL,CURIOUS
}