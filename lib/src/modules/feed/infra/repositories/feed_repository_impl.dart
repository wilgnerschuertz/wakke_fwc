import 'package:dartz/dartz.dart';
import 'package:wakke_fwc/src/modules/feed/infra/datasource/feed_datasource.dart';

import '../../domain/entities/feed_entity.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/feed_repository.dart';

class FeedRepositoryImpl implements FeedRepository {
  final FeedDatasource _datasource;

  FeedRepositoryImpl(this._datasource);
  @override
  Future<Either<Failure, List<FeedEntity>>> getFeed() async {
    try {
      var result = await _datasource.getFeeds();

      if (result.isEmpty) {
        return Left(EmptyListError());
      }

      return Right(result);
    } catch (e) {
      return Left(NullListError());
    }
  }
}
