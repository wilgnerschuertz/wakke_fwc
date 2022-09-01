import 'package:dartz/dartz.dart';

import '../../domain/entities/feed_entity.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/feed_repository.dart';

class FeedRepositoryImpl implements FeedRepository {
  @override
  Future<Either<Failure, List<FeedEntity>>> getFeed() {
    throw UnimplementedError();
  }
}
