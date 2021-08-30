class RestaurantModel {
  final String title, image;
  final double rating;

  RestaurantModel({
    required this.title,
    required this.image,
    required this.rating,
  });
}

List<RestaurantModel> restaurantModels = [
  RestaurantModel(
    title: "Burger King",
    image: 'images/sample1.jpeg',
    rating: 4.5,
  ),
  RestaurantModel(
    title: "Chillox",
    image: 'images/sample2.jpeg',
    rating: 4.3,
  ),
  RestaurantModel(
    title: "Mad Chef",
    image: 'images/sample3.jpeg',
    rating: 4.5,
  ),
  RestaurantModel(
    title: "Takeout",
    image: 'images/sample4.jpeg',
    rating: 3.8,
  ),
  RestaurantModel(
    title: "American Burger",
    image: 'images/sample5.jpeg',
    rating: 4.6,
  ),
];
