import 'dart:developer';

import 'package:exam_month3_/data/models/furniture_model.dart';
import 'package:exam_month3_/data/models/product_banner_model.dart';
import 'package:exam_month3_/data/remote_sourse/furniture_repo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FurnitureProvider extends ChangeNotifier {
  List<FurnitureData> _furnitureList = [];
  List<ProductBannerData> productBannerData = [];
  bool _isLoading = false;
  bool isVisible = false;

  List<FurnitureData> get furnitureList => _furnitureList;
  bool get isLoading => _isLoading;
  void toggleVisibility() {
    isVisible = !isVisible;
    notifyListeners();
  }

  Future<void> fetchFurnitureList() async {
    _isLoading = true;
    notifyListeners();
    try {
      final furs = await FurnitureRepo.getFurnitures();
      _furnitureList = furs
          .map(
            (e) => FurnitureData.fromJson(e),
          )
          .toList();
      log("furnitures: $_furnitureList");
    } catch (e) {
      log("Error fetching furniture list: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

    Future<void> fetchBanner() async {
    _isLoading = true;
    notifyListeners();
    try {
      final furs = await FurnitureRepo.getBanner();
      productBannerData = furs
          .map(
            (e) => ProductBannerData.fromJson(e),
          )
          .toList();
      log("banners: $productBannerData");
    } catch (e) {
      log("Error fetching product banners list: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> logIn(String phoneNumber, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await FurnitureRepo.logIn(phoneNumber, password);
      log("User logged in: ${response['data']}");
      return true;
    } catch (e) {
      log("Error logging in: $e");
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }

  Future<bool> register(String phoneNumber, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await FurnitureRepo.signUp(phoneNumber, password);
      log("User registered in: ${response['data']}");
      return true;
    } catch (e) {
      log("Error registering in: $e");
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }
}
