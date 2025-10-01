import 'dart:io';

import 'package:eduventure/data/network/request/firebase_notif.dart';

import '../../data/network/request/add_product_request.dart';
import '../../data/network/request/approve_notify_request.dart';
import '../../data/network/request/chatbot_request.dart';
import '../../data/network/request/delete_order_request.dart';
import '../../data/network/request/exam.dart';
import '../../data/network/request/exam_id_reqister.dart';
import '../../data/network/request/exam_reqister.dart';
import '../../data/network/request/exam_response.dart';
import '../../data/network/request/forgot_password_request.dart';
import '../../data/network/request/login_request.dart';
import '../../data/network/request/payments_initiate_request.dart';
import '../../data/network/request/purchases_request.dart';
import '../../data/network/request/question_result.dart';
import '../../data/network/request/raiting_request.dart';
import '../../data/network/request/register_student_request.dart';
import '../../data/network/request/registration_request.dart';
import '../../data/network/request/reyting_exam_request.dart';
import '../../data/network/request/send_order_request.dart';
import '../../data/network/request/statistics_request.dart';
import '../../data/network/request/subjects_request.dart';
import '../../data/network/request/update_password_request.dart';
import '../../data/network/request/update_user_data_request.dart';
import '../../data/network/response/ai_generate_response.dart';
import '../../data/network/response/all_request_data.dart';
import '../../data/network/response/banners_response.dart';
import '../../data/network/response/chatbot_response.dart';
import '../../data/network/response/get_basekt_data.dart';
import '../../data/network/response/get_notifications.dart';
import '../../data/network/response/get_otp_code.dart';
import '../../data/network/response/get_posts_response.dart';
import '../../data/network/response/get_posts_response_list.dart';
import '../../data/network/response/get_user_response.dart';
import '../../data/network/response/groups_list.dart';
import '../../data/network/response/instructions_data.dart';
import '../../data/network/response/login_response.dart';
import '../../data/network/response/menu_list_response.dart';
import '../../data/network/response/order_details_data.dart';
import '../../data/network/response/packages_response.dart';
import '../../data/network/response/packets_response_list.dart';
import '../../data/network/response/payments_initiate_response.dart';
import '../../data/network/response/pet_respons.dart';
import '../../data/network/response/product.dart';
import '../../data/network/response/product_category.dart';
import '../../data/network/response/purchases_response.dart';
import '../../data/network/response/question.dart';
import '../../data/network/response/question_result_response.dart';
import '../../data/network/response/raiting_list.dart';
import '../../data/network/response/result_details_answers.dart';
import '../../data/network/response/results_rata.dart';
import '../../data/network/response/reyting_exam_response.dart';
import '../../data/network/response/send_otp_reqister.dart';
import '../../data/network/response/send_otp_response.dart';
import '../../data/network/response/settings_response.dart';
import '../../data/network/response/statistics_response.dart';
import '../../data/network/response/statistics_response_data.dart';
import '../../data/network/request/subs_pay_request.dart';
import '../../data/network/response/subs_pay_status.dart';
import '../../data/network/response/type_option.dart';
import '../../data/network/response/user.dart';
import '../../data/network/response/vacancies_data.dart';
import '../../data/network/response/video_result_response.dart';
import '../entities/pagination.dart';

abstract class AuthRepository {
  Future<void> login(LoginRequest request);

  Future<GetUserResponse> getUserDetails();

  Future<bool> isLogged();

  Stream<User> get userDetails;

  Stream<int> get userType;

  Future<bool> gaveUserId(int id);

  int getUserType();

  Future<GetPostsResponseList> getPosts(String id);

  Future<Pagination<GetPostsResponse>> getPostsPagination(int page, int menuId);

  Future<Pagination<GetNotifications>> getNotifications(int page, int isParent);

  Future<PacketsResponseList> getPackets();

  Future<SubsPayStatus> subsPay(SubsPayRequest request);

  Future<GetOtpCode> sendOtpRegister(SendOtpReqister request);

  Future<Pagination<Exam>> exam(
    int page,
    ExamReqister request,
  );

  Future<List<TypeOption>> reytingExam();

  Future<void> checkOtpRStudentegister(RegistrationStudentRequest request);

  Future<List<TypeOption>> getPetTypes(int id);

  Future<List<TypeOption>> getBreeds(int id);

  Future<List<PetResponse>> getPertsFromBreedId(int id);

  Future<List<TypeOption>> getCategory();

  Future<void> sendRegistration(int number, int otpCode);

  Future<void> sendOtpLogin(String number, String otpCode);

  Future<void> registration(RegistrationRequest request);

  Future<void> updateUserData(UpdateUserDataRequest request);

  Future<SettingsResponse> settings();

  Future<InstructionsData> instructions();

  Future<void> sendOtpPassword(SendOtpReqister request);

  Future<void> approveNotify(ApproveNotifyRequest request);

  Future<void> checkOtpAddStudent(RegistrationStudentRequest request);

  Future<BannersResponse> getSlides();

  Stream<VideoResultResponse> getVideo(int isGroup);

  Future<RaitingList> getRaiting(RaitingRequest request);

  Future<ChatbotResponse> chatbot(ChatbotRequest request);

  Future<MenuListResponse> menuList(String type);

  Future<void> forgotPassword(ForgotPasswordrRequest request);

  Stream<PackagesResponse> packages();

  Future<void> vacancyApply({
    required String? vacancyId,
    required String? email,
    required String? surname,
    required String? phone,
    required String? text,
    File? cv,
    File? motif,
  });

  Stream<AllrequestData> allRequest(String data);

  Future<AiGenerateResponse> aiQuestion(int questionId);

  Future<PurchasesResponse> purchases(PurchasesRequest request);

  Future<ResultDetailsAnswers> resultDetails(int resultId);

  Future<StatisticsResponseData> statistics(StatisticsRequest request);

  Future<ResultsData> results(bool subject, String type, int? subjectId, int studentId);

  Future<void> checkOtpRegister(RegistrationRequest request);

  Future<List<ProductCategory>> productCategory();

  Future<VacanciesData> getVacancies();

  Future<void> updatePassword(UpdatePasswordRequest request);

  Future<Pagination<Product>> getProducts(int page, int? category, String? search);

  Future<List<GetBasektData>> getBasketProducts();

  Future<List<Question>> questions(ExamIdReqister request);

  Future<List<TypeOption>> getLanguages();

  Future<List<TypeOption>> getClasses();

  Future<List<TypeOption>> getRegions();

  Future<List<TypeOption>> getSubjects(SubjectsRequest request);

  Future<User?> searchStudent(String code);

  Future<void> addProduct(AddProductRequest request);

  Future<void> sendOrder(SendOrderRequest request);

  Future<AiGenerateResponse> aiGenerateResponse(int resultId);

  Future<QuestionResultResponse> sendQuestionResult(QuestionResult request);

  Future<OrderDetailsData> orderDetails();

  Future<GroupsList> getGroups();

  Future<void> deleteOrder(DeleteOrderRequest request);

  Future<void> selectStudentForParent(int id);

  Future<bool> firstOpen();

  Future<void> setIsFirstOpen();

  Future<void> logout();

  Future<void> uploadImage(File file);

  Future<PaymentsInitiateResponse> paymentsInitiate(PaymentsInitiateRequest request);

  Future<void> updateFirebaseToken(FirebaseNotif request);
}
