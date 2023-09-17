class UserModel {
  double? dailyLimit;
  String? name;
  String? uid;

  UserModel({this.dailyLimit, this.name, this.uid});

  UserModel.fromJson(Map<String, dynamic> json) {
    dailyLimit = json['dailyLimit'];
    name = json['name'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dailyLimit'] = dailyLimit;
    data['name'] = name;
    data['uid'] = uid;
    return data;
  }
}
