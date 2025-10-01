import 'package:json_annotation/json_annotation.dart';

part 'pet_respons.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PetResponse {
  final String name;
  final int animalTypeId;
  final int petTypeId;
  @JsonKey(name: "breed_1_id")
  final int breedOneId;
  @JsonKey(name: "breed_2_id")
  final int breedTwoId;
  final String? gender;
  final String profilePictureUrl;
  final String? bio;
  final String? dateOfBirth;
  final bool isActive;
  final int id;
  final int userId;
  // final User user;

  PetResponse({
    required this.name,
    required this.animalTypeId,
    required this.petTypeId,
    required this.breedOneId,
    required this.breedTwoId,
    required this.gender,
    required this.profilePictureUrl,
    required this.bio,
    required this.dateOfBirth,
    required this.isActive,
    required this.id,
    required this.userId,
    // required this.user,
  });

  factory PetResponse.fromJson(Map<String, dynamic> json) => _$PetResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PetResponseToJson(this);
}

