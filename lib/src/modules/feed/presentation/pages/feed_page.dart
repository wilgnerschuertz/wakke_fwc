// ignore_for_file: non_constant_identifier_names, unnecessary_null_comparison

import 'dart:developer';

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset(
            'assets/images/icon_header_menu.png',
            width: 20,
          ),
        ),
        title: Image.asset(
          'assets/images/logo_wakke_roxo.png',
          fit: BoxFit.cover,
          height: 20.00,
          // width: 20.00,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon:
                Image.asset('assets/images/icon_header_search.png', width: 20),
          )
        ],
      ),
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
      return InkWell(
        onTap: () {
          log(item.id);
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(item.photo),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 0, 6),
                    child: Text(
                      item.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_vert_outlined,
                        size: 16,
                      ),
                    ),
                  ),
                ],
              ),

              //Image feed
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 2, 8, 8),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: (item.image == null)
                      ? const Icon(Icons.person)
                      : Container(
                          alignment: Alignment.center,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 500.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                image: NetworkImage(
                                  item.image,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const ImageIcon(
                        AssetImage("assets/icons/grey_icon_account.png"),
                        color: Colors.black,
                        size: 16),

                    const Text(' 0'),
                    //
                    const Spacer(),
                    //
                    const ImageIcon(
                        AssetImage("assets/icons/grey_icon_btn_comments.png"),
                        color: Colors.black,
                        size: 16),

                    const Text(' 0'),

                    //
                    const SizedBox(width: 8),
                    //

                    const ImageIcon(
                        AssetImage("assets/icons/grey_icon_rating.png"),
                        color: Colors.black,
                        size: 16),

                    const Text(' 0'),
                  ],
                ),
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 6),
                  child: Text(item.description),
                ),
              ),
            ],
          ),
        ),
      );

      // Text(item.name);
    },
  );
}
