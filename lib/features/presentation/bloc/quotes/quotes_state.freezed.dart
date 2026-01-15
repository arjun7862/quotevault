// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quotes_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QuotesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuotesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'QuotesState()';
}


}

/// @nodoc
class $QuotesStateCopyWith<$Res>  {
$QuotesStateCopyWith(QuotesState _, $Res Function(QuotesState) __);
}


/// Adds pattern-matching-related methods to [QuotesState].
extension QuotesStatePatterns on QuotesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( QuotesInitial value)?  initial,TResult Function( QuotesLoading value)?  loading,TResult Function( QuotesLoaded value)?  loaded,TResult Function( QuotesEmpty value)?  empty,TResult Function( QuotesError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case QuotesInitial() when initial != null:
return initial(_that);case QuotesLoading() when loading != null:
return loading(_that);case QuotesLoaded() when loaded != null:
return loaded(_that);case QuotesEmpty() when empty != null:
return empty(_that);case QuotesError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( QuotesInitial value)  initial,required TResult Function( QuotesLoading value)  loading,required TResult Function( QuotesLoaded value)  loaded,required TResult Function( QuotesEmpty value)  empty,required TResult Function( QuotesError value)  error,}){
final _that = this;
switch (_that) {
case QuotesInitial():
return initial(_that);case QuotesLoading():
return loading(_that);case QuotesLoaded():
return loaded(_that);case QuotesEmpty():
return empty(_that);case QuotesError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( QuotesInitial value)?  initial,TResult? Function( QuotesLoading value)?  loading,TResult? Function( QuotesLoaded value)?  loaded,TResult? Function( QuotesEmpty value)?  empty,TResult? Function( QuotesError value)?  error,}){
final _that = this;
switch (_that) {
case QuotesInitial() when initial != null:
return initial(_that);case QuotesLoading() when loading != null:
return loading(_that);case QuotesLoaded() when loaded != null:
return loaded(_that);case QuotesEmpty() when empty != null:
return empty(_that);case QuotesError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<QuoteModel> quotes,  bool hasMore)?  loaded,TResult Function()?  empty,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case QuotesInitial() when initial != null:
return initial();case QuotesLoading() when loading != null:
return loading();case QuotesLoaded() when loaded != null:
return loaded(_that.quotes,_that.hasMore);case QuotesEmpty() when empty != null:
return empty();case QuotesError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<QuoteModel> quotes,  bool hasMore)  loaded,required TResult Function()  empty,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case QuotesInitial():
return initial();case QuotesLoading():
return loading();case QuotesLoaded():
return loaded(_that.quotes,_that.hasMore);case QuotesEmpty():
return empty();case QuotesError():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<QuoteModel> quotes,  bool hasMore)?  loaded,TResult? Function()?  empty,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case QuotesInitial() when initial != null:
return initial();case QuotesLoading() when loading != null:
return loading();case QuotesLoaded() when loaded != null:
return loaded(_that.quotes,_that.hasMore);case QuotesEmpty() when empty != null:
return empty();case QuotesError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class QuotesInitial implements QuotesState {
  const QuotesInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuotesInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'QuotesState.initial()';
}


}




/// @nodoc


class QuotesLoading implements QuotesState {
  const QuotesLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuotesLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'QuotesState.loading()';
}


}




/// @nodoc


class QuotesLoaded implements QuotesState {
  const QuotesLoaded({required final  List<QuoteModel> quotes, required this.hasMore}): _quotes = quotes;
  

 final  List<QuoteModel> _quotes;
 List<QuoteModel> get quotes {
  if (_quotes is EqualUnmodifiableListView) return _quotes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_quotes);
}

 final  bool hasMore;

/// Create a copy of QuotesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuotesLoadedCopyWith<QuotesLoaded> get copyWith => _$QuotesLoadedCopyWithImpl<QuotesLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuotesLoaded&&const DeepCollectionEquality().equals(other._quotes, _quotes)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_quotes),hasMore);

@override
String toString() {
  return 'QuotesState.loaded(quotes: $quotes, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class $QuotesLoadedCopyWith<$Res> implements $QuotesStateCopyWith<$Res> {
  factory $QuotesLoadedCopyWith(QuotesLoaded value, $Res Function(QuotesLoaded) _then) = _$QuotesLoadedCopyWithImpl;
@useResult
$Res call({
 List<QuoteModel> quotes, bool hasMore
});




}
/// @nodoc
class _$QuotesLoadedCopyWithImpl<$Res>
    implements $QuotesLoadedCopyWith<$Res> {
  _$QuotesLoadedCopyWithImpl(this._self, this._then);

  final QuotesLoaded _self;
  final $Res Function(QuotesLoaded) _then;

/// Create a copy of QuotesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? quotes = null,Object? hasMore = null,}) {
  return _then(QuotesLoaded(
quotes: null == quotes ? _self._quotes : quotes // ignore: cast_nullable_to_non_nullable
as List<QuoteModel>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class QuotesEmpty implements QuotesState {
  const QuotesEmpty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuotesEmpty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'QuotesState.empty()';
}


}




/// @nodoc


class QuotesError implements QuotesState {
  const QuotesError(this.message);
  

 final  String message;

/// Create a copy of QuotesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuotesErrorCopyWith<QuotesError> get copyWith => _$QuotesErrorCopyWithImpl<QuotesError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuotesError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'QuotesState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $QuotesErrorCopyWith<$Res> implements $QuotesStateCopyWith<$Res> {
  factory $QuotesErrorCopyWith(QuotesError value, $Res Function(QuotesError) _then) = _$QuotesErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$QuotesErrorCopyWithImpl<$Res>
    implements $QuotesErrorCopyWith<$Res> {
  _$QuotesErrorCopyWithImpl(this._self, this._then);

  final QuotesError _self;
  final $Res Function(QuotesError) _then;

/// Create a copy of QuotesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(QuotesError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
