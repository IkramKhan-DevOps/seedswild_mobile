import 'dart:convert';

NotificationModel notificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str));
String notificationModelToJson(NotificationModel data) => json.encode(data.toJson());

class NotificationModel {
  int unreadCount;
  List<UnreadList> unreadList;

  NotificationModel({
    required this.unreadCount,
    required this.unreadList,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    unreadCount: json["unread_count"],
    unreadList: List<UnreadList>.from(json["unread_list"].map((x) => UnreadList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "unread_count": unreadCount,
    "unread_list": List<dynamic>.from(unreadList.map((x) => x.toJson())),
  };
}

class UnreadList {
  int id;
  String level;
  int recipient;
  bool unread;
  int actorContentType;
  String actorObjectId;
  String verb;
  String description;
  dynamic targetContentType;
  dynamic targetObjectId;
  dynamic actionObjectContentType;
  dynamic actionObjectObjectId;
  DateTime timestamp;
  bool public;
  bool deleted;
  bool emailed;
  dynamic data;
  int slug;
  String actor;

  UnreadList({
    required this.id,
    required this.level,
    required this.recipient,
    required this.unread,
    required this.actorContentType,
    required this.actorObjectId,
    required this.verb,
    required this.description,
    required this.targetContentType,
    required this.targetObjectId,
    required this.actionObjectContentType,
    required this.actionObjectObjectId,
    required this.timestamp,
    required this.public,
    required this.deleted,
    required this.emailed,
    required this.data,
    required this.slug,
    required this.actor,
  });

  factory UnreadList.fromJson(Map<String, dynamic> json) => UnreadList(
    id: json["id"],
    level: json["level"],
    recipient: json["recipient"],
    unread: json["unread"],
    actorContentType: json["actor_content_type"],
    actorObjectId: json["actor_object_id"],
    verb: json["verb"],
    description: json["description"],
    targetContentType: json["target_content_type"],
    targetObjectId: json["target_object_id"],
    actionObjectContentType: json["action_object_content_type"],
    actionObjectObjectId: json["action_object_object_id"],
    timestamp: DateTime.parse(json["timestamp"]),
    public: json["public"],
    deleted: json["deleted"],
    emailed: json["emailed"],
    data: json["data"],
    slug: json["slug"],
    actor: json["actor"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "level": level,
    "recipient": recipient,
    "unread": unread,
    "actor_content_type": actorContentType,
    "actor_object_id": actorObjectId,
    "verb": verb,
    "description": description,
    "target_content_type": targetContentType,
    "target_object_id": targetObjectId,
    "action_object_content_type": actionObjectContentType,
    "action_object_object_id": actionObjectObjectId,
    "timestamp": timestamp.toIso8601String(),
    "public": public,
    "deleted": deleted,
    "emailed": emailed,
    "data": data,
    "slug": slug,
    "actor": actor,
  };
}
