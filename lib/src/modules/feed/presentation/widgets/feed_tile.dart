import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:wakke_fwc/src/modules/feed/domain/entities/feed_entity.dart';

class FeedTile extends StatelessWidget {
  final FeedEntity item;

  const FeedTile({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () => Modular.to.pushNamed('/feed/detail', arguments: item),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(item.photo),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 6.0),
                  child: Text(
                    item.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert_outlined,
                    size: 16.0,
                  ),
                ),
              ],
            ),
            FadeInImage.assetNetwork(
              placeholder: 'assets/icons/loading.gif',
              placeholderScale: 0.5,
              placeholderFit: BoxFit.cover,
              height: size.height * 0.25,
              width: size.width * 0.9,
              image: item.image,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
              child: Row(
                children: [
                  const ImageIcon(
                    AssetImage("assets/icons/grey_icon_account.png"),
                    color: Colors.black,
                    size: 16.0,
                  ),
                  const Text(' 111'),
                  const Spacer(),
                  const ImageIcon(
                    AssetImage("assets/icons/grey_icon_btn_comments.png"),
                    color: Colors.black,
                    size: 16.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      item.comments.toString(),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  const ImageIcon(
                    AssetImage("assets/icons/grey_icon_rating.png"),
                    color: Colors.black,
                    size: 16.0,
                  ),
                  Text(' ${item.notes}')
                ],
              ),
            ),
            SizedBox(
              width: size.width * 0.8,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 6.0, top: 8.0, bottom: 8.0),
                child: Text(
                  item.description,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
