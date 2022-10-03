class ChatModel {
  String? age;
  String? mobile;
  String? name;
  String? dateTime;

  ChatModel({this.age, this.mobile, this.name,this.dateTime});

  ChatModel.fromJson(Map<String, dynamic> json) {
    age = json['age'];
    mobile = json['mobile'];
    name = json['name'];
    dateTime = json['dateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age'] = this.age;
    data['mobile'] = this.mobile;
    data['name'] = this.name;
    data['dateTime']= this.dateTime;
    return data;
  }
}
