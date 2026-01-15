// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'collection_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CollectionDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CollectionDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CollectionDetailState()';
}


}

/// @nodoc
class $CollectionDetailStateCopyWith<$Res>  {
$CollectionDetailStateCopyWith(CollectionDetailState _, $Res Function(CollectionDetailState) __);
}


/// Adds pattern-matching-related methods to [CollectionDetailState].
extension CollectionDetailStatePatterns on CollectionDetailState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CollectionDetailLoading value)?  loading,TResult Function( CollectionDetailLoaded value)?  loaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CollectionDetailLoading() when loading != null:
return loading(_that);case CollectionDetailLoaded() when loaded != null:
return loaded(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CollectionDetailLoading value)  loading,required TResult Function( CollectionDetailLoaded value)  loaded,}){
final _that = this;
switch (_that) {
case CollectionDetailLoading():
return loading(_that);case CollectionDetailLoaded():
return loaded(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CollectionDetailLoading value)?  loading,TResult? Function( CollectionDetailLoaded value)?  loaded,}){
final _that = this;
switch (_that) {
case CollectionDetailLoading() when loading != null:
return loading(_that);case CollectionDetailLoaded() when loaded != null:
return loaded(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( List<QuoteModel> quotes)?  loaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CollectionDetailLoading() when loading != null:
return loading();case CollectionDetailLoaded() when loaded != null:
return loaded(_that.quotes);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( List<QuoteModel> quotes)  loaded,}) {final _that = this;
switch (_that) {
case CollectionDetailLoading():
return loading();case CollectionDetailLoaded():
return loaded(_that.quotes);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( List<QuoteModel> quotes)?  loaded,}) {final _that = this;
switch (_that) {
case CollectionDetailLoading() when loading != null:
return loading();case CollectionDetailLoaded() when loaded != null:
return loaded(_that.quotes);case _:
  return null;

}
}

}

/// @nodoc


class CollectionDetailLoading implements CollectionDetailState {
  const CollectionDetailLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CollectionDetailLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CollectionDetailState.loading()';
}


}




/// @nodoc


class CollectionDetailLoaded implements CollectionDetailState {
  const CollectionDetailLoaded({required final  List<QuoteModel> quotes}): _quotes = quotes;
  

 final  List<QuoteModel> _quotes;
 List<QuoteModel> get quotes {
  if (_quotes is EqualUnmodifiableListView) return _quotes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_quotes);
}


/// Create a copy of CollectionDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CollectionDetailLoadedCopyWith<CollectionDetailLoaded> get copyWith => _$CollectionDetailLoadedCopyWithImpl<CollectionDetailLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CollectionDetailLoaded&&const DeepCollectionEquality().equals(other._quotes, _quotes));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_quotes));

@override
String toString() {
  return 'CollectionDetailState.loaded(quotes: $quotes)';
}


}

/// @nodoc
abstract mixin class $CollectionDetailLoadedCopyWith<$Res> implements $CollectionDetailStateCopyWith<$Res> {
  factory $CollectionDetailLoadedCopyWith(CollectionDetailLoaded value, $Res Function(CollectionDetailLoaded) _then) = _$CollectionDetailLoadedCopyWithImpl;
@useResult
$Res call({
 List<QuoteModel> quotes
});




}
/// @nodoc
class _$CollectionDetailLoadedCopyWithImpl<$Res>
    implements $CollectionDetailLoadedCopyWith<$Res> {
  _$CollectionDetailLoadedCopyWithImpl(this._self, this._then);

  final CollectionDetailLoaded _self;
  final $Res Function(CollectionDetailLoaded) _then;

/// Create a copy of CollectionDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? quotes = null,}) {
  return _then(CollectionDetailLoaded(
quotes: null == quotes ? _self._quotes : quotes // ignore: cast_nullable_to_non_nullable
as List<QuoteModel>,
  ));
}


}

// dart format on
