// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_banner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductBannerModel _$ProductBannerModelFromJson(Map<String, dynamic> json) =>
    ProductBannerModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ProductBannerData.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductBannerModelToJson(ProductBannerModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'pagination': instance.pagination,
    };

ProductBannerData _$ProductBannerDataFromJson(Map<String, dynamic> json) =>
    ProductBannerData(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      category: json['category'] as String?,
      shortDescription: json['short_description'] as String?,
      image: json['image'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$ProductBannerDataToJson(ProductBannerData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'category': instance.category,
      'short_description': instance.shortDescription,
      'image': instance.image,
      'date': instance.date,
    };

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
      totalRecords: (json['total_records'] as num?)?.toInt(),
      currentPage: (json['current_page'] as num?)?.toInt(),
      totalPages: (json['total_pages'] as num?)?.toInt(),
      nextPage: json['next_page'],
      prevPage: json['prev_page'],
    );

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'total_records': instance.totalRecords,
      'current_page': instance.currentPage,
      'total_pages': instance.totalPages,
      'next_page': instance.nextPage,
      'prev_page': instance.prevPage,
    };
