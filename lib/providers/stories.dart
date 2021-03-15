import 'package:flutter/cupertino.dart';

class Stories with ChangeNotifier {
  List<Story> stories;
}

class Story {
  final String storyId;
  final String storyBy;
  final String userImageUrl;
  final List<StoryReference> references;

  Story({this.storyId, this.storyBy, this.userImageUrl,this.references});

  Story copyWith({
    List<StoryReference> references,
  }) {
    return new Story(
      userImageUrl: userImageUrl ?? this.userImageUrl,
      references: references ?? this.references,
    );
  }
}

class StoryReference {
  String referenceId;
  String imageOrVideoUrl;
  DateTime storyExpiresOn;
  DateTime createdOn;
  List<Emoji> emoticons;
  List<FixText> fixText;

  StoryReference(this.referenceId, this.imageOrVideoUrl, this.storyExpiresOn,
      this.createdOn, {this.emoticons, this.fixText});

  StoryReference copyWith({
    String referenceId,
    String imageOrVideoUrl,
    DateTime storyExpiresOn,
    DateTime createdOn,
    List<Emoji> emoticons,
    List<FixText> fixText,
  }) {
    return new StoryReference(
      referenceId ?? this.referenceId,
      imageOrVideoUrl ?? this.imageOrVideoUrl,
      storyExpiresOn ?? this.storyExpiresOn,
      createdOn ?? this.createdOn,
      emoticons: emoticons ?? this.emoticons,
      fixText: fixText ?? this.fixText,
    );
  }
}

class Emoji{
  double x;
  double y;
  String data;

  Emoji(this.x, this.y, this.data);

  Emoji copyWith({
    double x,
    double y,
    String data,
  }) {
    return new Emoji(
      x ?? this.x,
      y ?? this.y,
      data ?? this.data,
    );
  }
}

class FixText{
  double x;
  double y;
  String text;
  bool isHyperlink;

  FixText(this.x, this.y, this.text, [this.isHyperlink= false]);
}

