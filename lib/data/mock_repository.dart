import 'dart:math';
import 'package:faker/faker.dart';
import 'package:prueba_tecnica_1/models/grid_item_model.dart';

class MockRepository {
  //Generate a list of 50 mock items for the content
  static final List<GridItemModel> items = List.generate(
    50,
    (index) => GridItemModel(
        title: "id: $index",
        imageUrl: faker.image.image(
            width: 190,
            height: 220,
            keywords: ['call', 'city', 'people', 'live', 'stream'],
            random: true),
        isMostLiked: index == 0,
        isMostViewed: index == 3,
        description: faker.lorem.sentence(),
        date: '02/28/2024',
        likes: '${Random().nextInt(100) + 1}'),
  );
}
