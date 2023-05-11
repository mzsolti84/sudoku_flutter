import 'dart:async';
import 'dart:core';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:sudoku_flutter/data/gameboard/model/remote_gameboard_data.dart';

import '../../common/rest_api_exception.dart';
import '../../domain/model/gameboard.dart';

@injectable
class RemoteGameboardDataSource {
  final Dio _dio;

  RemoteGameboardDataSource(this._dio);

  Future<Gameboard?> fetchPuzzle(int index) async {
    try {
      var initPuzzleResponse = await _dio.get(
        'newgame/${Level.values[index].value}',
      );
      var solvedPuzzleResponse = await _dio.get(
        'solvedgame',
      );
      if (initPuzzleResponse.statusCode == 200 &&
          solvedPuzzleResponse.statusCode == 200) {
        var initResult =
            RemoteGameboardResponse.fromJson(initPuzzleResponse.data);
        var solvedResult =
            RemoteGameboardResponse.fromJson(solvedPuzzleResponse.data);
        debugPrint(initResult.data.toString());
        return Gameboard(
            initPuzzle: initResult.data,
            solvedPuzzle: solvedResult.data,
            level: Level.values[index]);
      }
      return null;
    } on DioError catch (e) {
      return null;
    }
  }
}
