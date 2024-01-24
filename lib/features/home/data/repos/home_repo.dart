import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> featchNewestBooks();
  Future<Either<Failure, List<BookModel>>> featchFeaturedBooks();
  Future<Either<Failure, List<BookModel>>> featchSimilarBooks(
      {required String category});
}
