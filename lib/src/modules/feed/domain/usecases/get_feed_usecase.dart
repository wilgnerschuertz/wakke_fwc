import 'package:dartz/dartz.dart';

import '../entities/feed_entity.dart';

abstract class GetFeedUseCase {
  Future<Either<Exception, List<FeedEntity>>> call();
}

class GetFeedUseCaseImpl implements GetFeedUseCase {
  @override
  Future<Either<Exception, List<FeedEntity>>> call() {
    throw UnimplementedError();
  }
}
