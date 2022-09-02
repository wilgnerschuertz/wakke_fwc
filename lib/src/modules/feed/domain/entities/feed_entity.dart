import 'package:equatable/equatable.dart';

class FeedEntity extends Equatable {
  final String id;
  final bool private;
  final String name;
  final String photo;
  final String image;
  final String description;
  final String title;
  final int comments;
  final int notes;

  const FeedEntity({
    required this.id,
    required this.private,
    required this.name,
    required this.photo,
    required this.image,
    required this.description,
    required this.comments,
    required this.title,
    required this.notes,
  });

  @override
  List<Object> get props => [
        id,
        private,
        name,
        comments,
        photo,
        image,
        description,
        title,
        notes,
      ];
}
