class CoffeeListModel {
  String? title;
  String? description;
  List<String>? ingredients;
  String? image;
  String? id;

  CoffeeListModel(
      {this.title, this.description, this.ingredients, this.image, this.id});

  CoffeeListModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    ingredients = json['ingredients'].cast<String>();
    image = json['image'];
    id = json['id'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['ingredients'] = this.ingredients;
    data['image'] = this.image;
    data['id'] = this.id;
    return data;
  }
}
