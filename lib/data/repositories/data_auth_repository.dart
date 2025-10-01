import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

import '../../domain/entities/pagination.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../main.dart';
import '../cache/cache_manager.dart';
import '../network/api/auth_api.dart';
import '../network/request/add_product_request.dart';
import '../network/request/approve_notify_request.dart';
import '../network/request/chatbot_request.dart';
import '../network/request/delete_order_request.dart';
import '../network/request/exam.dart';
import '../network/request/exam_id_reqister.dart';
import '../network/request/exam_reqister.dart';
import '../network/request/exam_response.dart';
import '../network/request/firebase_notif.dart';
import '../network/request/forgot_password.dart';
import '../network/request/forgot_password_request.dart';
import '../network/request/login_request.dart';
import '../network/request/payments_initiate_request.dart';
import '../network/request/purchases_request.dart';
import '../network/request/question_result.dart';
import '../network/request/raiting_request.dart';
import '../network/request/register_student_request.dart';
import '../network/request/registration_request.dart';
import '../network/request/reyting_exam_request.dart';
import '../network/request/send_order_request.dart';
import '../network/request/statistics_request.dart';
import '../network/request/subjects_request.dart';
import '../network/request/update_password_request.dart';
import '../network/request/update_user_data_request.dart';
import '../network/response/ai_generate_response.dart';
import '../network/response/all_request_data.dart';
import '../network/response/banners_response.dart';
import '../network/response/chatbot_response.dart';
import '../network/response/get_basekt_data.dart';
import '../network/response/get_notifications.dart';
import '../network/response/get_notifications_pagination.dart';
import '../network/response/get_otp_code.dart';
import '../network/response/get_posts_response.dart';
import '../network/response/get_posts_response_list.dart';
import '../network/response/get_posts_response_list_pagination.dart';
import '../network/response/get_user_response.dart';
import '../network/response/groups_list.dart';
import '../network/response/instructions_data.dart';
import '../network/response/language_list_response.dart';
import '../network/response/login_response.dart';
import '../network/response/menu_list_response.dart';
import '../network/response/order_details_data.dart';
import '../network/response/packages_response.dart';
import '../network/response/packets_response_list.dart';
import '../network/response/payments_initiate_response.dart';
import '../network/response/pet_respons.dart';
import '../network/response/product.dart';
import '../network/response/product_category.dart';
import '../network/response/purchases_response.dart';
import '../network/response/question.dart';
import '../network/response/question_result_response.dart';
import '../network/response/raiting_list.dart';
import '../network/response/result_details_answers.dart';
import '../network/response/results_rata.dart';
import '../network/response/reyting_exam_response.dart';
import '../network/response/send_otp_reqister.dart';
import '../network/response/send_otp_response.dart';
import '../network/response/settings_response.dart';
import '../network/response/statistics_response.dart';
import '../network/response/statistics_response_data.dart';
import '../network/request/subs_pay_request.dart';
import '../network/response/subs_pay_status.dart';
import '../network/response/type_option.dart';
import '../network/response/user.dart';
import '../network/response/vacancies_data.dart';
import '../network/response/video_result_response.dart';

const tokenRefreshTimeOut = 60 * 60 * 1000;

class DataAuthRepository implements AuthRepository {
  final AuthApi _authApi = sl.get<AuthApi>();
  final CacheManager _cacheManager = sl.get<CacheManager>();

  @override
  Future<void> login(LoginRequest request) async {
    final response = await _authApi.login(request);
    if (response != null) {
      await _cacheManager.saveUser(response.user);
      if (response.user.isParent == 1 && response.user.children?.isNotEmpty == true) {
        await _cacheManager.saveType(response.user.children?.first.id ?? 0);
      }
    }
    return _cacheManager.saveAccessToken(response.token);
  }

  @override
  Future<GetUserResponse> getUserDetails() async {
    final response = await _authApi.getUserDetails();
    if (response != null) {
      await _cacheManager.saveUser(response.user);
    }
    if (response.user.isParent == 1 && response.user.children?.isNotEmpty == true) {
      await _cacheManager.saveType(response.user.children?.first.id ?? 0);
    }
    return response;
  }

  @override
  Stream<int> get userType => _cacheManager.type.whereNotNull().asBroadcastStream();

  @override
  int getUserType() => _cacheManager.getUserType() ?? 1;

  @override
  Future<void> checkOtpRegister(RegistrationRequest request) async {
    final response = await _authApi.checkOtpRegister(request);
    if (response != null) {
      await _cacheManager.saveUser(response.user);
    }
    return _cacheManager.saveAccessToken(response.token);
  }

