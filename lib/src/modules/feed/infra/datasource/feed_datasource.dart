import '../models/feed_model.dart';

abstract class FeedDatasource {
  Future<List<FeedModel>> getFeeds();
}
