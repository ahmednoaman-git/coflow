// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_cta_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SessionCtaEntity {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionCtaEntity);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SessionCtaEntity()';
}


}

/// @nodoc
class $SessionCtaEntityCopyWith<$Res>  {
$SessionCtaEntityCopyWith(SessionCtaEntity _, $Res Function(SessionCtaEntity) __);
}


/// Adds pattern-matching-related methods to [SessionCtaEntity].
extension SessionCtaEntityPatterns on SessionCtaEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SessionUnavailableCta value)?  unavailable,TResult Function( SessionContactFacilityCta value)?  contactFacility,TResult Function( SessionReserveCta value)?  reserve,TResult Function( SessionPurchaseTicketsCta value)?  purchaseTickets,TResult Function( SessionJoinWaitlistCta value)?  joinWaitlist,TResult Function( SessionCancelReservationCta value)?  cancelReservation,TResult Function( SessionLeaveWaitlistCta value)?  leaveWaitlist,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SessionUnavailableCta() when unavailable != null:
return unavailable(_that);case SessionContactFacilityCta() when contactFacility != null:
return contactFacility(_that);case SessionReserveCta() when reserve != null:
return reserve(_that);case SessionPurchaseTicketsCta() when purchaseTickets != null:
return purchaseTickets(_that);case SessionJoinWaitlistCta() when joinWaitlist != null:
return joinWaitlist(_that);case SessionCancelReservationCta() when cancelReservation != null:
return cancelReservation(_that);case SessionLeaveWaitlistCta() when leaveWaitlist != null:
return leaveWaitlist(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SessionUnavailableCta value)  unavailable,required TResult Function( SessionContactFacilityCta value)  contactFacility,required TResult Function( SessionReserveCta value)  reserve,required TResult Function( SessionPurchaseTicketsCta value)  purchaseTickets,required TResult Function( SessionJoinWaitlistCta value)  joinWaitlist,required TResult Function( SessionCancelReservationCta value)  cancelReservation,required TResult Function( SessionLeaveWaitlistCta value)  leaveWaitlist,}){
final _that = this;
switch (_that) {
case SessionUnavailableCta():
return unavailable(_that);case SessionContactFacilityCta():
return contactFacility(_that);case SessionReserveCta():
return reserve(_that);case SessionPurchaseTicketsCta():
return purchaseTickets(_that);case SessionJoinWaitlistCta():
return joinWaitlist(_that);case SessionCancelReservationCta():
return cancelReservation(_that);case SessionLeaveWaitlistCta():
return leaveWaitlist(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SessionUnavailableCta value)?  unavailable,TResult? Function( SessionContactFacilityCta value)?  contactFacility,TResult? Function( SessionReserveCta value)?  reserve,TResult? Function( SessionPurchaseTicketsCta value)?  purchaseTickets,TResult? Function( SessionJoinWaitlistCta value)?  joinWaitlist,TResult? Function( SessionCancelReservationCta value)?  cancelReservation,TResult? Function( SessionLeaveWaitlistCta value)?  leaveWaitlist,}){
final _that = this;
switch (_that) {
case SessionUnavailableCta() when unavailable != null:
return unavailable(_that);case SessionContactFacilityCta() when contactFacility != null:
return contactFacility(_that);case SessionReserveCta() when reserve != null:
return reserve(_that);case SessionPurchaseTicketsCta() when purchaseTickets != null:
return purchaseTickets(_that);case SessionJoinWaitlistCta() when joinWaitlist != null:
return joinWaitlist(_that);case SessionCancelReservationCta() when cancelReservation != null:
return cancelReservation(_that);case SessionLeaveWaitlistCta() when leaveWaitlist != null:
return leaveWaitlist(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  unavailable,TResult Function( String facilityName)?  contactFacility,TResult Function( int accessibleTickets)?  reserve,TResult Function( int accessibleTickets)?  purchaseTickets,TResult Function()?  joinWaitlist,TResult Function( bool isEnabled)?  cancelReservation,TResult Function( bool isEnabled)?  leaveWaitlist,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SessionUnavailableCta() when unavailable != null:
return unavailable();case SessionContactFacilityCta() when contactFacility != null:
return contactFacility(_that.facilityName);case SessionReserveCta() when reserve != null:
return reserve(_that.accessibleTickets);case SessionPurchaseTicketsCta() when purchaseTickets != null:
return purchaseTickets(_that.accessibleTickets);case SessionJoinWaitlistCta() when joinWaitlist != null:
return joinWaitlist();case SessionCancelReservationCta() when cancelReservation != null:
return cancelReservation(_that.isEnabled);case SessionLeaveWaitlistCta() when leaveWaitlist != null:
return leaveWaitlist(_that.isEnabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  unavailable,required TResult Function( String facilityName)  contactFacility,required TResult Function( int accessibleTickets)  reserve,required TResult Function( int accessibleTickets)  purchaseTickets,required TResult Function()  joinWaitlist,required TResult Function( bool isEnabled)  cancelReservation,required TResult Function( bool isEnabled)  leaveWaitlist,}) {final _that = this;
switch (_that) {
case SessionUnavailableCta():
return unavailable();case SessionContactFacilityCta():
return contactFacility(_that.facilityName);case SessionReserveCta():
return reserve(_that.accessibleTickets);case SessionPurchaseTicketsCta():
return purchaseTickets(_that.accessibleTickets);case SessionJoinWaitlistCta():
return joinWaitlist();case SessionCancelReservationCta():
return cancelReservation(_that.isEnabled);case SessionLeaveWaitlistCta():
return leaveWaitlist(_that.isEnabled);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  unavailable,TResult? Function( String facilityName)?  contactFacility,TResult? Function( int accessibleTickets)?  reserve,TResult? Function( int accessibleTickets)?  purchaseTickets,TResult? Function()?  joinWaitlist,TResult? Function( bool isEnabled)?  cancelReservation,TResult? Function( bool isEnabled)?  leaveWaitlist,}) {final _that = this;
switch (_that) {
case SessionUnavailableCta() when unavailable != null:
return unavailable();case SessionContactFacilityCta() when contactFacility != null:
return contactFacility(_that.facilityName);case SessionReserveCta() when reserve != null:
return reserve(_that.accessibleTickets);case SessionPurchaseTicketsCta() when purchaseTickets != null:
return purchaseTickets(_that.accessibleTickets);case SessionJoinWaitlistCta() when joinWaitlist != null:
return joinWaitlist();case SessionCancelReservationCta() when cancelReservation != null:
return cancelReservation(_that.isEnabled);case SessionLeaveWaitlistCta() when leaveWaitlist != null:
return leaveWaitlist(_that.isEnabled);case _:
  return null;

}
}

}

/// @nodoc


class SessionUnavailableCta extends SessionCtaEntity {
  const SessionUnavailableCta(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionUnavailableCta);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SessionCtaEntity.unavailable()';
}


}




