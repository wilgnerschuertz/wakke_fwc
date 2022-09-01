import 'package:equatable/equatable.dart';

class FeedEntity extends Equatable {
  final String id;
  final bool private;

  const FeedEntity(this.id, this.private);

  @override
  List<Object> get props => [id, private];
}
