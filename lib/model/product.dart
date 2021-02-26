class Product {
  String name;
  String image;

  Product(_name,_image){
    name = _name;
    image = _image;
  }
}

Product p1 = new Product("Screen", "assets/images/screen.png");
Product p2 = new Product("Iphone", "assets/images/iphone.png");
Product p3 = new Product("Tablet", "assets/images/tablet.png");

List<Product> productsList = new List<Product>();
