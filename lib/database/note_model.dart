const String tableNotes = 'notes';

class Note {
  int? id;
  String? title;
  String? description;
  DateTime? dateTime;

  Note({this.id, this.title, this.description, this.dateTime});

  Note copyWith({
    int? id,
    String? title,
    String? description,
    DateTime? createdTime,
  }) =>
      Note(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        dateTime: dateTime ?? this.dateTime,
      );

  Note.fromJson(Map<String, Object?> json) {
    id = json[FieldsConst.id] as int;
    title = json[FieldsConst.title] as String;
    description = json[FieldsConst.description] as String;
    dateTime = DateTime.parse(json[FieldsConst.time] as String);
  }

  Map<String, Object?> toJson() => {
        FieldsConst.id: id,
        FieldsConst.title: title,
        FieldsConst.description: description,
        FieldsConst.time: dateTime!.toIso8601String(),
      };
}

class FieldsConst {
  static String id = '_id';
  static String title = 'title';
  static String description = 'description';
  static String time = 'time';

  static List<String> colField = [id, title, description, time];
}
