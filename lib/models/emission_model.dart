class EmissionModel {
  double? emission;
  int? id;

  EmissionModel({this.emission, this.id});

  EmissionModel.fromJson(Map<String, dynamic> json) {
    emission = json['emission'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['emission'] = emission;
    data['id'] = id;
    return data;
  }
}
