import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:wakke_fwc/src/modules/feed/domain/entities/feed_entity.dart';
import 'package:wakke_fwc/src/modules/feed/domain/errors/errors.dart';
import 'package:wakke_fwc/src/modules/feed/domain/repositories/feed_repository.dart';
import 'package:wakke_fwc/src/modules/feed/domain/usecases/get_feed_usecase.dart';

import 'get_feed_usecase_test.mocks.dart';

@GenerateMocks([FeedRepository, FeedEntity])
void main() {
  late MockFeedRepository repository;
  //System under testing
  late GetFeedUseCaseImpl sut;

  List<FeedEntity> feedsMock = [
    MockFeedEntity(),
  ];

  setUpAll(() {
    repository = MockFeedRepository();
    sut = GetFeedUseCaseImpl(repository);
  });

  group('Usecase - GetFeedUseCaseImpl / ', () {
    test('Should return of list feed', () async {
      // arrange
      when(repository.getFeed()).thenAnswer(
        (_) async => Right(feedsMock),
      );
      // act
      var result = await sut();
      // asset
      expect(result.fold(id, id), isA<List<FeedEntity>>());
    });
    test('Should return a error of empty list', () async {
      // arrange
      when(repository.getFeed()).thenAnswer(
        (_) async => Left(EmptyListError()),
      );
      // act
      var result = await sut();
      // asset
      expect(result.fold(id, id), isA<EmptyListError>());
    });

    test('Should return a error of null list', () async {
      // arrange
      when(repository.getFeed()).thenAnswer(
        (_) async => Left(NullListError()),
      );
      // act
      var result = await sut();
      // asset
      expect(result.fold(id, id), isA<NullListError>());
    });
  });
}