/// @nodoc


class SessionContactFacilityCta extends SessionCtaEntity {
  const SessionContactFacilityCta({required this.facilityName}): super._();
  

 final  String facilityName;

/// Create a copy of SessionCtaEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionContactFacilityCtaCopyWith<SessionContactFacilityCta> get copyWith => _$SessionContactFacilityCtaCopyWithImpl<SessionContactFacilityCta>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionContactFacilityCta&&(identical(other.facilityName, facilityName) || other.facilityName == facilityName));
}


@override
int get hashCode => Object.hash(runtimeType,facilityName);

@override
String toString() {
  return 'SessionCtaEntity.contactFacility(facilityName: $facilityName)';
}


}

/// @nodoc
abstract mixin class $SessionContactFacilityCtaCopyWith<$Res> implements $SessionCtaEntityCopyWith<$Res> {
  factory $SessionContactFacilityCtaCopyWith(SessionContactFacilityCta value, $Res Function(SessionContactFacilityCta) _then) = _$SessionContactFacilityCtaCopyWithImpl;
@useResult
$Res call({
 String facilityName
});




}
/// @nodoc
class _$SessionContactFacilityCtaCopyWithImpl<$Res>
    implements $SessionContactFacilityCtaCopyWith<$Res> {
  _$SessionContactFacilityCtaCopyWithImpl(this._self, this._then);

  final SessionContactFacilityCta _self;
  final $Res Function(SessionContactFacilityCta) _then;

/// Create a copy of SessionCtaEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? facilityName = null,}) {
  return _then(SessionContactFacilityCta(
facilityName: null == facilityName ? _self.facilityName : facilityName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SessionReserveCta extends SessionCtaEntity {
  const SessionReserveCta({required this.accessibleTickets}): super._();
  

 final  int accessibleTickets;

/// Create a copy of SessionCtaEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionReserveCtaCopyWith<SessionReserveCta> get copyWith => _$SessionReserveCtaCopyWithImpl<SessionReserveCta>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionReserveCta&&(identical(other.accessibleTickets, accessibleTickets) || other.accessibleTickets == accessibleTickets));
}


@override
int get hashCode => Object.hash(runtimeType,accessibleTickets);

@override
String toString() {
  return 'SessionCtaEntity.reserve(accessibleTickets: $accessibleTickets)';
}


}

/// @nodoc
abstract mixin class $SessionReserveCtaCopyWith<$Res> implements $SessionCtaEntityCopyWith<$Res> {
  factory $SessionReserveCtaCopyWith(SessionReserveCta value, $Res Function(SessionReserveCta) _then) = _$SessionReserveCtaCopyWithImpl;
@useResult
$Res call({
 int accessibleTickets
});




}
/// @nodoc
class _$SessionReserveCtaCopyWithImpl<$Res>
    implements $SessionReserveCtaCopyWith<$Res> {
  _$SessionReserveCtaCopyWithImpl(this._self, this._then);

  final SessionReserveCta _self;
  final $Res Function(SessionReserveCta) _then;

/// Create a copy of SessionCtaEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? accessibleTickets = null,}) {
  return _then(SessionReserveCta(
accessibleTickets: null == accessibleTickets ? _self.accessibleTickets : accessibleTickets // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class SessionPurchaseTicketsCta extends SessionCtaEntity {
  const SessionPurchaseTicketsCta({required this.accessibleTickets}): super._();
  

 final  int accessibleTickets;

/// Create a copy of SessionCtaEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionPurchaseTicketsCtaCopyWith<SessionPurchaseTicketsCta> get copyWith => _$SessionPurchaseTicketsCtaCopyWithImpl<SessionPurchaseTicketsCta>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionPurchaseTicketsCta&&(identical(other.accessibleTickets, accessibleTickets) || other.accessibleTickets == accessibleTickets));
}


@override
int get hashCode => Object.hash(runtimeType,accessibleTickets);

@override
String toString() {
  return 'SessionCtaEntity.purchaseTickets(accessibleTickets: $accessibleTickets)';
}


}

/// @nodoc
abstract mixin class $SessionPurchaseTicketsCtaCopyWith<$Res> implements $SessionCtaEntityCopyWith<$Res> {
  factory $SessionPurchaseTicketsCtaCopyWith(SessionPurchaseTicketsCta value, $Res Function(SessionPurchaseTicketsCta) _then) = _$SessionPurchaseTicketsCtaCopyWithImpl;
@useResult
$Res call({
 int accessibleTickets
});




}
/// @nodoc
class _$SessionPurchaseTicketsCtaCopyWithImpl<$Res>
    implements $SessionPurchaseTicketsCtaCopyWith<$Res> {
  _$SessionPurchaseTicketsCtaCopyWithImpl(this._self, this._then);

  final SessionPurchaseTicketsCta _self;
  final $Res Function(SessionPurchaseTicketsCta) _then;

/// Create a copy of SessionCtaEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? accessibleTickets = null,}) {
  return _then(SessionPurchaseTicketsCta(
accessibleTickets: null == accessibleTickets ? _self.accessibleTickets : accessibleTickets // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class SessionJoinWaitlistCta extends SessionCtaEntity {
  const SessionJoinWaitlistCta(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionJoinWaitlistCta);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SessionCtaEntity.joinWaitlist()';
}


}




/// @nodoc


class SessionCancelReservationCta extends SessionCtaEntity {
  const SessionCancelReservationCta({required this.isEnabled}): super._();
  

 final  bool isEnabled;

/// Create a copy of SessionCtaEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionCancelReservationCtaCopyWith<SessionCancelReservationCta> get copyWith => _$SessionCancelReservationCtaCopyWithImpl<SessionCancelReservationCta>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionCancelReservationCta&&(identical(other.isEnabled, isEnabled) || other.isEnabled == isEnabled));
}


@override
int get hashCode => Object.hash(runtimeType,isEnabled);

@override
String toString() {
  return 'SessionCtaEntity.cancelReservation(isEnabled: $isEnabled)';
}


}

/// @nodoc
abstract mixin class $SessionCancelReservationCtaCopyWith<$Res> implements $SessionCtaEntityCopyWith<$Res> {
  factory $SessionCancelReservationCtaCopyWith(SessionCancelReservationCta value, $Res Function(SessionCancelReservationCta) _then) = _$SessionCancelReservationCtaCopyWithImpl;
@useResult
$Res call({
 bool isEnabled
});




}
/// @nodoc
class _$SessionCancelReservationCtaCopyWithImpl<$Res>
    implements $SessionCancelReservationCtaCopyWith<$Res> {
  _$SessionCancelReservationCtaCopyWithImpl(this._self, this._then);

  final SessionCancelReservationCta _self;
  final $Res Function(SessionCancelReservationCta) _then;

/// Create a copy of SessionCtaEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isEnabled = null,}) {
  return _then(SessionCancelReservationCta(
isEnabled: null == isEnabled ? _self.isEnabled : isEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class SessionLeaveWaitlistCta extends SessionCtaEntity {
  const SessionLeaveWaitlistCta({required this.isEnabled}): super._();
  

 final  bool isEnabled;

/// Create a copy of SessionCtaEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionLeaveWaitlistCtaCopyWith<SessionLeaveWaitlistCta> get copyWith => _$SessionLeaveWaitlistCtaCopyWithImpl<SessionLeaveWaitlistCta>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionLeaveWaitlistCta&&(identical(other.isEnabled, isEnabled) || other.isEnabled == isEnabled));
}


@override
int get hashCode => Object.hash(runtimeType,isEnabled);

@override
String toString() {
  return 'SessionCtaEntity.leaveWaitlist(isEnabled: $isEnabled)';
}


}

/// @nodoc
abstract mixin class $SessionLeaveWaitlistCtaCopyWith<$Res> implements $SessionCtaEntityCopyWith<$Res> {
  factory $SessionLeaveWaitlistCtaCopyWith(SessionLeaveWaitlistCta value, $Res Function(SessionLeaveWaitlistCta) _then) = _$SessionLeaveWaitlistCtaCopyWithImpl;
@useResult
$Res call({
 bool isEnabled
});




}
/// @nodoc
class _$SessionLeaveWaitlistCtaCopyWithImpl<$Res>
    implements $SessionLeaveWaitlistCtaCopyWith<$Res> {
  _$SessionLeaveWaitlistCtaCopyWithImpl(this._self, this._then);

  final SessionLeaveWaitlistCta _self;
  final $Res Function(SessionLeaveWaitlistCta) _then;

/// Create a copy of SessionCtaEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isEnabled = null,}) {
  return _then(SessionLeaveWaitlistCta(
isEnabled: null == isEnabled ? _self.isEnabled : isEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
