import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:wakke_fwc/src/modules/feed/domain/errors/errors.dart';
import 'package:wakke_fwc/src/modules/feed/infra/datasource/feed_datasource.dart';
import 'package:wakke_fwc/src/modules/feed/infra/models/feed_model.dart';
import 'package:wakke_fwc/src/modules/feed/infra/repositories/feed_repository_impl.dart';

import 'feed_repository_impl_test.mocks.dart';

@GenerateMocks([FeedDatasource, FeedModel])
void main() {
  late MockFeedDatasource _datasource;
  //System under testing
  late FeedRepositoryImpl sut;

  List<FeedModel> feedsMock = [
    MockFeedModel(),
  ];

  setUpAll(() {
    _datasource = MockFeedDatasource();
    sut = FeedRepositoryImpl(_datasource);
  });

  group('Repository - FeedRepositoryImpl / ', () {
    test('Should return of list feed', () async {
      // arrange
      when(_datasource.getFeeds()).thenAnswer(
        (_) async => feedsMock,
      );
      // act
      var result = await sut.getFeed();
      // asset
      expect(result.fold(id, id), isA<List<FeedModel>>());
    });
  });

  test('Should return of list empty', () async {
    // arrange
    when(_datasource.getFeeds()).thenAnswer(
      (_) async => <FeedModel>[],
    );
    // act
    var result = await sut.getFeed();
    // asset
    expect(result.fold(id, id), isA<EmptyListError>());
  });
}
