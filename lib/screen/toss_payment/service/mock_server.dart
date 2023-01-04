import 'dart:developer' as dev;
import 'dart:io';

import '../models/payment_request.dart';
import 'html.dart';

class MockServer {
  static const clientKey = "test_ck_D5GePWvyJnrK0W0k6q8gLzN97Eoq";
  static const successUrl = "";
  static const failUrl = "";

  // onPageFinished.url = http://localhost:8080/success?orderId=CAgDAwMD&paymentKey=ly05n91dEvLex6BJGQOVDRNXA6Zn8W4w2zNbgaYRMPoqmDXk&amount=100

  static Future startServer() async {
    HttpServer server =
        await HttpServer.bind(InternetAddress.loopbackIPv4, 8080);
    server.listen((request) async {
      dev.log("request.requestedUri.path = ${request.requestedUri.path}");
      dev.log("request.requestedUri.path = ${request.requestedUri.path}");

      switch (request.requestedUri.path) {
        case '/success':
          final queries = request.uri.queryParameters;

          if (PaymentRequest.fromJson(queries) == null) {
            await request.response.close();
            return;
          }

          break;
        case '/fail':
          break;
      }
      // switch (request.requestedUri.path) {
      //   case '':
      final queries = request.uri.queryParameters;

      if (PaymentRequest.fromJson(queries) == null) {
        await request.response.close();
        return;
      }
      request.response
        ..statusCode = 200
        ..headers.set("Content-Type", 'text/html;charset=utf-8')
        ..write(PaymentHtml.generate(PaymentRequest.fromJson(queries)!));

      await request.response.close();
    });
  }
}
