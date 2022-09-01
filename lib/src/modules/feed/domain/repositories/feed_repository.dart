import 'package:dartz/dartz.dart';

import '../errors/errors.dart';
import '../entities/feed_entity.dart';

abstract class FeedRepository {
  Future<Either<Failure, List<FeedEntity>>> getFeed();
}
