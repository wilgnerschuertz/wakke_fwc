import '../../domain/entities/feed_entity.dart';

class FeedModel extends FeedEntity {
  const FeedModel({
    required String id,
    required bool private,
  }) : super('', false);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'privado': private,
    };
  }

  factory FeedModel.fromMap(Map<String, dynamic> map) {
    return FeedModel(
      id: map['_id'] as String,
      private: map['privado'] as bool,
    );
  }
}
