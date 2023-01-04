import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:toss_payment/toss_payment.dart';
import 'dart:developer' as dev;
import 'widgets/orderWidget.dart';
import 'widgets/product_widget.dart';
import 'models/payment_request.dart';
import 'models/product.dart';
import 'service/mock_server.dart';

class TossPaymetTestScreen extends StatefulWidget {
  static const String routeName = 'tossPaymentTestRouteName';
  const TossPaymetTestScreen({Key? key}) : super(key: key);

  @override
  State<TossPaymetTestScreen> createState() => _TossPaymetTestScreenState();
}

class _TossPaymetTestScreenState extends State<TossPaymetTestScreen> {
  final Product _product = Product(price: 100, name: '토스 티셔츠');

  @override
  void initState() {
    super.initState();
    // initMockServer();
  }

  Future<void> initMockServer() async {
    await MockServer.startServer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Toss Payment Demo"),
      ),
      body: SafeArea(
        child: Column(children: [
          Expanded(
            child: Center(
              child: ProductWidget(
                product: _product,
              ),
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            padding: const EdgeInsets.all(4),
            crossAxisCount: 3,
            children: List.generate(9, (index) {
              Widget ret = Container(
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              );

              switch (index) {
                case 0:
                  ret = OrderWidget(
                    title: '카드',
                    product: _product,
                    onTap: (request) {
                      _showPayment(context, request);
                    },
                    payBy: '카드',
                  );
                  break;
                case 1:
                  ret = OrderWidget(
                    title: '카드 자동결제',
                    product: _product,
                    onTap: (request) {
                      _showPayment(context, request);
                    },
                    payBy: '카드자동결제',
                  );
                  break;
                case 2:
                  ret = OrderWidget(
                    title: '카드 앱 바로 열기',
                    product: _product,
                    onTap: (request) {
                      _showPayment(context, request);
                    },
                    payBy: '카드앱바로열기',
                  );
                  break;
                case 3:
                  ret = OrderWidget(
                    title: '가상계좌',
                    product: _product,
                    onTap: (request) {
                      _showPayment(context, request);
                    },
                    payBy: '가상계좌',
                  );
                  break;
                case 4:
                  ret = OrderWidget(
                    title: '계좌이체',
                    product: _product,
                    onTap: (request) {
                      _showPayment(context, request);
                    },
                    payBy: '계좌이체',
                  );
                  break;
                case 5:
                  ret = OrderWidget(
                    title: '휴대폰',
                    product: _product,
                    onTap: (request) {
                      _showPayment(context, request);
                    },
                    payBy: '휴대폰',
                  );
                  break;
                case 6:
                  ret = OrderWidget(
                    title: '도서문화상품권',
                    product: _product,
                    onTap: (request) {
                      _showPayment(context, request);
                    },
                    payBy: '도서문화상품권',
                  );
                  break;
                case 7:
                  ret = OrderWidget(
                    title: '토스결제',
                    product: _product,
                    onTap: (request) {
                      _showPayment(context, request);
                    },
                    payBy: '토스결제',
                  );
                  break;
              }
              return ret;
            }),
          ),
        ]),
      ),
    );
  }

  _showPayment(BuildContext context, PaymentRequest request) async {
    var ret = await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        enableDrag: false,
        isDismissible: false,
        builder: (context) {
          bool success = false;
          return Container(
            margin: const EdgeInsets.only(top: 110),
            child: PaymentWebView(
              title: _product.name,
              paymentRequestUrl: request.url,
              onPageStarted: (url) {
                dev.log('onPageStarted.url = $url', name: "PaymentWebView");
              },
              onPageFinished: (url) async {
                dev.log('onPageFinished.url = $url', name: "PaymentWebView");
                // TODO something to decide the payment is successful or not.
                success = url.contains('success');

                var temp = url.split('success?')[1];
                Map<String, String> params = {};
                temp.split('&').forEach((e) {
                  var data = e.split('=');
                  params[data[0]] = data[1];
                });
                print(params);

                Dio dio = new Dio();

                //결제 validation

                dio.options.headers['content-Type'] = 'application/json';
                dio.options.headers['authorization'] =
                    'Basic dGVzdF9za196WExrS0V5cE5BcldtbzUwblgzbG1lYXhZRzVSOg';
                print(dio.options.contentType);

                var response = await dio.post(
                  'https://api.tosspayments.com/v1/payments/confirm',
                  data: params,
                );

                print(response.data);
                Navigator.of(context).pop(true);
              },
              onDisposed: () {},
              onTapCloseButton: () {
                Navigator.of(context).pop(success);
              },
            ),
          );
        });

    //true면 결제 성공

    //false면 결제 실패
    dev.log('ret = $ret', name: '_showPayment');
  }
}

extension PaymentRequestExtension on PaymentRequest {
  Uri get url {
    // TODO 토스페이를 위해 만든 Web 주소를 넣어주세요. 아래는 예시입니다.
    return Uri.http("localhost:8080", "payment", json);
  }
}
