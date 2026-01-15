// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'collection_detail_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CollectionDetailEvent {

 String? get collectionId;
/// Create a copy of CollectionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CollectionDetailEventCopyWith<CollectionDetailEvent> get copyWith => _$CollectionDetailEventCopyWithImpl<CollectionDetailEvent>(this as CollectionDetailEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CollectionDetailEvent&&(identical(other.collectionId, collectionId) || other.collectionId == collectionId));
}


@override
int get hashCode => Object.hash(runtimeType,collectionId);

@override
String toString() {
  return 'CollectionDetailEvent(collectionId: $collectionId)';
}


}

/// @nodoc
abstract mixin class $CollectionDetailEventCopyWith<$Res>  {
  factory $CollectionDetailEventCopyWith(CollectionDetailEvent value, $Res Function(CollectionDetailEvent) _then) = _$CollectionDetailEventCopyWithImpl;
@useResult
$Res call({
 String collectionId
});




}
/// @nodoc
class _$CollectionDetailEventCopyWithImpl<$Res>
    implements $CollectionDetailEventCopyWith<$Res> {
  _$CollectionDetailEventCopyWithImpl(this._self, this._then);

  final CollectionDetailEvent _self;
  final $Res Function(CollectionDetailEvent) _then;

/// Create a copy of CollectionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? collectionId = null,}) {
  return _then(_self.copyWith(
collectionId: null == collectionId ? _self.collectionId! : collectionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CollectionDetailEvent].
extension CollectionDetailEventPatterns on CollectionDetailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadCollectionQuotes value)?  load,TResult Function( RemoveQuoteFromCollection value)?  removeQuote,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadCollectionQuotes() when load != null:
return load(_that);case RemoveQuoteFromCollection() when removeQuote != null:
return removeQuote(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadCollectionQuotes value)  load,required TResult Function( RemoveQuoteFromCollection value)  removeQuote,}){
final _that = this;
switch (_that) {
case LoadCollectionQuotes():
return load(_that);case RemoveQuoteFromCollection():
return removeQuote(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadCollectionQuotes value)?  load,TResult? Function( RemoveQuoteFromCollection value)?  removeQuote,}){
final _that = this;
switch (_that) {
case LoadCollectionQuotes() when load != null:
return load(_that);case RemoveQuoteFromCollection() when removeQuote != null:
return removeQuote(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? collectionId)?  load,TResult Function( String collectionId,  QuoteModel quote)?  removeQuote,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadCollectionQuotes() when load != null:
return load(_that.collectionId);case RemoveQuoteFromCollection() when removeQuote != null:
return removeQuote(_that.collectionId,_that.quote);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? collectionId)  load,required TResult Function( String collectionId,  QuoteModel quote)  removeQuote,}) {final _that = this;
switch (_that) {
case LoadCollectionQuotes():
return load(_that.collectionId);case RemoveQuoteFromCollection():
return removeQuote(_that.collectionId,_that.quote);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? collectionId)?  load,TResult? Function( String collectionId,  QuoteModel quote)?  removeQuote,}) {final _that = this;
switch (_that) {
case LoadCollectionQuotes() when load != null:
return load(_that.collectionId);case RemoveQuoteFromCollection() when removeQuote != null:
return removeQuote(_that.collectionId,_that.quote);case _:
  return null;

}
}

}

/// @nodoc


class LoadCollectionQuotes implements CollectionDetailEvent {
  const LoadCollectionQuotes(this.collectionId);
  

@override final  String? collectionId;

/// Create a copy of CollectionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadCollectionQuotesCopyWith<LoadCollectionQuotes> get copyWith => _$LoadCollectionQuotesCopyWithImpl<LoadCollectionQuotes>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadCollectionQuotes&&(identical(other.collectionId, collectionId) || other.collectionId == collectionId));
}


@override
int get hashCode => Object.hash(runtimeType,collectionId);

@override
String toString() {
  return 'CollectionDetailEvent.load(collectionId: $collectionId)';
}


}

/// @nodoc
abstract mixin class $LoadCollectionQuotesCopyWith<$Res> implements $CollectionDetailEventCopyWith<$Res> {
  factory $LoadCollectionQuotesCopyWith(LoadCollectionQuotes value, $Res Function(LoadCollectionQuotes) _then) = _$LoadCollectionQuotesCopyWithImpl;
@override @useResult
$Res call({
 String? collectionId
});




}
/// @nodoc
class _$LoadCollectionQuotesCopyWithImpl<$Res>
    implements $LoadCollectionQuotesCopyWith<$Res> {
  _$LoadCollectionQuotesCopyWithImpl(this._self, this._then);

  final LoadCollectionQuotes _self;
  final $Res Function(LoadCollectionQuotes) _then;

/// Create a copy of CollectionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? collectionId = freezed,}) {
  return _then(LoadCollectionQuotes(
freezed == collectionId ? _self.collectionId : collectionId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class RemoveQuoteFromCollection implements CollectionDetailEvent {
  const RemoveQuoteFromCollection({required this.collectionId, required this.quote});
  

@override final  String collectionId;
 final  QuoteModel quote;

/// Create a copy of CollectionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoveQuoteFromCollectionCopyWith<RemoveQuoteFromCollection> get copyWith => _$RemoveQuoteFromCollectionCopyWithImpl<RemoveQuoteFromCollection>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoveQuoteFromCollection&&(identical(other.collectionId, collectionId) || other.collectionId == collectionId)&&(identical(other.quote, quote) || other.quote == quote));
}


@override
int get hashCode => Object.hash(runtimeType,collectionId,quote);

@override
String toString() {
  return 'CollectionDetailEvent.removeQuote(collectionId: $collectionId, quote: $quote)';
}


}

/// @nodoc
abstract mixin class $RemoveQuoteFromCollectionCopyWith<$Res> implements $CollectionDetailEventCopyWith<$Res> {
  factory $RemoveQuoteFromCollectionCopyWith(RemoveQuoteFromCollection value, $Res Function(RemoveQuoteFromCollection) _then) = _$RemoveQuoteFromCollectionCopyWithImpl;
@override @useResult
$Res call({
 String collectionId, QuoteModel quote
});


$QuoteModelCopyWith<$Res> get quote;

}
/// @nodoc
class _$RemoveQuoteFromCollectionCopyWithImpl<$Res>
    implements $RemoveQuoteFromCollectionCopyWith<$Res> {
  _$RemoveQuoteFromCollectionCopyWithImpl(this._self, this._then);

  final RemoveQuoteFromCollection _self;
  final $Res Function(RemoveQuoteFromCollection) _then;

/// Create a copy of CollectionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? collectionId = null,Object? quote = null,}) {
  return _then(RemoveQuoteFromCollection(
collectionId: null == collectionId ? _self.collectionId : collectionId // ignore: cast_nullable_to_non_nullable
as String,quote: null == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as QuoteModel,
  ));
}

/// Create a copy of CollectionDetailEvent
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
