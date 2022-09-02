import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:wakke_fwc/src/modules/feed/presentation/pages/feed_detail.dart';
import 'external/datasource/feed_datasources_impl.dart';
import 'presentation/controllers/feed_controller.dart';
import 'presentation/pages/feed_page.dart';
import 'infra/datasource/feed_datasource.dart';
import 'domain/repositories/feed_repository.dart';
import 'domain/usecases/get_feed_usecase.dart';
import 'infra/repositories/feed_repository_impl.dart';

class FeedModule extends Module {
  @override
  List<Bind> get binds => [
        Bind(((i) => Dio())),
        Bind<FeedDatasource>(
          ((i) => FeedDatasourceImpl(i<Dio>())),
        ),
        Bind<FeedRepository>(
          ((i) => FeedRepositoryImpl(i<FeedDatasourceImpl>())),
        ),
        Bind<GetFeedUseCase>(
            ((i) => GetFeedUseCaseImpl(i<FeedRepositoryImpl>()))),
        Bind<FeedController>(
          ((i) => FeedController(i<GetFeedUseCaseImpl>())),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: ((_, args) => const FeedPage())),
        ChildRoute('/detail',
            child: ((_, args) => FeedDetailPage(
                  feed: args.data,
                ))),
      ];
}
