// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quotes_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QuotesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuotesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'QuotesEvent()';
}


}

/// @nodoc
class $QuotesEventCopyWith<$Res>  {
$QuotesEventCopyWith(QuotesEvent _, $Res Function(QuotesEvent) __);
}


/// Adds pattern-matching-related methods to [QuotesEvent].
extension QuotesEventPatterns on QuotesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FetchQuotes value)?  fetch,TResult Function( ChangeCategory value)?  changeCategory,TResult Function( SearchQuotes value)?  search,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FetchQuotes() when fetch != null:
return fetch(_that);case ChangeCategory() when changeCategory != null:
return changeCategory(_that);case SearchQuotes() when search != null:
return search(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FetchQuotes value)  fetch,required TResult Function( ChangeCategory value)  changeCategory,required TResult Function( SearchQuotes value)  search,}){
final _that = this;
switch (_that) {
case FetchQuotes():
return fetch(_that);case ChangeCategory():
return changeCategory(_that);case SearchQuotes():
return search(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FetchQuotes value)?  fetch,TResult? Function( ChangeCategory value)?  changeCategory,TResult? Function( SearchQuotes value)?  search,}){
final _that = this;
switch (_that) {
case FetchQuotes() when fetch != null:
return fetch(_that);case ChangeCategory() when changeCategory != null:
return changeCategory(_that);case SearchQuotes() when search != null:
return search(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( bool? refresh)?  fetch,TResult Function( String? category)?  changeCategory,TResult Function( String? keyword,  String? author)?  search,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FetchQuotes() when fetch != null:
return fetch(_that.refresh);case ChangeCategory() when changeCategory != null:
return changeCategory(_that.category);case SearchQuotes() when search != null:
return search(_that.keyword,_that.author);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( bool? refresh)  fetch,required TResult Function( String? category)  changeCategory,required TResult Function( String? keyword,  String? author)  search,}) {final _that = this;
switch (_that) {
case FetchQuotes():
return fetch(_that.refresh);case ChangeCategory():
return changeCategory(_that.category);case SearchQuotes():
return search(_that.keyword,_that.author);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( bool? refresh)?  fetch,TResult? Function( String? category)?  changeCategory,TResult? Function( String? keyword,  String? author)?  search,}) {final _that = this;
switch (_that) {
case FetchQuotes() when fetch != null:
return fetch(_that.refresh);case ChangeCategory() when changeCategory != null:
return changeCategory(_that.category);case SearchQuotes() when search != null:
return search(_that.keyword,_that.author);case _:
  return null;

}
}

}

/// @nodoc


class FetchQuotes implements QuotesEvent {
  const FetchQuotes({this.refresh});
  

 final  bool? refresh;

/// Create a copy of QuotesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FetchQuotesCopyWith<FetchQuotes> get copyWith => _$FetchQuotesCopyWithImpl<FetchQuotes>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchQuotes&&(identical(other.refresh, refresh) || other.refresh == refresh));
}


@override
int get hashCode => Object.hash(runtimeType,refresh);

@override
String toString() {
  return 'QuotesEvent.fetch(refresh: $refresh)';
}


}

/// @nodoc
abstract mixin class $FetchQuotesCopyWith<$Res> implements $QuotesEventCopyWith<$Res> {
  factory $FetchQuotesCopyWith(FetchQuotes value, $Res Function(FetchQuotes) _then) = _$FetchQuotesCopyWithImpl;
@useResult
$Res call({
 bool? refresh
});




}
/// @nodoc
class _$FetchQuotesCopyWithImpl<$Res>
    implements $FetchQuotesCopyWith<$Res> {
  _$FetchQuotesCopyWithImpl(this._self, this._then);

  final FetchQuotes _self;
  final $Res Function(FetchQuotes) _then;

/// Create a copy of QuotesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? refresh = freezed,}) {
  return _then(FetchQuotes(
refresh: freezed == refresh ? _self.refresh : refresh // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

/// @nodoc


class ChangeCategory implements QuotesEvent {
  const ChangeCategory(this.category);
  

 final  String? category;

/// Create a copy of QuotesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeCategoryCopyWith<ChangeCategory> get copyWith => _$ChangeCategoryCopyWithImpl<ChangeCategory>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeCategory&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,category);

@override
String toString() {
  return 'QuotesEvent.changeCategory(category: $category)';
}


}

/// @nodoc
abstract mixin class $ChangeCategoryCopyWith<$Res> implements $QuotesEventCopyWith<$Res> {
  factory $ChangeCategoryCopyWith(ChangeCategory value, $Res Function(ChangeCategory) _then) = _$ChangeCategoryCopyWithImpl;
@useResult
$Res call({
 String? category
});




}
/// @nodoc
class _$ChangeCategoryCopyWithImpl<$Res>
    implements $ChangeCategoryCopyWith<$Res> {
  _$ChangeCategoryCopyWithImpl(this._self, this._then);

  final ChangeCategory _self;
  final $Res Function(ChangeCategory) _then;

/// Create a copy of QuotesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = freezed,}) {
  return _then(ChangeCategory(
freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class SearchQuotes implements QuotesEvent {
  const SearchQuotes({this.keyword, this.author});
  

 final  String? keyword;
 final  String? author;

/// Create a copy of QuotesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchQuotesCopyWith<SearchQuotes> get copyWith => _$SearchQuotesCopyWithImpl<SearchQuotes>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchQuotes&&(identical(other.keyword, keyword) || other.keyword == keyword)&&(identical(other.author, author) || other.author == author));
}


@override
int get hashCode => Object.hash(runtimeType,keyword,author);

@override
String toString() {
  return 'QuotesEvent.search(keyword: $keyword, author: $author)';
}


}

/// @nodoc
abstract mixin class $SearchQuotesCopyWith<$Res> implements $QuotesEventCopyWith<$Res> {
  factory $SearchQuotesCopyWith(SearchQuotes value, $Res Function(SearchQuotes) _then) = _$SearchQuotesCopyWithImpl;
@useResult
$Res call({
 String? keyword, String? author
});




}
/// @nodoc
class _$SearchQuotesCopyWithImpl<$Res>
    implements $SearchQuotesCopyWith<$Res> {
  _$SearchQuotesCopyWithImpl(this._self, this._then);

  final SearchQuotes _self;
  final $Res Function(SearchQuotes) _then;

/// Create a copy of QuotesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? keyword = freezed,Object? author = freezed,}) {
  return _then(SearchQuotes(
keyword: freezed == keyword ? _self.keyword : keyword // ignore: cast_nullable_to_non_nullable
as String?,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
