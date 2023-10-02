class Endpoints {
  Endpoints._();

  static const String baseUrl = 'https://rickandmortyapi.com/api/';

//* Durations
  static const Duration receiveTimeout = Duration(seconds: 20);
  static const Duration connectionTimeout = Duration(seconds: 20);

  //* Types
  static const String connectionType = 'application/json';



  //* API
  static const String jsonPHD = 'https://jsonplaceholder.typicode.com/posts';
}
