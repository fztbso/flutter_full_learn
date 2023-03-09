import 'package:json_annotation/json_annotation.dart';

part 'resource_model.g.dart';

@JsonSerializable()
class ResourceModel {
  List<Data>? data;

  ResourceModel({this.data});

  factory ResourceModel.fromJson(Map<String, dynamic> json) {
    return _$ResourceModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ResourceModelToJson(this);
  }
}

@JsonSerializable(
  createToJson: false,
)
class Data {
  final int? id;
  final String? name;
  final int? year;
  final String? color;
  final String? pantoneValue;
  final int? price;

  Data({this.id, this.name, this.year, this.color, this.pantoneValue, this.price});

  factory Data.fromJson(Map<String, dynamic> json) {
   return _$DataFromJson(json);
  }

  //    createToJson: false, deyince aşağıdaki koda gerek kalmıyor.
// Map<String, dynamic> toJson() {return _$DataToJson(this);}
}
