import 'dart:core';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:sudoku_flutter/data/gameboard/model/remote_gameboard_data.dart';

import '../../common/rest_api_exception.dart';

@injectable
class RemoteGameboardDataSource {
  final Dio _dio;

  RemoteGameboardDataSource(this._dio);

  Future<List<int>> fetchInitialPuzzle() async {
    try {
      var response = await _dio.get(
        'newgame/34',
      );
      if (response.statusCode == 200) {
        var result = RemoteGameboardResponse.fromJson(response.data);
        debugPrint(result.data.toString());
        return result.data;
      } else {
        debugPrint('Hálózati hiba!');
        return List.generate(81, (index) => 0);
      }
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        debugPrint(e.toString());
        return List.generate(81, (index) => 0);
      } else if (e.response != null) {
        throw RestApiException(e.response?.statusCode.toString());
      } else {
        rethrow;
      }
    }
  }
}

extension DioErrorX on DioError {
  bool get isNoConnectionError =>
      type == DioErrorType.unknown &&
      error is SocketException;
}
