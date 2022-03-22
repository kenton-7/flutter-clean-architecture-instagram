import 'dart:io';
import 'package:instegram/data/datasourses/remote/firebase_storage.dart';
import 'package:instegram/data/datasourses/remote/firestore_post.dart';
import 'package:instegram/data/models/comment.dart';
import 'package:instegram/data/models/post.dart';
import '../../domain/repositories/post_repository.dart';

class FirestorePostRepositoryImpl implements FirestorePostRepository {
  @override
  Future<String> createPost(
      {required Post postInfo,
      required Comment commentInfo,
      required File photo}) async {
    try {
      String postImageUrl =
          await FirebaseStorageImage.uploadImage(photo, 'postsImage');
      postInfo.postImageUrl = postImageUrl;
      String postUid = await FirestorePost.createPost(postInfo);
      commentInfo.postId = postUid;
      await FirestorePost.addComment(commentInfo);
      return postUid;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<List<Post>> getPostInfo(List<String> postId) async {
    try {
      return await FirestorePost.getPostInfo(postId);
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}