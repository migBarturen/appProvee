import 'dart:convert';

SliderModel sliderModelFromJson(String str) => SliderModel.fromJson(json.decode(str));

String sliderModelToJson(SliderModel data) => json.encode(data.toJson());

class SliderModel {
    SliderModel({
        this.estado,
        this.id,
        this.imgSlider,
    });

    bool? estado;
    String? id;
    String? imgSlider;

    factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
        estado: json["estado"],
        id: json["_id"],
        imgSlider: json["imgSlider"],
    );

    Map<String, dynamic> toJson() => {
        "estado": estado,
        "_id": id,
        "imgSlider": imgSlider,
    };
}