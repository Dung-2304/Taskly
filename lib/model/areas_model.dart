class AreasModel {
  String id;
  String userid;
  String name;
  String description;
  int color;
  int icon;
  final DateTime createdAt;
  final DateTime updatedAt;
  int fojderCount;
  int projectCount;
  int taskCount;
  int noteCount;

  AreasModel({
    required this.id,
    required this.userid,
    required this.name,
    required this.description,
    required this.color,
    required this.icon,
    required this.createdAt,
    required this.updatedAt,
    required this.fojderCount,
    required this.projectCount,
    required this.taskCount,
    required this.noteCount,
  });

  static AreasModel fromJson(Map<String, dynamic> json) {
    return AreasModel(
      id: json['id'] ?? '',
      userid: json['userid'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      color: int.parse((json['color'] ?? 0).toString()),
      icon:int.parse((json['icon'] ?? 0).toString()),
      createdAt: DateTime.tryParse(json['createdAt']) ?? DateTime.now(), 
      updatedAt: DateTime.parse(json['updateAt']) ?? DateTime.now(),
      fojderCount: int.parse((json['fojderCount'] ?? 0).toString()),
      projectCount: int.parse((json['projectCount'] ?? 0).toString()),
      taskCount: int.parse((json['taskCount'] ?? 0).toString()),
      noteCount: int.parse((json['noteCount'] ?? 0).toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userid': userid,
      'name': name,
      'description': description,
      'color': color,
      'icon': icon,
      'createdAt': createdAt,
      'updateAt': updatedAt,
      'foderCount': fojderCount,
      'projectCount': projectCount,
      'taskCount': taskCount,
      'noteCount': noteCount,
    };
  }
}
