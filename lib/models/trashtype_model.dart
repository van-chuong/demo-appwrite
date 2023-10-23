class TrashType {
  late String name;
  late String createdAt;
  late String updatedAt;

  TrashType({
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  // Convert a map to TrashType
  TrashType.fromMap(Map<String, dynamic> map) {
    name = map['Name'];
    createdAt = map['created_at'];
    updatedAt = map['updated_at'];
  }

  // Convert TrashType to a map
  Map<String, dynamic> toMap() {
    return {
      'Name': name,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
