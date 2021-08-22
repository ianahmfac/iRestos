class ApiConstant {
  static const baseUrl = 'https://restaurant-api.dicoding.dev';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'X-Auth-Token': '12345',
  };

  static const getListUrl = '$baseUrl/list';
  static String getDetailUrl(String id) => '$baseUrl/detail/$id';
  static String getSearchUrl(String query) => '$baseUrl/search?q=$query';
  static const postReviewUrl = '$baseUrl/review';

  static const baseImageUrl = '$baseUrl/images';

  static String imageSmallUrl(String pictureId) =>
      '$baseImageUrl/small/$pictureId';
  static String imageMediumUrl(String pictureId) =>
      '$baseImageUrl/medium/$pictureId';
  static String imageLargeUrl(String pictureId) =>
      '$baseImageUrl/large/$pictureId';
}
