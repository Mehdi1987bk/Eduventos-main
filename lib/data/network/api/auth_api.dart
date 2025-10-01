import 'dart:io';

import 'package:dio/dio.dart' hide Headers;
import 'package:eduventure/data/network/request/firebase_notif.dart';
import 'package:eduventure/data/network/response/get_notifications_pagination.dart';

import 'package:retrofit/retrofit.dart';

import '../../../domain/entities/pagination.dart';
import '../../../main.dart';
import '../request/add_product_request.dart';
import '../request/approve_notify_request.dart';
import '../request/chatbot_request.dart';
import '../request/delete_order_request.dart';
import '../request/exam_id_reqister.dart';
import '../request/exam_reqister.dart';
import '../request/exam_response.dart';
import '../request/forgot_password.dart';
import '../request/forgot_password_request.dart';
import '../request/login_request.dart';
import '../request/payments_initiate_request.dart';
import '../request/purchases_request.dart';
import '../request/question_result.dart';
import '../request/raiting_request.dart';
import '../request/register_student_request.dart';
import '../request/registration_request.dart';
import '../request/reyting_exam_request.dart';
import '../request/send_order_request.dart';
import '../request/statistics_request.dart';
import '../request/subjects_request.dart';
import '../request/update_password_request.dart';
import '../request/update_user_data_request.dart';
import '../response/ai_generate_response.dart';
import '../response/all_request_data.dart';
import '../response/banners_response.dart';
import '../response/chatbot_response.dart';
import '../response/get_basekt_response_data.dart';
import '../response/get_otp_code.dart';
import '../response/get_posts_response.dart';
import '../response/get_posts_response_list.dart';
import '../response/get_posts_response_list_pagination.dart';
import '../response/get_user_response.dart';
import '../response/groups_list.dart';
import '../response/instructions_data.dart';
import '../response/language_list_response.dart';
import '../response/login_response.dart';
import '../response/menu_list_response.dart';
import '../response/order_details_data.dart';
import '../response/packages_response.dart';
import '../response/packets_response_list.dart';
import '../response/payments_initiate_response.dart';
import '../response/pet_respons.dart';
import '../response/product.dart';
import '../response/product_category.dart';
import '../response/purchases_response.dart';
import '../response/question_list.dart';
import '../response/question_result_response.dart';
import '../response/raiting_list.dart';
import '../response/result_details_answers.dart';
import '../response/results_rata.dart';
import '../response/reyting_exam_response.dart';
import '../response/search_student.dart';
import '../response/send_otp_reqister.dart';
import '../response/send_otp_response.dart';
import '../response/settings_response.dart';
import '../response/statistics_response.dart';
import '../response/statistics_response_data.dart';
import '../response/subjects_list_response.dart';
import '../request/subs_pay_request.dart';
import '../response/subs_pay_status.dart';
import '../response/type_option.dart';
import '../response/vacancies_data.dart';
import '../response/video_result_response.dart';