  @override
  Future<void> checkOtpRStudentegister(RegistrationStudentRequest request) async {
    final response = await _authApi.checkOtpRStudentegister(request);
    if (response != null) {
      await _cacheManager.saveUser(response.user);
    }
    return _cacheManager.saveAccessToken(response.token);
  }

  @override
  Future<void> checkOtpAddStudent(RegistrationStudentRequest request) {
    return _authApi.checkOtpRStudentegister(request);
  }

  @override
  Stream<User> get userDetails => _cacheManager.userDetails.whereNotNull().asBroadcastStream();

  @override
  Future<bool> isLogged() async {
    var token = await _cacheManager.getAccessToken();
    return token != null && token.isNotEmpty;
  }

  @override
  Future<bool> gaveUserId(int id) async {
    await _cacheManager.saveType(id);
    return true;
  }

  @override
  Future<GetPostsResponseList> getPosts(String id) {
    return _authApi.getPosts(id);
  }

  @override
  Future<Pagination<GetPostsResponse>> getPostsPagination(int page, int menuId) async {
    final response = await _authApi.getPostsPagination(page, "10", menuId);
    return response.list;
  }

  @override
  Future<Pagination<GetNotifications>> getNotifications(int page, int isParent) async {
    final response = await _authApi.getNotifications(page, "10", isParent);
    return response.notification;
  }

  @override
  Future<PacketsResponseList> getPackets() {
    return _authApi.getPackets();
  }

  @override
  Future<SubsPayStatus> subsPay(SubsPayRequest request) {
    return _authApi.subsPay(request);
  }

  @override
  Future<GetOtpCode> sendOtpRegister(SendOtpReqister request) {
    return _authApi.sendOtp(request);
  }

  @override
  Future<Pagination<Exam>> exam(int page, ExamReqister request) async {
    final response = await _authApi.exam(page, request);
    return response.list;
  }

  @override
  Future<List<TypeOption>> reytingExam() async {
    final response = await _authApi.reytingExam(ReytingExamRequest(type: 'competition'));
    return response.list;
  }

  @override
  Future<List<TypeOption>> getCategory() {
    return _authApi.getCategory();
  }

  @override
  Future<List<TypeOption>> getPetTypes(int id) {
    return _authApi.getPetTypes(id);
  }

  @override
  Future<List<TypeOption>> getBreeds(int id) {
    return _authApi.getBreeds(id);
  }

  @override
  Future<List<PetResponse>> getPertsFromBreedId(int id) {
    return _authApi.getPertsFromBreedId(id);
  }

  @override
  Future<void> sendOtpPassword(SendOtpReqister request) {
    return _authApi.sendOtpPassword(request);
  }

  @override
  Future<List<ProductCategory>> productCategory() {
    return _authApi.productCategory();
  }

  @override
  Future<VacanciesData> getVacancies() {
    return _authApi.getVacancies();
  }

  @override
  Future<Pagination<Product>> getProducts(int page, int? category, String? search) {
    return _authApi.getProducts(page, category, search);
  }

  @override
  Future<List<GetBasektData>> getBasketProducts() async {
    final response = await _authApi.getBasketProducts();
    return response.data;
  }

  @override
  Future<List<Question>> questions(ExamIdReqister request) async {
    final response = await _authApi.questions(request);
    return response.list.questions;
  }

  @override
  Future<void> addProduct(AddProductRequest request) {
    return _authApi.addProduct(request);
  }

  @override
  Future<List<TypeOption>> getLanguages() async {
    final response = await _authApi.getLanguages();
    return response.list;
  }

  @override
  Future<List<TypeOption>> getClasses() async {
    final response = await _authApi.getClasses();
    return response.list;
  }

  @override
  Future<List<TypeOption>> getRegions() async {
    final response = await _authApi.getRegions();
    return response.list;
  }

  @override
  Future<List<TypeOption>> getSubjects(SubjectsRequest request) async {
    final response = await _authApi.getSubjects(request);
    return response.list;
  }

  @override
  Future<User?> searchStudent(String code) async {
    final response = await _authApi.searchStudent(code);
    return response.student;
  }

  @override
  Future<void> sendOrder(SendOrderRequest request) {
    return _authApi.sendOrder(request);
  }

  @override
  Future<AiGenerateResponse> aiGenerateResponse(int resultId) {
    return _authApi.aiGenerateResponse(resultId);
  }

  @override
  Future<QuestionResultResponse> sendQuestionResult(QuestionResult request) {
    return _authApi.sendQuestionResult(request);
  }

  @override
  Future<OrderDetailsData> orderDetails() {
    return _authApi.orderDetails();
  }

