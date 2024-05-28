import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_item.freezed.dart';
@freezed
class HomeItem with _$HomeItem {
  const factory HomeItem({
    required String assetImage,
    required List<String> questions,
    required String feature,
  }) = _HomItem;
}
