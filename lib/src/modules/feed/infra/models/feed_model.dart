import '../../domain/entities/feed_entity.dart';

class FeedModel extends FeedEntity {
  const FeedModel({
    required String id,
    required bool private,
    required String name,
    required int comments,
    required int notes,
    required String photo,
    required String image,
    required String description,
    // required int evaluation,
    required String title,
  }) : super(
          id: id,
          private: private,
          name: name,
          comments: comments,
          photo: photo,
          image: image,
          description: description,
          title: title,
          notes: notes,
          // evaluation: evaluation,
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'privado': private,
      'usuario_autor_nome': name,
      'comentarios_qtd': comments,
      'descricao': description,
      'imagem_capa': image,
      'usuario_autor_imagem_perfil': photo,
      'titulo': title,
      'comentarios_qtd': notes,
    };
  }

  factory FeedModel.fromMap(Map<String, dynamic> map) {
    return FeedModel(
      id: map['_id'] as String, //OK
      private: map['privado'] as bool, //OK
      name: map['usuario_autor_nome'] as String, //OK
      photo: map['usuario_autor_imagem_perfil'] as String, //OK
      image: map['imagem_capa'] as String, //OK
      description: map['descricao'] as String, //OK
      comments: map['comentarios_qtd'] as int, //OK
      title: map['titulo'] as String,
      notes: map['comentarios_qtd'] as int,
    );
  }
}
