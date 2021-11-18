import 'package:flutter/material.dart';

import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:staggered_animated_listview/data.dart';
import 'package:staggered_animated_listview/model/category.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Category> _list = FakeData().categoriesList;
    return MaterialApp(
        home: Scaffold(
          backgroundColor: Color(0xfF0F0F),
          appBar: AppBar(
            backgroundColor: Color(0xfF0F0F),
            leading:GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: new IconButton(
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                    ),
                    onPressed: () {
                    }), ),),
            title: new Padding(
              padding: const EdgeInsets.only(right: 100.0),
              child: new Text('Explore events'),
            ),
          ),

          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: AnimationLimiter(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1),
                    itemCount: _list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return AnimationConfiguration.staggeredGrid(
                          columnCount: 2,
                          position: index,
                          duration: Duration(milliseconds: 1000),
                          child: ScaleAnimation(
                              child: FadeInAnimation(
                                  delay: Duration(milliseconds: 100),
                                  child: listItem(_list[index])))
                      );
                    }),


            ),
          ),
        ));
  }

  Widget listItem(Category category) {
      return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image(
        image: NetworkImage(category.image)
              ,fit:BoxFit.fill,
            ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              category.name,
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
    );

    }

  }

