// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'collections_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CollectionsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CollectionsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CollectionsState()';
}


}

/// @nodoc
class $CollectionsStateCopyWith<$Res>  {
$CollectionsStateCopyWith(CollectionsState _, $Res Function(CollectionsState) __);
}


/// Adds pattern-matching-related methods to [CollectionsState].
extension CollectionsStatePatterns on CollectionsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CollectionsInitial value)?  initial,TResult Function( CollectionsLoaded value)?  loaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CollectionsInitial() when initial != null:
return initial(_that);case CollectionsLoaded() when loaded != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CollectionsInitial value)  initial,required TResult Function( CollectionsLoaded value)  loaded,}){
final _that = this;
switch (_that) {
case CollectionsInitial():
return initial(_that);case CollectionsLoaded():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CollectionsInitial value)?  initial,TResult? Function( CollectionsLoaded value)?  loaded,}){
final _that = this;
switch (_that) {
case CollectionsInitial() when initial != null:
return initial(_that);case CollectionsLoaded() when loaded != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( List<CollectionModel> collections)?  loaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CollectionsInitial() when initial != null:
return initial();case CollectionsLoaded() when loaded != null:
return loaded(_that.collections);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( List<CollectionModel> collections)  loaded,}) {final _that = this;
switch (_that) {
case CollectionsInitial():
return initial();case CollectionsLoaded():
return loaded(_that.collections);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( List<CollectionModel> collections)?  loaded,}) {final _that = this;
switch (_that) {
case CollectionsInitial() when initial != null:
return initial();case CollectionsLoaded() when loaded != null:
return loaded(_that.collections);case _:
  return null;

}
}

}

/// @nodoc


class CollectionsInitial implements CollectionsState {
  const CollectionsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CollectionsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CollectionsState.initial()';
}


}




/// @nodoc


class CollectionsLoaded implements CollectionsState {
  const CollectionsLoaded({required final  List<CollectionModel> collections}): _collections = collections;
  

 final  List<CollectionModel> _collections;
 List<CollectionModel> get collections {
  if (_collections is EqualUnmodifiableListView) return _collections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_collections);
}


/// Create a copy of CollectionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CollectionsLoadedCopyWith<CollectionsLoaded> get copyWith => _$CollectionsLoadedCopyWithImpl<CollectionsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CollectionsLoaded&&const DeepCollectionEquality().equals(other._collections, _collections));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_collections));

@override
String toString() {
  return 'CollectionsState.loaded(collections: $collections)';
}


}

/// @nodoc
abstract mixin class $CollectionsLoadedCopyWith<$Res> implements $CollectionsStateCopyWith<$Res> {
  factory $CollectionsLoadedCopyWith(CollectionsLoaded value, $Res Function(CollectionsLoaded) _then) = _$CollectionsLoadedCopyWithImpl;
@useResult
$Res call({
 List<CollectionModel> collections
});




}
/// @nodoc
class _$CollectionsLoadedCopyWithImpl<$Res>
    implements $CollectionsLoadedCopyWith<$Res> {
  _$CollectionsLoadedCopyWithImpl(this._self, this._then);

  final CollectionsLoaded _self;
  final $Res Function(CollectionsLoaded) _then;

/// Create a copy of CollectionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? collections = null,}) {
  return _then(CollectionsLoaded(
collections: null == collections ? _self._collections : collections // ignore: cast_nullable_to_non_nullable
as List<CollectionModel>,
  ));
}


}

// dart format on
