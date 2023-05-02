import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_gameboard_data.freezed.dart';
part 'remote_gameboard_data.g.dart';

@freezed
class RemoteGameboardResponse with _$RemoteGameboardResponse {
  const factory RemoteGameboardResponse(
          List<int> data, String message, int statusCode, String status) =
      _RemoteGameboardResponse;

  factory RemoteGameboardResponse.fromJson(Map<String, dynamic> json) =>
      _$RemoteGameboardResponseFromJson(json);
}
