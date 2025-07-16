class Productmodel {
  final String image;
  final double price;
  final String desc;
  final String title;

  Productmodel({
    required this.image,
    required this.price,
    required this.desc,
    required this.title,
  });
}

List<Productmodel> productslist = [
  Productmodel(
    image: 'assets/products/product1.png',
    price: 250.0,
    title: 'Velvet Black Dress',
    desc: 'Elegant long sleeve black velvet dress perfect for evening wear.',
  ),
  Productmodel(
    image: 'assets/products/product2.png',
    price: 180.0,
    title: 'Combat Leather Boots',
    desc: 'Stylish black leather boots with side buckle and thick sole.',
  ),
  Productmodel(
    image: 'assets/products/product3.png',
    price: 45.0,
    title: 'Minimal Silver Studs',
    desc: 'Simple round silver stud earrings for everyday elegance.',
  ),
  Productmodel(
    image: 'assets/products/product4.png',
    price: 50.0,
    title: 'Classic Hoop Earrings',
    desc: 'Shiny silver hoops perfect for casual or formal wear.',
  ),
  Productmodel(
    image: 'assets/products/product5.png',
    price: 120.0,
    title: 'Triple Gold Ring Set',
    desc: 'Set of three gold rings with delicate embedded stones.',
  ),
  Productmodel(
    image: 'assets/products/product6.png',
    price: 95.0,
    title: 'Wave Gold Ring',
    desc: 'Elegant gold ring with unique wave design and center stone.',
  ),
];
List<Productmodel> menproductslist = [
  Productmodel(
    image: 'assets/men/men1.jpg',
    price: 250.0,
    title: 'Velvet Black Dress',
    desc: 'Elegant long sleeve black velvet dress perfect for evening wear.',
  ),
  Productmodel(
    image: 'assets/men/men2.jpg',
    price: 180.0,
    title: 'Combat Leather Boots',
    desc: 'Stylish black leather boots with side buckle and thick sole.',
  ),
  Productmodel(
    image: 'assets/men/men3.jpg',
    price: 45.0,
    title: 'Minimal Silver Studs',
    desc: 'Simple round silver stud earrings for everyday elegance.',
  ),
  Productmodel(
    image: 'assets/men/men4.jpg',
    price: 50.0,
    title: 'Classic Hoop Earrings',
    desc: 'Shiny silver hoops perfect for casual or formal wear.',
  ),
  Productmodel(
    image: 'assets/men/men5.jpg',
    price: 120.0,
    title: 'Triple Gold Ring Set',
    desc: 'Set of three gold rings with delicate embedded stones.',
  ),
];
