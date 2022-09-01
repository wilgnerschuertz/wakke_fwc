import 'package:equatable/equatable.dart';

class FeedEntity extends Equatable {
  final String _id;
  final bool private;

  const FeedEntity(this._id, this.private);

  @override
  List<Object> get props {
    return [_id, private];
  }
}
