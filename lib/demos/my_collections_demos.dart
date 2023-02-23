import 'package:flutter/material.dart';

class MyCollectionsDemos extends StatefulWidget {
  const MyCollectionsDemos({Key? key}) : super(key: key);

  @override
  State<MyCollectionsDemos> createState() => _MyCollectionsDemosState();
}

class _MyCollectionsDemosState extends State<MyCollectionsDemos> {
  late final List<CollectionModel> _items;

  @override
  void initState() {
    super.initState();
    _items = CollectionItems().items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: PaddingUtility().paddingHorizontal,
        itemCount: _items.length,
        itemBuilder: (context, index){
          return CategoryCard(model: _items[index]);
        },
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required CollectionModel model,
  }) : _model = model, super(key: key);

  final CollectionModel _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: PaddingUtility().paddingBottom,
      child: SizedBox(
        height: 300,
        child: Padding(
          padding: PaddingUtility().paddingGeneral,
          child: Column(
            children: [
              Image.asset(
                _model.imagePath,
                fit: BoxFit.cover,
                height: 200,
              ),
              Spacer(),
              Padding(
                padding: PaddingUtility().paddingTop,
                child: Row(
                  children: [
                    Text(_model.title),
                    Spacer(),
                    Text("${_model.price} eth"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class CollectionModel {
  final String imagePath;
  final String title;
  final double price;

  CollectionModel({required this.imagePath, required this.title, required this.price});
}

class CollectionItems{
  late final List<CollectionModel> items;

  CollectionItems() {
    items = [
      CollectionModel(imagePath: ProjectImages.imageCollection, title: "Abstaract Art", price: 3.4),
      CollectionModel(imagePath: ProjectImages.imageCollection, title: "Abstaract Art2", price: 4.4),
      CollectionModel(imagePath: ProjectImages.imageCollection, title: "Abstaract Art3", price: 5.4),
      CollectionModel(imagePath: ProjectImages.imageCollection, title: "Abstaract Art4", price: 6.4),
    ];
  }
}

class ProjectImages{
  static const imageCollection = "assets/jpeg/image_collection.jpeg";
}

class PaddingUtility{
  final paddingTop = EdgeInsets.only(top: 20.0);
  final paddingBottom = EdgeInsets.only(bottom: 10.0);
  final paddingGeneral = EdgeInsets.all(20.0);
  final paddingHorizontal = EdgeInsets.symmetric(horizontal: 20);
}