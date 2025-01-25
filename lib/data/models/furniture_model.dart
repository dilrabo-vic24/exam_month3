import 'package:json_annotation/json_annotation.dart';

part 'furniture_model.g.dart';

@JsonSerializable()
class FurnitureModel {
  @JsonKey(name: "data")
  final List<FurnitureData>? data;
  @JsonKey(name: "pagination")
  final Pagination? pagination;

  FurnitureModel({
    this.data,
    this.pagination,
  });

  factory FurnitureModel.fromJson(Map<String, dynamic> json) =>
      _$FurnitureModelFromJson(json);

  Map<String, dynamic> toJson() => _$FurnitureModelToJson(this);
}

@JsonSerializable()
class FurnitureData {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "short_description")
  final String? shortDescription;
  @JsonKey(name: "icon")
  final String? icon;
  @JsonKey(name: "image")
  final List<String>? image;
  @JsonKey(name: "quintity")
  final int? quintity;
  @JsonKey(name: "price")
  final double? price;
  @JsonKey(name: "discount")
  final int? discount;
  @JsonKey(name: "rating")
  final double? rating;
  @JsonKey(name: "rating_count")
  final int? ratingCount;
  @JsonKey(name: "colors")
  final Colors? colors;
  @JsonKey(name: "size")
  final Size? size;
  @JsonKey(name: "category")
  final String? category;

  FurnitureData({
    this.id,
    this.name,
    this.description,
    this.shortDescription,
    this.icon,
    this.image,
    this.quintity,
    this.price,
    this.discount,
    this.rating,
    this.ratingCount,
    this.colors,
    this.size,
    this.category,
  });

  factory FurnitureData.fromJson(Map<String, dynamic> json) =>
      _$FurnitureDataFromJson(json);

  Map<String, dynamic> toJson() => _$FurnitureDataToJson(this);
}

@JsonSerializable()
class Colors {
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "color_hex_flutter")
  final String? colorHexFlutter;

  Colors({
    this.name,
    this.colorHexFlutter,
  });

  factory Colors.fromJson(Map<String, dynamic> json) => _$ColorsFromJson(json);

  Map<String, dynamic> toJson() => _$ColorsToJson(this);
}

@JsonSerializable()
class Size {
  @JsonKey(name: "width")
  final int? width;
  @JsonKey(name: "depth")
  final int? depth;
  @JsonKey(name: "heigth")
  final int? heigth;
  @JsonKey(name: "seat_width")
  final int? seatWidth;
  @JsonKey(name: "seat_depth")
  final int? seatDepth;
  @JsonKey(name: "seat_heigth")
  final int? seatHeigth;

  Size({
    this.width,
    this.depth,
    this.heigth,
    this.seatWidth,
    this.seatDepth,
    this.seatHeigth,
  });

  factory Size.fromJson(Map<String, dynamic> json) => _$SizeFromJson(json);

  Map<String, dynamic> toJson() => _$SizeToJson(this);
}

@JsonSerializable()
class Pagination {
  @JsonKey(name: "total_records")
  final int? totalRecords;
  @JsonKey(name: "current_page")
  final int? currentPage;
  @JsonKey(name: "total_pages")
  final int? totalPages;
  @JsonKey(name: "next_page")
  final dynamic nextPage;
  @JsonKey(name: "prev_page")
  final dynamic prevPage;

  Pagination({
    this.totalRecords,
    this.currentPage,
    this.totalPages,
    this.nextPage,
    this.prevPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}
