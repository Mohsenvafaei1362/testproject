import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:testproject/features/login/data/models/request/login_request.dart';
import 'package:testproject/features/login/data/models/response/login_response.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  //! لاگین
  @POST('auth/login')
  Future<HttpResponse<LoginResponse>> signIn(@Body() LoginRequest loginRequest);

  // //! otpCode
  // @POST('SmsVerification/verification')
  // Future<HttpResponse<OtpResponse>> otpCode(@Body() OtpRequest otpRequest);

  // //! دریافت همه رمرز ارزها
  // @GET('CoinsList/sync')
  // Future<HttpResponse<List<AllCryptoResponse>>> getAllCryptoEntity();
}
