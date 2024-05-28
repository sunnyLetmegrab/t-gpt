import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_model.freezed.dart';
part 'history_model.g.dart';

@Freezed(toJson: true,fromJson: true)
class HistoryModel with _$HistoryModel {
  const factory HistoryModel({
    required String message,
    required int roomId,
    required DateTime lastMessageTime,
  }) = _HistoryModel;

  factory HistoryModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryModelFromJson(json);
}
