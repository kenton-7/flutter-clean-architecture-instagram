import 'package:instagram/core/usecase/usecase.dart';
import 'package:instagram/data/models/comment.dart';
import 'package:instagram/domain/repositories/post/comment/comment_repository.dart';

class GetSpecificCommentsUseCase implements UseCase<List<Comment>, String> {
  final FirestoreCommentRepository _getAllCommentsRepository;

  GetSpecificCommentsUseCase(this._getAllCommentsRepository);

  @override
  Future<List<Comment>> call({required String params}) {
    return _getAllCommentsRepository.getSpecificComments(postId: params);
  }
}
