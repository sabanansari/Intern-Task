import 'dart:async';
import 'package:random_string/random_string.dart';
import 'dart:math' show Random;
import 'networking.dart';

NetworkHelper networkHelper =
    NetworkHelper('https://jsonplaceholder.typicode.com/photos');
var decoded = networkHelper.getData();

Future<List<Map>> _getExampleServerData(int length) async {
  String ran = randomAlphaNumeric(6);
  int ranInt = randomBetween(0, 5000);
  String imageTitle = (await decoded)[ranInt]['title'];
  String picture = (await decoded)[ranInt]['url'];
  return Future.delayed(Duration(seconds: 1), () async {
    return List<Map>.generate(length, (int index) {
      return {
        "id": ranInt,
        "avatar": '$picture.png',
        "title": imageTitle,
      };
    });
  });
}

class PostModel {
  int id;
  String title;
  String avatar;
  PostModel({this.id, this.avatar, this.title});
  factory PostModel.fromServerMap(Map data) {
    return PostModel(
      id: data['id'],
      avatar: data['avatar'],
      title: data['title'],
    );
  }
}

class PostsModel {
  Stream<List<PostModel>> stream;
  bool hasMore;

  bool _isLoading;
  List<Map> _data;
  StreamController<List<Map>> _controller;

  PostsModel() {
    _data = List<Map>();
    _controller = StreamController<List<Map>>.broadcast();
    _isLoading = false;
    stream = _controller.stream.map((List<Map> postsData) {
      return postsData.map((Map postData) {
        return PostModel.fromServerMap(postData);
      }).toList();
    });
    hasMore = true;
    refresh();
  }

  Future<void> refresh() {
    return loadMore(clearCachedData: true);
  }

  Future<void> loadMore({bool clearCachedData = false}) {
    if (clearCachedData) {
      _data = List<Map>();
      hasMore = true;
    }
    if (_isLoading || !hasMore) {
      return Future.value();
    }
    _isLoading = true;
    return _getExampleServerData(10).then((postsData) {
      _isLoading = false;
      _data.addAll(postsData);
      hasMore = (_data.length < 30);
      _controller.add(_data);
    });
  }
}
