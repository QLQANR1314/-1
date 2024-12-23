class HomeTweetsModel {
  int? code;
  String? msg;
  listModel? data;

  HomeTweetsModel({this.code, this.msg, this.data});

  factory HomeTweetsModel.fromJson(Map<String, dynamic> json) =>
      HomeTweetsModel(
        code: json['code'] as int?,
        msg: json['message'] as String?,
        data: json['data'] != null ? listModel.fromJson(json['data']) : null,
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'msg': msg,
        'data': data,
      };
}

class listModel {
  List<tweetsDataModel>? list;
  int? page_count;
  int? total;

  listModel({this.page_count, this.total, this.list});

  factory listModel.fromJson(Map<String, dynamic> json) => listModel(
        page_count: json['page_count'] as int?,
        total: json['total'] as int?,
        list: (json['list'] as List<dynamic>?)
            ?.map((e) => tweetsDataModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'list': list,
        'total': total,
        'page_count': page_count,
      };
}

class tweetsDataModel {
  String? recordId;
  String? insertTime;
  String? updateTime;
  String? uploadFlag;
  String? user_id;
  String? user_name;
  String? avatar_path;
  String? tweet_time;
  String? tweet_text;
  int? replies_num;
  int? reposts_num;
  int? likes_num;
  int? views_num;
  int? bookmarks_num;
  String? repost_tweet_record_id;
  HomeuserModel? user;
  List<ImageModel>? images;

  tweetsDataModel({
    this.recordId,
    this.insertTime,
    this.updateTime,
    this.uploadFlag,
    this.user_id,
    this.user_name,
    this.avatar_path,
    this.tweet_time,
    this.tweet_text,
    this.replies_num,
    this.reposts_num,
    this.likes_num,
    this.views_num,
    this.bookmarks_num,
    this.repost_tweet_record_id,
    this.user,
    this.images,
  });

  factory tweetsDataModel.fromJson(Map<String, dynamic> json) =>
      tweetsDataModel(
        recordId: json['recordId'] as String?,
        insertTime: json['insertTime'] as String?,
        updateTime: json['updateTime'] as String?,
        uploadFlag: json['uploadFlag'] as String?,
        user_id: json['user_id'] as String?,
        user_name: json['user_name'] as String?,
        avatar_path: json['avatar_path'] as String?,
        tweet_time: json['tweet_time'] as String?,
        tweet_text: json['tweet_text'] as String?,
        replies_num: json['replies_num'] as int?,
        reposts_num: json['reposts_num'] as int?,
        likes_num: json['likes_num'] as int?,
        views_num: json['views_num'] as int?,
        bookmarks_num: json['bookmarks_num'] as int?,
        repost_tweet_record_id: json['repost_tweet_record_id'] as String?,
        user:json['user'] != null ? HomeuserModel.fromJson(json['user']) : null,
        images: (json['images'] as List<dynamic>?)
            ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'recordId': recordId,
        'insertTime': insertTime,
        'updateTime': updateTime,
        'uploadFlag': uploadFlag,
        'user_id': user_id,
        'user_name': user_name,
        'avatar_path': avatar_path,
        'tweet_time': tweet_time,
        'tweet_text': tweet_text,
        'replies_num': replies_num,
        'reposts_num': reposts_num,
        'bookmarks_num': bookmarks_num,
        'repost_tweet_record_id': repost_tweet_record_id,
        'user': user,
        'images': images,
      };
}

class HomeuserModel {
  String? recordId;
  String? insertTime;
  String? updateTime;
  String? uploadFlag;
  String? user_id;
  String? user_name;
  String? avatar_path;

  HomeuserModel({
    this.recordId,
    this.insertTime,
    this.updateTime,
    this.uploadFlag,
    this.user_id,
    this.user_name,
    this.avatar_path,
  });

  factory HomeuserModel.fromJson(Map<String, dynamic> json) => HomeuserModel(
        recordId: json['recordId'] as String?,
        insertTime: json['insertTime'] as String?,
        updateTime: json['updateTime'] as String?,
        uploadFlag: json['uploadFlag'] as String?,
        user_id: json['user_id'] as String?,
        user_name: json['user_name'] as String?,
        avatar_path: json['avatar_path'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'recordId': recordId,
        'insertTime': insertTime,
        'updateTime': updateTime,
        'uploadFlag': uploadFlag,
        'user_id': user_id,
        'user_name': user_name,
        'avatar_path': avatar_path,
      };
}

class ImageModel {
  String? recordId;
  String? insertTime;
  String? updateTime;
  String? tweet_record_id;
  int? file_type;
  String? file_path;
  String? url;

  ImageModel({
    this.recordId,
    this.insertTime,
    this.updateTime,
    this.tweet_record_id,
    this.file_type,
    this.file_path,
    this.url,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        recordId: json['recordId'] as String?,
        insertTime: json['insertTime'] as String?,
        updateTime: json['updateTime'] as String?,
        tweet_record_id: json['tweet_record_id'] as String?,
        file_type: json['file_type'] as int?,
        file_path: json['file_path'] as String?,
        url: json['url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'recordId': recordId,
        'insertTime': insertTime,
        'updateTime': updateTime,
        'tweet_record_id': tweet_record_id,
        'file_type': file_type,
        'file_path': file_path,
        'url': url,
      };
}
