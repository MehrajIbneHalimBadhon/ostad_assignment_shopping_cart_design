class ShoppingCartItem {
  final String title;
  final double price;
  final String color;
  final String size;
  final String image;
  int quantity;

  ShoppingCartItem(
      {required this.title,
      required this.color,
      required this.size,
      required this.price,
        required this.image,
      this.quantity = 1});
}

List<ShoppingCartItem> item = [
  ShoppingCartItem(title: 'PullOver', price: 51, color: 'Black', size: 'L', image: 'assets/images/pullover.jpeg'),
  ShoppingCartItem(title: 'T-Shirt', price: 30, color: 'Gray', size: 'L', image: 'assets/images/tshirt.jpeg'),
  ShoppingCartItem(title: 'Sport Dress', price: 43, color: 'Black', size: 'M', image: 'assets/images/sport.jpeg'),

];
