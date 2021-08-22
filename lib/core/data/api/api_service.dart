import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../constants/api_constant.dart';
import '../models/restaurant.dart';
import '../models/restaurant_detail.dart';

class ApiService {
  ApiService._();
  static final instance = ApiService._();

  Future<List<Restaurant>> getListRestaurant({String? query}) async {
    try {
      final List<Restaurant> restaurants = [];
      final url = query == null
          ? ApiConstant.getListUrl
          : ApiConstant.getSearchUrl(query);
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final List listData = data['restaurants'];
        if (listData.isEmpty) return restaurants;
        listData.forEach((restaurant) {
          restaurants.add(Restaurant.fromMap(restaurant));
        });
        return restaurants..sort((a, b) => b.rating.compareTo(a.rating));
      }
      throw Exception('Failed to Load Data');
    } on SocketException catch (_) {
      throw 'Please Check Your Internet Connection';
    } catch (e) {
      if (e.toString() == 'Connection closed before full header was received')
        throw 'Your connection may not be stable';
      throw e;
    }
  }

  Future<RestaurantDetail> getRestaurantDetail(String id) async {
    try {
      final url = ApiConstant.getDetailUrl(id);
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return RestaurantDetail.fromMap(data['restaurant']);
      }
      throw Exception('Failed to Load Data');
    } on SocketException catch (_) {
      throw 'Please Check Your Internet Connection';
    } catch (e) {
      if (e.toString() == 'Connection closed before full header was received')
        throw 'Your connection may not be stable';
      throw e;
    }
  }

  Future<bool> postReview(String id, String name, String review) async {
    try {
      final url = ApiConstant.postReviewUrl;
      final response = await http.post(
        Uri.parse(url),
        headers: ApiConstant.headers,
        body: jsonEncode({
          'id': id,
          'name': name,
          'review': review,
        }),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['message'] == 'success') return true;
        return false;
      }
      throw Exception('Something went wrong');
    } on SocketException catch (_) {
      throw 'Please Check Your Internet Connection';
    } catch (e) {
      if (e.toString() == 'Connection closed before full header was received')
        throw 'Your connection may not be stable';
      throw e;
    }
  }
}
