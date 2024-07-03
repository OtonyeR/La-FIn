class Category {
  final String name;
  final String iconUrl;
  final bool isSelected = false;

  Category({required this.name, required this.iconUrl});

  Map<String, dynamic> toMap() {
    return {'name': name, 'iconUrl': iconUrl, 'isSelected': isSelected};
  }
}

List<Category> categoryList = [
  Category(name: 'Popular', iconUrl: 'assets/Vector.png'),
  Category(
    iconUrl: 'assets/chair.png',
    name: 'Chair',
  ),
  Category(
    iconUrl: 'assets/sofa 1.png',
    name: 'Sofa',
  ),
  Category(
    iconUrl: 'assets/table 1 1.png',
    name: 'Table',
  ),
  Category(
    iconUrl: 'assets/bed 1.png',
    name: 'Bed',
  )
];
