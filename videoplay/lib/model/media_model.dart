
class media_model {
  String url;
  int commentCount;
  int likeCount;
  int shareCount;
  String title;
  User user;

  media_model(
      {this.url,
        this.commentCount,
        this.likeCount,
        this.shareCount,
        this.title,
        this.user});

  media_model.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    commentCount = json['comment-count'];
    likeCount = json['like-count'];
    shareCount = json['share-count'];
    title = json['title'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['comment-count'] = this.commentCount;
    data['like-count'] = this.likeCount;
    data['share-count'] = this.shareCount;
    data['title'] = this.title;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class User {
  String name;
  String headshot;

  User({this.name, this.headshot});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    headshot = json['headshot'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['headshot'] = this.headshot;
    return data;
  }
}