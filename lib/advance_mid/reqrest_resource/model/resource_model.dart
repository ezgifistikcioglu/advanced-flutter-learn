import 'package:json_annotation/json_annotation.dart';

part 'resource_model.g.dart';

@JsonSerializable()
class ResourceModel {
  List<Data>? data;

  ResourceModel({this.data});

  factory ResourceModel.fromJson(Map<String, dynamic> json) {
    //if (json['data'] != null) {
    //  data = <Data>[];
    //  json['data'].forEach((v) {
    //    data!.add(Data.fromJson(v));
    //  });
    //}
    return _$ResourceModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    // final Map<String, dynamic> data = <String, dynamic>{};
    // if (this.data != null) {
    //   data['data'] = this.data!.map((v) => v.toJson()).toList();
    // }
    // return data;
    return _$ResourceModelToJson(this);
  }
}

// Eğer bu classdan bir servise istek atmayacaksak createToJson'ı false yapalım yer kaplamasın createToJson: false
@JsonSerializable()
class Data {
  final int? id;
  final String? name;
  final int? year;
  final String? color;
  final String? pantoneValue;
  final String? price;

  Data(
      {this.id,
      this.name,
      this.year,
      this.color,
      this.pantoneValue,
      this.price});

  factory Data.fromJson(Map<String, dynamic> json) {
    //id = json['id'];
    //name = json['name'];
    //year = json['year'];
    //color = json['color'];
    //pantoneValue = json['pantone_value'];
    return _$DataFromJson(json);
  }
}
