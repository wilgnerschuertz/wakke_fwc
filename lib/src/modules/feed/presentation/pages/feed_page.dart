// ignore_for_file: non_constant_identifier_names, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
      body: ValueListenableBuilder(
          valueListenable: controller,
          builder: (_, __, ___) {
            return controller.value.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              success: (feeds) => _Success(feeds),
              error: () => const Center(child: Text('Error')),
            );
          }),
    );
  }
}

ListView _Success(List<FeedEntity> feeds) {
  return ListView.builder(
    itemCount: feeds.length,
    itemBuilder: (context, index) {
      var item = feeds[index];
      return Card(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          children: [
            Row(
              children: [
                /*

                CircleAvatar(
                  child: item.avatar == null
                      ? Icon(
                          Icons.person,
                          color: Color.black,
                          size: 40,
                        )
                      : Image.network(
                          item.avatar.toString(),
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                        ),
                ),

                */

                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 0, 6),
                  child: Text(item.name),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 2, 8, 8),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.3,
                child: (item.image == null)
                    ? const Icon(Icons.person)
                    : Image.network(
                        item.image,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ],
        ),
      );

      // Text(item.name);
    },
  );
}
