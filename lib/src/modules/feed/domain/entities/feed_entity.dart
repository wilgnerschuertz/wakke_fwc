import 'package:equatable/equatable.dart';

class FeedEntity extends Equatable {
  final String id;
  final bool private;
  final String name;
  // final String avatar;
  final String image;

  const FeedEntity({
    required this.id,
    required this.private,
    required this.name,
    // required this.avatar,
    required this.image,
  });

  @override
  List<Object> get props => [
        id,
        private,
        name,
        image,
      ];
}