part 'auth_api.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class AuthApi {
  factory AuthApi(Dio dio, {String? baseUrl}) = _AuthApi;

  @POST('/api/login')
  Future<LoginResponse> login(@Body() LoginRequest request);

  @GET('/api/userDetails')
  Future<GetUserResponse> getUserDetails();

  @POST('/api/checkOtpRegister')
  Future<LoginResponse> checkOtpRegister(
    @Body() RegistrationRequest request,
  );

  @POST('/api/checkOtpRegister')
  Future<LoginResponse> checkOtpRStudentegister(
    @Body() RegistrationStudentRequest request,
  );

  @POST('/panel/addCart')
  Future<void> addProduct(@Body() AddProductRequest request);

  @GET('/api/languages')
  Future<LanguageListResponse> getLanguages();

  @GET('/api/classes')
  Future<LanguageListResponse> getClasses();

  @GET('/api/regions')
  Future<LanguageListResponse> getRegions();

  @GET('/api/subjects')
  Future<SubjectsListResponse> getSubjects(
    @Body() SubjectsRequest request,
  );

  @GET('/api/searchStudent')
  Future<SearchStudent> searchStudent(
    @Query('code') String code,
  );

  @GET('/api/aiGenerateResponse')
  Future<AiGenerateResponse> aiGenerateResponse(
    @Query('resultId') int resultId,
  );

  @POST('/panel/sendOrder')
  Future<void> sendOrder(@Body() SendOrderRequest request);

  @POST('/api/examComplete')
  Future<QuestionResultResponse> sendQuestionResult(@Body() QuestionResult request);

  @GET('/panel/orderDetails')
  Future<OrderDetailsData> orderDetails();

  @GET('/api/groups')
  Future<GroupsList> getGroups();

  @POST('/panel/deleteCart')
  Future<void> deleteOrder(@Body() DeleteOrderRequest request);

  @POST('/api/selectStudentForParent')
  Future<void> selectStudentForParent(
    @Part(name: "studentId") int id,
  );

  @GET('/panel/productCategory')
  Future<List<ProductCategory>> productCategory();

  @GET('/api/vacancies')
  Future<VacanciesData> getVacancies();

  @GET('/panel/cartList')
  Future<GetBasektResponseData> getBasketProducts();

  @GET('/panel/products')
  Future<Pagination<Product>> getProducts(
    @Query('page') int page,
    @Query('category_id') int? category,
    @Query('search') String? search,
  );

  @POST('/api/sendOtp')
  Future<GetOtpCode> sendOtp(
    @Body() SendOtpReqister request,
  );

  @GET('/api/exam')
  Future<ExamResponse> exam(
    @Query('page') int page,
    @Body() ExamReqister request,
  );

  @GET('/api/examList')
  Future<ReytingExamResponse> reytingExam(
    @Body() ReytingExamRequest request,
  );

  @GET('/pets/animal-types/')
  Future<List<TypeOption>> getCategory();

  @GET('/pets/pet-types/')
  Future<List<TypeOption>> getPetTypes(
    @Query("animal_type_id") int id,
  );

  @GET('/pets/breeds/')
  Future<List<TypeOption>> getBreeds(
    @Query("pet_type_id") int id,
  );

  @GET('/api/questions')
  Future<QuestionList> questions(
    @Body() ExamIdReqister request,
  );

  @GET('/pets/by-breed/')
  Future<List<PetResponse>> getPertsFromBreedId(
    @Query("breed_id") int id,
  );

  @PUT('/api/sendOtp')
  Future<void> sendOtpPassword(
    @Body() SendOtpReqister request,
  );

  @POST('/api/checkOtpRegister')
  Future<SendOtpResponse> sendRegistration(
    @Query("phoneNumber") int number,
    @Query("otpCode") int otpCode,
  );

  @PUT('/api/checkOtpLogin')
  Future<SendOtpResponse> sendOtpLogin(@Body() ForgotPassword request);

  @GET('/api/slides')
  Future<BannersResponse> getSlides();

  @GET('/api/video')
  Stream<VideoResultResponse> getVideo(
      @Query('isGroup') int isGroup,

      );

  @POST('/api/chatbot')
  Future<ChatbotResponse> chatbot(@Body() ChatbotRequest request);

  @GET('/api/raiting')
  Future<RaitingList> getRaiting(@Body() RaitingRequest request);

  @GET('/api/menuList')
  Future<MenuListResponse> menuList(
    @Query('type') String type,
  );

  @GET('/api/posts')
  Future<GetPostsResponseList> getPosts(
    @Query('menuId') String id,
  );

  @GET('/api/posts')
  Future<GetPostsResponseListPagination> getPostsPagination(
    @Query('page') int page,
    @Query('limit') String limit,
    @Query('menuId') int menuId,
  );

  @GET('/api/notifications')
  Future<GetNotificationsPagination> getNotifications(
    @Query('page') int page,
    @Query('limit') String limit,
    @Query('isParent') int isParent,
  );

  @GET('/api/settings')
  Future<SettingsResponse> settings();

  @GET('/api/instructions')
  Future<InstructionsData> instructions();

  @PUT('/api/registerData')
  Future<void> registration(@Body() RegistrationRequest request);

  @PUT('/api/updateUserData')
  Future<void> updateUserData(@Body() UpdateUserDataRequest request);

  @PUT('/api/approveNotify')
  Future<void> approveNotify(@Body() ApproveNotifyRequest request);

  @PUT('/api/updatePassword')
  Future<void> updatePassword(@Body() UpdatePasswordRequest request);

  @PUT('/api/updatePassword')
  Future<void> forgotPassword(@Body() ForgotPasswordrRequest request);

  @GET('/api/all-requests/2022-12-01/{date}')
  Stream<AllrequestData> allRequest(@Path() String date);

  @GET('/api/statistics')
  Future<StatisticsResponseData> statistics(@Body() StatisticsRequest request);

  @GET('/api/results')
  Future<ResultsData> results(
    @Query('subject') bool subject,
    @Query('type') String type,
    @Query('subjectId') int? subjectId,
    @Query('studentId') int? studentId,
  );

  @GET('/api/aiQuestion?questionId=49')
  Future<AiGenerateResponse> aiQuestion(
    @Query('questionId') int questionId,
  );

  @GET('/api/purchases')
  Future<PurchasesResponse> purchases(@Body() PurchasesRequest request);

  @GET('/api/resultDetails')
  Future<ResultDetailsAnswers> resultDetails(
    @Query('resultId') int resultId,
  );

  @GET('/api/package')
  Future<PacketsResponseList> getPackets();

  @POST('/api/subsPay')
  Future<SubsPayStatus> subsPay(
    @Body() SubsPayRequest request,
  );

  @GET('/api/packages')
  Stream<PackagesResponse> packages();

  @POST('/api/apply')
  Future<void> vacancyApply({
    @Part(name: "vacancyId") required String? vacancyId,
    @Part(name: "email") required String? email,
    @Part(name: "surname") required String? surname,
    @Part(name: "phone") required String? phone,
    @Part(name: "text") required String? text,
    @Part(name: "file") File? cv,
    @Part(name: "files[]") File? motif,
  });

  @POST('/api/uploadImage')
  Future<void> uploadImage(@Part(name: 'image') File file);

  @POST('/api/payments/initiate')
  Future<PaymentsInitiateResponse> paymentsInitiate(
    @Body() PaymentsInitiateRequest request,
  );

  @POST('/api/setParam')
  Future<void> updateFirebaseToken(
    @Body() FirebaseNotif request,
  );
}
