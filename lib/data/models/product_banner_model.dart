import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'product_banner_model.g.dart';

@JsonSerializable()
class ProductBannerModel {
  @JsonKey(name: "data")
  final List<ProductBannerData>? data;
  @JsonKey(name: "pagination")
  final Pagination? pagination;

  ProductBannerModel({
    this.data,
    this.pagination,
  });

  factory ProductBannerModel.fromJson(Map<String, dynamic> json) =>
      _$ProductBannerModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductBannerModelToJson(this);
}

@JsonSerializable()
class ProductBannerData {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "category")
  final String? category;
  @JsonKey(name: "short_description")
  final String? shortDescription;
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "date")
  final String? date;

  ProductBannerData({
    this.id,
    this.title,
    this.category,
    this.shortDescription,
    this.image,
    this.date,
  });

  factory ProductBannerData.fromJson(Map<String, dynamic> json) =>
      _$ProductBannerDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductBannerDataToJson(this);
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
