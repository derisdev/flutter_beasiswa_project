class BeasiswaModel {
  int id;
  String title;
  String description;
  String time;

  BeasiswaModel({this.id, this.title, this.description, this.time});


  factory BeasiswaModel.fromJson(Map<String, dynamic> json) {
    return BeasiswaModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      time: json['time'],
    );
  }

  @override
  String toString() {
    return 'BeasiswaModel{id: $id, title: $title, description: $description, time: $time}';
  }


  
}