class ToDoEntity {
  final String uid;
  final String title;
  final String? description;
  final bool isFavorite;
  final bool isDone;

  ToDoEntity({
    required this.uid,
    required this.title,
    this.description,
    required this.isFavorite,
    required this.isDone,
  });

  factory ToDoEntity.init() {
    return ToDoEntity(
      uid: '',
      title: '',
      isFavorite: true,
      isDone: true,
      description: '',
    );
  }

  ToDoEntity copyWith({
    String? uid,
    String? title,
    String? description,
    bool? isFavorite,
    bool? isDone,
  }) {
    return ToDoEntity(
      uid: uid ?? this.uid,
      title: title ?? this.title,
      description: description ?? this.description,
      isFavorite: isFavorite ?? this.isFavorite,
      isDone: isDone ?? this.isDone,
    );
  }

  @override
  String toString() {
    return "title : ${title}, description : ${description}, isFavorite : ${isFavorite}, isDone : ${isDone}";
  }
}
