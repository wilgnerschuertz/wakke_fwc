import 'package:equatable/equatable.dart';

class FeedEntity extends Equatable {
  final String id;
  final bool private;
  final String name;
  // final String avatar;
  final String photo;
  final String title;
  final String image;
  final String description;

  const FeedEntity({
    required this.id,
    required this.private,
    required this.name,
    // required this.avatar,
    required this.photo,
    required this.title,
    required this.image,
    required this.description,
  });

  @override
  List<Object> get props => [
        id,
        private,
        name,
        // avatar,
        photo,
        title,
        image,
        description,
      ];
}
