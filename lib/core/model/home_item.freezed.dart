// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeItem {
  String get assetImage => throw _privateConstructorUsedError;
  List<String> get questions => throw _privateConstructorUsedError;
  String get feature => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeItemCopyWith<HomeItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeItemCopyWith<$Res> {
  factory $HomeItemCopyWith(HomeItem value, $Res Function(HomeItem) then) =
      _$HomeItemCopyWithImpl<$Res, HomeItem>;
  @useResult
  $Res call({String assetImage, List<String> questions, String feature});
}

/// @nodoc
class _$HomeItemCopyWithImpl<$Res, $Val extends HomeItem>
    implements $HomeItemCopyWith<$Res> {
  _$HomeItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assetImage = null,
    Object? questions = null,
    Object? feature = null,
  }) {
    return _then(_value.copyWith(
      assetImage: null == assetImage
          ? _value.assetImage
          : assetImage // ignore: cast_nullable_to_non_nullable
              as String,
      questions: null == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      feature: null == feature
          ? _value.feature
          : feature // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomItemImplCopyWith<$Res> implements $HomeItemCopyWith<$Res> {
  factory _$$HomItemImplCopyWith(
          _$HomItemImpl value, $Res Function(_$HomItemImpl) then) =
      __$$HomItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String assetImage, List<String> questions, String feature});
}

/// @nodoc
class __$$HomItemImplCopyWithImpl<$Res>
    extends _$HomeItemCopyWithImpl<$Res, _$HomItemImpl>
    implements _$$HomItemImplCopyWith<$Res> {
  __$$HomItemImplCopyWithImpl(
      _$HomItemImpl _value, $Res Function(_$HomItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assetImage = null,
    Object? questions = null,
    Object? feature = null,
  }) {
    return _then(_$HomItemImpl(
      assetImage: null == assetImage
          ? _value.assetImage
          : assetImage // ignore: cast_nullable_to_non_nullable
              as String,
      questions: null == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      feature: null == feature
          ? _value.feature
          : feature // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$HomItemImpl implements _HomItem {
  const _$HomItemImpl(
      {required this.assetImage,
      required final List<String> questions,
      required this.feature})
      : _questions = questions;

  @override
  final String assetImage;
  final List<String> _questions;
  @override
  List<String> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  @override
  final String feature;

  @override
  String toString() {
    return 'HomeItem(assetImage: $assetImage, questions: $questions, feature: $feature)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomItemImpl &&
            (identical(other.assetImage, assetImage) ||
                other.assetImage == assetImage) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions) &&
            (identical(other.feature, feature) || other.feature == feature));
  }

  @override
  int get hashCode => Object.hash(runtimeType, assetImage,
      const DeepCollectionEquality().hash(_questions), feature);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomItemImplCopyWith<_$HomItemImpl> get copyWith =>
      __$$HomItemImplCopyWithImpl<_$HomItemImpl>(this, _$identity);
}

abstract class _HomItem implements HomeItem {
  const factory _HomItem(
      {required final String assetImage,
      required final List<String> questions,
      required final String feature}) = _$HomItemImpl;

  @override
  String get assetImage;
  @override
  List<String> get questions;
  @override
  String get feature;
  @override
  @JsonKey(ignore: true)
  _$$HomItemImplCopyWith<_$HomItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
