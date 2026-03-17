String baseUrl = 'http://192.168.1.4:4000';

class ApiEndpoint {
  static String login = '/api/auth/login';
  static String register = '/api/auth/register';
  static String refresh = '/api/auth/refresh';
  static String profile = '/api/user/profile';
  static String createAreas = '/api/areas';
  static String  getallAreas = 'api/areas?page=1&limit=20';
}
