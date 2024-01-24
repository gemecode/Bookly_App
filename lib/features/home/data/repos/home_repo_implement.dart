import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplement implements HomeRepo {
  final ApiService apiService;
  HomeRepoImplement(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> featchNewestBooks() async {
    try {
      var data = await apiService.get(
          endPoint:
              'volumes?q=subject:programming&Filtering=free-ebooks&Sorting=newest');

      List<BookModel> books = [];

      for (var element in data['items']) {
        books.add(BookModel.fromJson(element));
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> featchFeaturedBooks() async {
    try {
      var data = await apiService.get(
          endPoint: 'volumes?q=programming&Filtering=free-ebooks');

      List<BookModel> books = [];

      for (var element in data['items']) {
        books.add(BookModel.fromJson(element));
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> featchSimilarBooks(
      {required String category}) async {
    try {
      var data = await apiService.get(
          endPoint:
              'volumes?q=programming&Filtering=free-ebooks&Sorting=relevance');

      List<BookModel> books = [];

      for (var element in data['items']) {
        books.add(BookModel.fromJson(element));
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
