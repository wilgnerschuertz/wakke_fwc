import '../../infra/datasource/feed_datasource.dart';
import '../../infra/models/feed_model.dart';

class FeedDatasourceImpl implements FeedDatasource {
  @override
  Future<List<FeedModel>> getFeeds() {
    throw UnimplementedError();
  }
}
