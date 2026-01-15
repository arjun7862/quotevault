// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_quote_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DailyQuoteState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyQuoteState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DailyQuoteState()';
}


}

/// @nodoc
class $DailyQuoteStateCopyWith<$Res>  {
$DailyQuoteStateCopyWith(DailyQuoteState _, $Res Function(DailyQuoteState) __);
}


/// Adds pattern-matching-related methods to [DailyQuoteState].
extension DailyQuoteStatePatterns on DailyQuoteState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DailyQuoteLoading value)?  loading,TResult Function( DailyQuoteLoaded value)?  loaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DailyQuoteLoading() when loading != null:
return loading(_that);case DailyQuoteLoaded() when loaded != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DailyQuoteLoading value)  loading,required TResult Function( DailyQuoteLoaded value)  loaded,}){
final _that = this;
switch (_that) {
case DailyQuoteLoading():
return loading(_that);case DailyQuoteLoaded():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DailyQuoteLoading value)?  loading,TResult? Function( DailyQuoteLoaded value)?  loaded,}){
final _that = this;
switch (_that) {
case DailyQuoteLoading() when loading != null:
return loading(_that);case DailyQuoteLoaded() when loaded != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( QuoteModel quote)?  loaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DailyQuoteLoading() when loading != null:
return loading();case DailyQuoteLoaded() when loaded != null:
return loaded(_that.quote);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( QuoteModel quote)  loaded,}) {final _that = this;
switch (_that) {
case DailyQuoteLoading():
return loading();case DailyQuoteLoaded():
return loaded(_that.quote);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( QuoteModel quote)?  loaded,}) {final _that = this;
switch (_that) {
case DailyQuoteLoading() when loading != null:
return loading();case DailyQuoteLoaded() when loaded != null:
return loaded(_that.quote);case _:
  return null;

}
}

}

/// @nodoc


class DailyQuoteLoading implements DailyQuoteState {
  const DailyQuoteLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyQuoteLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DailyQuoteState.loading()';
}


}




/// @nodoc


class DailyQuoteLoaded implements DailyQuoteState {
  const DailyQuoteLoaded(this.quote);
  

 final  QuoteModel quote;

/// Create a copy of DailyQuoteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyQuoteLoadedCopyWith<DailyQuoteLoaded> get copyWith => _$DailyQuoteLoadedCopyWithImpl<DailyQuoteLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyQuoteLoaded&&(identical(other.quote, quote) || other.quote == quote));
}


@override
int get hashCode => Object.hash(runtimeType,quote);

@override
String toString() {
  return 'DailyQuoteState.loaded(quote: $quote)';
}


}

/// @nodoc
abstract mixin class $DailyQuoteLoadedCopyWith<$Res> implements $DailyQuoteStateCopyWith<$Res> {
  factory $DailyQuoteLoadedCopyWith(DailyQuoteLoaded value, $Res Function(DailyQuoteLoaded) _then) = _$DailyQuoteLoadedCopyWithImpl;
@useResult
$Res call({
 QuoteModel quote
});


$QuoteModelCopyWith<$Res> get quote;

}
/// @nodoc
class _$DailyQuoteLoadedCopyWithImpl<$Res>
    implements $DailyQuoteLoadedCopyWith<$Res> {
  _$DailyQuoteLoadedCopyWithImpl(this._self, this._then);

  final DailyQuoteLoaded _self;
  final $Res Function(DailyQuoteLoaded) _then;

/// Create a copy of DailyQuoteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? quote = null,}) {
  return _then(DailyQuoteLoaded(
null == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as QuoteModel,
  ));
}

/// Create a copy of DailyQuoteState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuoteModelCopyWith<$Res> get quote {
  
  return $QuoteModelCopyWith<$Res>(_self.quote, (value) {
    return _then(_self.copyWith(quote: value));
  });
}
}

// dart format on
