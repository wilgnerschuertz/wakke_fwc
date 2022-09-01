import 'package:dartz/dartz.dart';

import '../repositories/feed_repository.dart';
import '../entities/feed_entity.dart';
import '../errors/errors.dart';

abstract class GetFeedUseCase {
  Future<Either<Failure, List<FeedEntity>>> call();
}

class GetFeedUseCaseImpl implements GetFeedUseCase {
  final FeedRepository _repository;

  GetFeedUseCaseImpl(this._repository);

  @override
  Future<Either<Failure, List<FeedEntity>>> call() {
    return _repository.getFeed();
  }
}
