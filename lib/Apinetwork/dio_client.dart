import 'package:dio/dio.dart';
import 'package:taskly/Apinetwork/apiendpoint.dart';
import 'package:taskly/common/local_storage.dart';
import 'package:taskly/config/const.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  factory DioClient() => _instance;
  late final Dio dio;
  DioClient._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: Duration(seconds: 30),
        receiveTimeout: Duration(seconds: 30),
        sendTimeout: Duration(seconds: 30),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = LocalStorage.getString(kacessToken);
          options.headers['Authorization'] = 'Bearer $token';
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (error, handler) {
          return handler.next(error);
        },
      ),
    );
  }

  Future<Response> get(String endpoint, {Map<String, dynamic>? params}) async {
    try {
      return await dio.get(endpoint, queryParameters: params);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  Response _handleError(DioException e) {
    final errorMessage = switch (e.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.receiveTimeout ||
      DioExceptionType.sendTimeout => 'Kết nối bị gián đoạn. Vui lòng thử lại.',
      DioExceptionType.badResponse => switch (e.response?.statusCode) {
        400 => 'Yêu cầu không hợp lệ',
        401 => 'Bạn không có quyền truy cập. Vui lòng đăng nhập lại.',
        403 => 'Bạn không có quyền thực hiện hành động này.',
        404 => 'Dữ liệu không tồn tại hoặc đã bị xóa.',
        500 => 'Lỗi máy chủ. Vui lòng thử lại sau.',
        _ => 'Lỗi không xác định. Vui lòng thử lại.',
      },
      DioExceptionType.cancel => 'Yêu cầu đã bị hủy.',
      DioExceptionType.unknown =>
        'Không thể kết nối đến máy chủ. Kiểm tra internet.',
      _ => 'Không thể kết nối đến máy chủ. Kiểm tra internet.',
    };

    throw FormatException(errorMessage);
  }

  Future<Response> post(
    String endpoint, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? params,
  }) async {
    try {
      return await dio.post(endpoint, data: data, queryParameters: params);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  Future<Response> put(
    String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? params,
  ) async {
    try {
      return await dio.put(endpoint, data: data, queryParameters: params);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  Future<Response> delete(
    String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? params,
  ) async {
    try {
      return await dio.delete(endpoint, data: data, queryParameters: params);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }
}
