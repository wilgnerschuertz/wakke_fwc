import 'package:flutter_modular/flutter_modular.dart';
import 'modules/feed/feed_module.dart';
import 'modules/splash/presentation/pages/splash_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => const SplashPage(),
        ),
        ModuleRoute('/feed/', module: FeedModule()),
      ];
}
