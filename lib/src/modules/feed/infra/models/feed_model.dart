import '../../domain/entities/feed_entity.dart';

class FeedModel extends FeedEntity {
  const FeedModel({
    required String id,
    required bool private,
    required String name,
    // required String avatar,
    required String image,
  }) : super(
          id: id,
          private: private,
          name: name,
          // avatar: avatar,
          image: image,
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'privado': private,
      'usuario_autor_nome': name,
      'imagem_capa': image
    };
  }

  factory FeedModel.fromMap(Map<String, dynamic> map) {
    return FeedModel(
      id: map['_id'] as String,
      private: map['privado'] as bool,
      name: map['usuario_autor_nome'] as String,
      // avatar: map['usuario_autor_imagem_perfil'] as String,
      image: map['imagem_capa'] as String,
    );
  }
}
