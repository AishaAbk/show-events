import 'package:staggered_animated_listview/model/category.dart';

class FakeData {
  List<Category> _categoriesList = <Category>[
    Category(name: 'SOUNDSTORM', image: 'https://f5x5u7v6.stackpathcdn.com/wp-content/uploads/2020/05/191219-171443-MDLBEAST-MNOPHOTO-0030-04865.jpg'),
  Category(name: 'MDLBEAST XP', image:'https://www.arabnews.com/sites/default/files/main-image/2021/10/08/2849781-136034641.jpeg'),
  ];
  List<Category> get categoriesList => _categoriesList;
}
