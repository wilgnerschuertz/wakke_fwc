import 'package:dartz/dartz.dart';
import 'package:wakke_fwc/src/modules/feed/domain/repositories/feed_repository.dart';

import '../entities/feed_entity.dart';

abstract class GetFeedUseCase {
  Future<Either<Exception, List<FeedEntity>>> call();
}

class GetFeedUseCaseImpl implements GetFeedUseCase {
  final FeedRepository _repository;

  GetFeedUseCaseImpl(this._repository);

  @override
  Future<Either<Exception, List<FeedEntity>>> call() {
    return _repository.getFeed();
  }
}
