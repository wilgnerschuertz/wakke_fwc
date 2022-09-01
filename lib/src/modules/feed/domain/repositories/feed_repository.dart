import 'package:dartz/dartz.dart';

import '../entities/feed_entity.dart';

abstract class FeedRepository {
  Future<Either<Exception, List<FeedEntity>>> getFeed();
}