  @override
  Future<GroupsList> getGroups() {
    return _authApi.getGroups();
  }

  @override
  Future<void> deleteOrder(DeleteOrderRequest request) {
    return _authApi.deleteOrder(request);
  }

  @override
  Future<void> selectStudentForParent(int id) {
    return _authApi.selectStudentForParent(id);
  }

  @override
  Future<void> sendRegistration(int number, int otpCode) async {
    final response = await _authApi.sendRegistration(number, otpCode);
    // if (response != null) {
    //   await _cacheManager.saveUser(response.user);
    // }
    return _cacheManager.saveAccessToken(response.token);
  }

  @override
  Future<void> sendOtpLogin(String number, String otpCode) async {
    final response = await _authApi.sendOtpLogin(
      ForgotPassword(
        phoneNumber: number,
        otpCode: otpCode,
      ),
    );
    // if (response != null) {
    //   await _cacheManager.saveUser(response.user);
    // }
    return _cacheManager.saveAccessToken(response.token);
  }

  @override
  Future<void> registration(RegistrationRequest request) {
    return _authApi.registration(request);
  }

  @override
  Future<void> updateUserData(UpdateUserDataRequest request) {
    return _authApi.updateUserData(request);
  }

  @override
  Future<SettingsResponse> settings() {
    return _authApi.settings();
  }

  @override
  Future<InstructionsData> instructions() {
    return _authApi.instructions();
  }

  @override
  Future<void> approveNotify(ApproveNotifyRequest request) {
    return _authApi.approveNotify(request);
  }

  @override
  Future<void> updatePassword(UpdatePasswordRequest request) {
    return _authApi.updatePassword(request);
  }

  @override
  Future<BannersResponse> getSlides() {
    return _authApi.getSlides();
  }

  @override
  Stream<VideoResultResponse> getVideo(int isGroup) {
    return _authApi.getVideo(isGroup).handleError((error, stackTrace) {
      // Здесь можно залогировать ошибку
      debugPrint('API error in getVideo: $error');
      debugPrint('StackTrace: $stackTrace');

      // Если нужно пробросить ошибку дальше
      throw error;
    });
  }


  @override
  Future<RaitingList> getRaiting(RaitingRequest request) {
    return _authApi.getRaiting(request);
  }

  @override
  Future<ChatbotResponse> chatbot(ChatbotRequest request) {
    return _authApi.chatbot(request);
  }

  @override
  Future<MenuListResponse> menuList(String type) {
    return _authApi.menuList(type);
  }

  @override
  Future<void> forgotPassword(ForgotPasswordrRequest request) {
    return _authApi.forgotPassword(request);
  }

  @override
  Stream<PackagesResponse> packages() {
    return _authApi.packages();
  }

  @override
  Future<void> vacancyApply({
    required String? vacancyId,
    required String? email,
    required String? surname,
    required String? phone,
    required String? text,
    File? cv,
    File? motif,
  }) {
    return _authApi.vacancyApply(
      vacancyId: vacancyId,
      email: email,
      surname: surname,
      phone: phone,
      text: text,
      cv: cv,
      motif: motif,
    );
  }

  @override
  Stream<AllrequestData> allRequest(String data) {
    return _authApi.allRequest(data);
  }

  @override
  Future<AiGenerateResponse> aiQuestion(int questionId) {
    return _authApi.aiQuestion(questionId);
  }

  @override
  Future<PurchasesResponse> purchases(PurchasesRequest request) {
    return _authApi.purchases(request);
  }

  @override
  Future<ResultDetailsAnswers> resultDetails(int resultId) {
    return _authApi.resultDetails(resultId);
  }

  @override
  Future<StatisticsResponseData> statistics(StatisticsRequest request) {
    return _authApi.statistics(request);
  }

  @override
  Future<ResultsData> results(bool subject, String type, int? subjectId, int studentId) {
    return _authApi.results(subject, type, subjectId, studentId);
  }

  @override
  Future<bool> firstOpen() {
    return _cacheManager.isFirstOpen();
  }

  @override
  Future<void> setIsFirstOpen() {
    return _cacheManager.setIsFirstOpen();
  }

  @override
  Future<void> logout() {
    return _cacheManager.clear();
  }

  @override
  Future<void> uploadImage(File file) {
    return _authApi.uploadImage(file);
  }

  @override
  Future<PaymentsInitiateResponse> paymentsInitiate(PaymentsInitiateRequest request) {
    return _authApi.paymentsInitiate(request);
  }

  @override
  Future<void> updateFirebaseToken(FirebaseNotif request) {
    return _authApi.updateFirebaseToken(request);
  }
}
