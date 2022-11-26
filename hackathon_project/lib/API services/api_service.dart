import 'dart:async';
import 'dart:async';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:hackathon_project/API%20services/API%20models/register/register_response.dart';
import 'package:hackathon_project/utils/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/http.dart';

import 'API models/create user/create_user_request.dart';
import 'API models/create user/create_user_response.dart';
import 'API models/get campaign list/get_campaign_list_response.dart';
import 'API models/idea/create_idea_request.dart';
import 'API models/idea/create_idea_response.dart';
import 'API models/idea/get_idea_response.dart';
import 'API models/login/login_request.dart';
import 'API models/login/login_response.dart';
import 'API models/profile/get_profile_response.dart';
import 'API models/register/register_request.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: Constants.BASE_URL)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  static ApiService create() {
    final dio = new Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    dio.options.connectTimeout = 60000;
    dio.options.validateStatus = (status) => true;
    dio.interceptors.add(PrettyDioLogger());
    final interceptor =
        InterceptorsWrapper(onError: (dioError, errorInterceptorHandler) => {});
    dio.interceptors.add(interceptor);

    return ApiService(
      dio,
      baseUrl: Constants.BASE_URL,
    );
  }

  @POST("/authen/login")
  Future<LoginResponse> postLogin(@Body() LoginRequest loginBody);

  @POST("/authen/register")
  Future<RegisterResponse> postRegister(@Body() RegisterRequest registerBody);

  @POST("/users/create_user")
  Future<CreateUserResponse> postCreateUser(@Body() CreateUserRequest createUser);

  @GET("/campaign/get_campaign")
  Future<GetCampaignListResponse> getCampaignList();

  @GET("/idea/get_idea")
  Future<IdeaResponse> getIdeaList();

  @POST("/idea/post_idea")
  Future<CreateIdeaResponse> postIdea(@Body() CreateIdeaRequest createIdea);

  @GET("/personal/profile")
  Future<GetProfileResponse> getProfile();
}
