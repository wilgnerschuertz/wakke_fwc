import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../widgets/feed_tile.dart';
import '../../domain/entities/feed_entity.dart';
import '../controllers/feed_controller.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final controller = Modular.get<FeedController>();

  @override
  void initState() {
    controller.showFeeds();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset(
            'assets/images/icon_header_menu.png',
            width: 20.0,
          ),
        ),
        title: Image.asset(
          'assets/images/logo_wakke_roxo.png',
          fit: BoxFit.cover,
          height: 20.0,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/images/icon_header_search.png',
              width: 20.0,
            ),
          )
        ],
      ),
      body: ValueListenableBuilder(
          valueListenable: controller,
          builder: (_, __, ___) {
            return controller.value.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              success: (feeds) => _success(feeds),
              error: () => const Center(child: Text('Error')),
            );
          }),
    );
  }
}

ListView _success(List<FeedEntity> feeds) {
  return ListView.builder(
    itemCount: feeds.length,
    itemBuilder: (context, index) {
      var item = feeds[index];
      return FeedTile(
        item: item,
      );
    },
  );
}
