class ApiPoints {
  static const _baseUrl = 'http://app1.6.test';
  static const _baseApiUrl = '$_baseUrl/api';

  ///authentication section
  static const _auth = '$_baseApiUrl/auth';

  static const login = '$_auth/login';
  static const register = '$_auth/register';

  ///posts section
  static const _posts = '$_baseApiUrl/posts';

  static const posts = _posts;

  static postsById(int id) => '$_posts/$id';

  ///Y section
  static const _y = '$_baseApiUrl/y';

  static const y = '$_y/path';

  ///Z section
  static const _z = '$_baseApiUrl/z';

  static const z = '$_z/path';
}
