// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_respons.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PetResponse _$PetResponseFromJson(Map<String, dynamic> json) => PetResponse(
      name: json['name'] as String,
      animalTypeId: json['animal_type_id'] as int,
      petTypeId: json['pet_type_id'] as int,
      breedOneId: json['breed_1_id'] as int,
      breedTwoId: json['breed_2_id'] as int,
      gender: json['gender'] as String?,
      profilePictureUrl: json['profile_picture_url'] as String,
      bio: json['bio'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      isActive: json['is_active'] as bool,
      id: json['id'] as int,
      userId: json['user_id'] as int,
    );

Map<String, dynamic> _$PetResponseToJson(PetResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'animal_type_id': instance.animalTypeId,
      'pet_type_id': instance.petTypeId,
      'breed_1_id': instance.breedOneId,
      'breed_2_id': instance.breedTwoId,
      'gender': instance.gender,
      'profile_picture_url': instance.profilePictureUrl,
      'bio': instance.bio,
      'date_of_birth': instance.dateOfBirth,
      'is_active': instance.isActive,
      'id': instance.id,
      'user_id': instance.userId,
    };
