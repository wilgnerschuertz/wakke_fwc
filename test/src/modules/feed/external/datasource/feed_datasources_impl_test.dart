import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:wakke_fwc/src/modules/feed/domain/errors/errors.dart';
import 'package:wakke_fwc/src/modules/feed/external/datasource/feed_datasources_impl.dart';
import 'package:wakke_fwc/src/modules/feed/infra/models/feed_model.dart';

import '../../feed_helper.dart';
import 'feed_datasources_impl_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio _dio;
  //System under testing
  late FeedDatasourceImpl sut;

  // List<FeedEntity> feedsMock = [
  //   MockFeedEntity(),
  // ];

  setUpAll(() {
    _dio = MockDio();
    sut = FeedDatasourceImpl(_dio);
  });

  group('DataSource - FeedDataSource / ', () {
    test("Retornar lista do feeds", () async {
      var mock = await getFeedResponseMock();

      when(_dio.get(any)).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(path: '', data: mock),
            data: mock,
          ));

      final result = await sut.getFeeds();

      expect(result, isNotNull);
      expect(result, isA<List<FeedModel>>());
    });

    test("Retornar error", () async {
      when(_dio.get(any)).thenThrow(
        (_) async => Failure(),
      );

      final result = await sut.getFeeds();

      expect(result, throwsA(isA<Failure>()));
    });
  });
}
