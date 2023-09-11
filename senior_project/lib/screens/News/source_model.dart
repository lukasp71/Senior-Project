// The implementation of this section is based on a Flutter Tutorial from medium.com
// Base code for implementation comes from https://nabendu82.medium.com/flutter-news-app-using-newsapi-2294c2dcf673.

class Source {
  String id;
  String name;

  Source({required this.id, required this.name});



  factory Source.fromJson(Map<String, dynamic> json){
    return Source(id: json['id'], name: json['name']);
  }
  
}