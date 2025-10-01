import 'dart:io';
import 'package:rxdart/rxdart.dart';
import '../../../../../../data/network/request/update_user_data_request.dart';
import '../../../../../../data/network/response/groups_list.dart';
import '../../../../../../data/network/response/type_option.dart';
import '../../../../../../data/network/response/user.dart';
import '../../../../../../domain/repositories/auth_repository.dart';
import '../../../../../../main.dart';
import '../../../../../../presentation/bloc/base_bloc.dart';

class StudentEditBloc extends BaseBloc {
  final AuthRepository _authRepository = sl.get<AuthRepository>();
  final User user;

  final PublishSubject<File> userAvatar = PublishSubject();
  String dialCode = '55';

  late String code;
  File? images;
  String? imageUrl;


  StudentEditBloc(this.user) {
    imageUrl = user.image;
  }

  Future<void> getUserDetails() => _authRepository.getUserDetails();

  late final Future<List<TypeOption>> getLanguages = _authRepository.getLanguages();

  late final Future<List<TypeOption>> getClasses = _authRepository.getClasses();

  late final Future<List<TypeOption>> getRegions = _authRepository.getRegions();

  late final Future<GroupsList> getGroups = _authRepository.getGroups();

  Future<void> updateUserData({
    required String name,
    required String password,
    required String phone,
    required String sername,
    required String father,
    required String langId,
    required String regionId,
    required String groupId,
    required String studentClassId,
  }) {
    return _authRepository.updateUserData(
      UpdateUserDataRequest(
        name: name,
        surname: sername,
        password: password,
        isParent: "0",
        fatherName: father,
        langId: langId,
        regionId: regionId,
        studentClassId: studentClassId,
        groupId:groupId,

      ),
    );
  }


  Future<void> onImageSelected(File file) {
    imageUrl = null;
    images = file;
    userAvatar.add(file);
    return _authRepository.uploadImage(file);
  }

}
