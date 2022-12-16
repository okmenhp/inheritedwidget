class Item {
  late int id;
  late String item;
  late bool check;
  Item({required this.id, required this.item, required this.check});
  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    item = json['item'];
    check = json['check'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['item'] = item;
    data['check'] = check;
    return data;
  }
}
