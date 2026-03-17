class CreateAreasRequest {
  String name;
  int color;
  int icon;

  CreateAreasRequest({
    required this.name,
    required this.color,
    required this.icon,
  });
  Map<String, dynamic> toJson() {
    return {'name': name, 'color': color, 'icon': icon};
  }
}
