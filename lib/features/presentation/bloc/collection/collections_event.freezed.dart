// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'collections_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CollectionsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CollectionsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CollectionsEvent()';
}


}

/// @nodoc
class $CollectionsEventCopyWith<$Res>  {
$CollectionsEventCopyWith(CollectionsEvent _, $Res Function(CollectionsEvent) __);
}


/// Adds pattern-matching-related methods to [CollectionsEvent].
extension CollectionsEventPatterns on CollectionsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadCollections value)?  load,TResult Function( CreateCollection value)?  create,TResult Function( AddQuoteToCollection value)?  addQuote,TResult Function( RemoveQuoteFromCollection value)?  removeQuote,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadCollections() when load != null:
return load(_that);case CreateCollection() when create != null:
return create(_that);case AddQuoteToCollection() when addQuote != null:
return addQuote(_that);case RemoveQuoteFromCollection() when removeQuote != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadCollections value)  load,required TResult Function( CreateCollection value)  create,required TResult Function( AddQuoteToCollection value)  addQuote,required TResult Function( RemoveQuoteFromCollection value)  removeQuote,}){
final _that = this;
switch (_that) {
case LoadCollections():
return load(_that);case CreateCollection():
return create(_that);case AddQuoteToCollection():
return addQuote(_that);case RemoveQuoteFromCollection():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadCollections value)?  load,TResult? Function( CreateCollection value)?  create,TResult? Function( AddQuoteToCollection value)?  addQuote,TResult? Function( RemoveQuoteFromCollection value)?  removeQuote,}){
final _that = this;
switch (_that) {
case LoadCollections() when load != null:
return load(_that);case CreateCollection() when create != null:
return create(_that);case AddQuoteToCollection() when addQuote != null:
return addQuote(_that);case RemoveQuoteFromCollection() when removeQuote != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,TResult Function( String name)?  create,TResult Function( String collectionId,  QuoteModel quote)?  addQuote,TResult Function( String collectionId,  QuoteModel quote)?  removeQuote,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadCollections() when load != null:
return load();case CreateCollection() when create != null:
return create(_that.name);case AddQuoteToCollection() when addQuote != null:
return addQuote(_that.collectionId,_that.quote);case RemoveQuoteFromCollection() when removeQuote != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,required TResult Function( String name)  create,required TResult Function( String collectionId,  QuoteModel quote)  addQuote,required TResult Function( String collectionId,  QuoteModel quote)  removeQuote,}) {final _that = this;
switch (_that) {
case LoadCollections():
return load();case CreateCollection():
return create(_that.name);case AddQuoteToCollection():
return addQuote(_that.collectionId,_that.quote);case RemoveQuoteFromCollection():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,TResult? Function( String name)?  create,TResult? Function( String collectionId,  QuoteModel quote)?  addQuote,TResult? Function( String collectionId,  QuoteModel quote)?  removeQuote,}) {final _that = this;
switch (_that) {
case LoadCollections() when load != null:
return load();case CreateCollection() when create != null:
return create(_that.name);case AddQuoteToCollection() when addQuote != null:
return addQuote(_that.collectionId,_that.quote);case RemoveQuoteFromCollection() when removeQuote != null:
return removeQuote(_that.collectionId,_that.quote);case _:
  return null;

}
}

}

/// @nodoc


class LoadCollections implements CollectionsEvent {
  const LoadCollections();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadCollections);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CollectionsEvent.load()';
}


}




/// @nodoc


class CreateCollection implements CollectionsEvent {
  const CreateCollection(this.name);
  

 final  String name;

/// Create a copy of CollectionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateCollectionCopyWith<CreateCollection> get copyWith => _$CreateCollectionCopyWithImpl<CreateCollection>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateCollection&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'CollectionsEvent.create(name: $name)';
}


}

/// @nodoc
abstract mixin class $CreateCollectionCopyWith<$Res> implements $CollectionsEventCopyWith<$Res> {
  factory $CreateCollectionCopyWith(CreateCollection value, $Res Function(CreateCollection) _then) = _$CreateCollectionCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class _$CreateCollectionCopyWithImpl<$Res>
    implements $CreateCollectionCopyWith<$Res> {
  _$CreateCollectionCopyWithImpl(this._self, this._then);

  final CreateCollection _self;
  final $Res Function(CreateCollection) _then;

/// Create a copy of CollectionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(CreateCollection(
null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AddQuoteToCollection implements CollectionsEvent {
  const AddQuoteToCollection({required this.collectionId, required this.quote});
  

 final  String collectionId;
 final  QuoteModel quote;

/// Create a copy of CollectionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddQuoteToCollectionCopyWith<AddQuoteToCollection> get copyWith => _$AddQuoteToCollectionCopyWithImpl<AddQuoteToCollection>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddQuoteToCollection&&(identical(other.collectionId, collectionId) || other.collectionId == collectionId)&&(identical(other.quote, quote) || other.quote == quote));
}


@override
int get hashCode => Object.hash(runtimeType,collectionId,quote);

@override
String toString() {
  return 'CollectionsEvent.addQuote(collectionId: $collectionId, quote: $quote)';
}


}

/// @nodoc
abstract mixin class $AddQuoteToCollectionCopyWith<$Res> implements $CollectionsEventCopyWith<$Res> {
  factory $AddQuoteToCollectionCopyWith(AddQuoteToCollection value, $Res Function(AddQuoteToCollection) _then) = _$AddQuoteToCollectionCopyWithImpl;
@useResult
$Res call({
 String collectionId, QuoteModel quote
});


$QuoteModelCopyWith<$Res> get quote;

}
/// @nodoc
class _$AddQuoteToCollectionCopyWithImpl<$Res>
    implements $AddQuoteToCollectionCopyWith<$Res> {
  _$AddQuoteToCollectionCopyWithImpl(this._self, this._then);

  final AddQuoteToCollection _self;
  final $Res Function(AddQuoteToCollection) _then;

/// Create a copy of CollectionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? collectionId = null,Object? quote = null,}) {
  return _then(AddQuoteToCollection(
collectionId: null == collectionId ? _self.collectionId : collectionId // ignore: cast_nullable_to_non_nullable
as String,quote: null == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as QuoteModel,
  ));
}

/// Create a copy of CollectionsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuoteModelCopyWith<$Res> get quote {
  
  return $QuoteModelCopyWith<$Res>(_self.quote, (value) {
    return _then(_self.copyWith(quote: value));
  });
}
}

/// @nodoc


class RemoveQuoteFromCollection implements CollectionsEvent {
  const RemoveQuoteFromCollection({required this.collectionId, required this.quote});
  

 final  String collectionId;
 final  QuoteModel quote;

/// Create a copy of CollectionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
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
  return 'CollectionsEvent.removeQuote(collectionId: $collectionId, quote: $quote)';
}


}

/// @nodoc
abstract mixin class $RemoveQuoteFromCollectionCopyWith<$Res> implements $CollectionsEventCopyWith<$Res> {
  factory $RemoveQuoteFromCollectionCopyWith(RemoveQuoteFromCollection value, $Res Function(RemoveQuoteFromCollection) _then) = _$RemoveQuoteFromCollectionCopyWithImpl;
@useResult
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

/// Create a copy of CollectionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? collectionId = null,Object? quote = null,}) {
  return _then(RemoveQuoteFromCollection(
collectionId: null == collectionId ? _self.collectionId : collectionId // ignore: cast_nullable_to_non_nullable
as String,quote: null == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as QuoteModel,
  ));
}

/// Create a copy of CollectionsEvent
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
