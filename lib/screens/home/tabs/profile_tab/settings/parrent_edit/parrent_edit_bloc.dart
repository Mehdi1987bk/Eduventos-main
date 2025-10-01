import 'dart:convert';
import 'dart:io';
import 'package:rxdart/rxdart.dart';
import '../../../../../../data/network/request/update_user_data_request.dart';
import '../../../../../../data/network/response/user.dart';
import '../../../../../../domain/repositories/auth_repository.dart';
import '../../../../../../main.dart';
import '../../../../../../presentation/bloc/base_bloc.dart';

class ParrentEditBloc extends BaseBloc {
  final AuthRepository _authRepository = sl.get<AuthRepository>();

  final PublishSubject<File> userAvatar = PublishSubject();
  final User user;

  late String code;
  String dialCode = '55';

  File? images;
  String? imageUrl;


  ParrentEditBloc(this.user) {
    imageUrl = user.image;
  }

  Future<void> getUserDetails() => _authRepository.getUserDetails();

  Future<void> updateUserData({
    required String name,
    required String password,
    required String phone,
    required String sername,
  }) {
    return _authRepository.updateUserData(
      UpdateUserDataRequest(
        name: name,
        surname: sername,
        password: password,
        isParent: "1",
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
