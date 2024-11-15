import 'package:chopper/chopper.dart';

part 'chopper_service.chopper.dart'; // Required for code generation.

@ChopperApi()
abstract class PostService extends ChopperService {
  @Get(path: '/posts')
  Future<Response> getPosts();

  static PostService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse('https://jsonplaceholder.typicode.com'),
      services: [_$PostService()],
      interceptors: [
        HttpLoggingInterceptor(),
        HeadersInterceptor(),
      ],
      converter: const JsonConverter(),
    );
    return _$PostService(client);
  }
}

class HeadersInterceptor extends RequestInterceptor {
  @override
  Future<Request> onRequest(Request request) async {
    return request.copyWith(headers: {'Custom-Header': 'ChopperClient'});
  }
}
