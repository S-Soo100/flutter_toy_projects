import '../models/payment_request.dart';

class PaymentHtml {
  static String clientKey = "test_ck_D5GePWvyJnrK0W0k6q8gLzN97Eoq"; //test key

  static String generate(PaymentRequest request) {
    String ret = "";
    switch (request.payBy) {
      case "카드":
        ret = card(request);
        break;
      case "카드자동결제":
        ret = billingAuth(request);
        break;
      case "카드앱바로열기":
        ret = cardDirect(request);
        break;
      case "가상계좌":
        ret = virtualAccount(request);
        break;
      case "계좌이체":
        ret = accountTransfer(request);
        break;
      case "휴대폰":
        ret = phone(request);
        break;
      case "도서문화상품권":
        ret = giftCard(request);
        break;
      case "토스결제":
        ret = tossPay(request);
        break;
    }

    return ret;
  }

  static String card(PaymentRequest request) {
    return '''<html>
      <head>
   <script src="https://js.tosspayments.com/v1"></script>
   </head>
   <body>
   <script>
   var tossPayments = TossPayments('$clientKey')
   tossPayments.requestPayment('카드', {
   amount: ${request.amount},
   orderId: '${request.orderId}',
   orderName: '${request.orderName}',
   customerName: '${request.customerName}',
   successUrl: window.location.origin + '/success',
   failUrl: window.location.origin + '/fail',
   })
   </script>
   </body>
   </html>
   ''';
  }

  static String cardDirect(PaymentRequest request) {
    return '''<html>
      <head>
   <script src="https://js.tosspayments.com/v1"></script>
   </head>
   <body>
   <script>
   var tossPayments = TossPayments('$clientKey')
   tossPayments.requestPayment('카드', {
   amount: ${request.amount},
   orderId: '${request.orderId}',
   orderName: '${request.orderName}',
   customerName: '${request.customerName}',
   cardCompany:'${request.cardCompany}',
   successUrl: window.location.origin + '/success',
   failUrl: window.location.origin + '/fail',
   })
   </script>
   </body>
   </html>
   ''';
  }

  static String billingAuth(PaymentRequest request) {
    return '''<html>
      <head>
   <script src="https://js.tosspayments.com/v1"></script>
   </head>
   <body>
   <script>
   var tossPayments = TossPayments('$clientKey')
   tossPayments.requestBillingAuth('카드', {
   customerKey:'${request.customerKey}'
   successUrl: window.location.origin + '/success',
   failUrl: window.location.origin + '/fail',
   })
   </script>
   </body>
   </html>
   ''';
  }

  static String virtualAccount(PaymentRequest request) {
    return '''<html>
      <head>
   <script src="https://js.tosspayments.com/v1"></script>
   </head>
   <body>
   <script>
   var tossPayments = TossPayments('$clientKey')
   tossPayments.requestPayment('${request.payBy}', {
   amount: ${request.amount},
   orderId: '${request.orderId}',
   orderName: '${request.orderName}',
   customerName: '${request.customerName}',
   successUrl: window.location.origin + '/success',
   failUrl: window.location.origin + '/fail',
   })
   </script>
   </body>
   </html>
   ''';
  }

  static String accountTransfer(PaymentRequest request) {
    return '''<html>
      <head>
   <script src="https://js.tosspayments.com/v1"></script>
   </head>
   <body>
   <script>
   var tossPayments = TossPayments('$clientKey')
   tossPayments.requestPayment('${request.payBy}', {
   amount: ${request.amount},
   orderId: '${request.orderId}',
   orderName: '${request.orderName}',
   customerName: '${request.customerName}',
   bank: '${request.bank}',
   successUrl: window.location.origin + '/success',
   failUrl: window.location.origin + '/fail',
   })
   </script>
   </body>
   </html>
   ''';
  }

  static String phone(PaymentRequest request) {
    return '''<html>
      <head>
   <script src="https://js.tosspayments.com/v1"></script>
   </head>
   <body>
   <script>
   var tossPayments = TossPayments('$clientKey')
   tossPayments.requestPayment('${request.payBy}', {
   amount: ${request.amount},
   orderId: '${request.orderId}',
   orderName: '${request.orderName}',
   customerName: '${request.customerName}',
   successUrl: window.location.origin + '/success',
   failUrl: window.location.origin + '/fail',
   })
   </script>
   </body>
   </html>
   ''';
  }

  static String giftCard(PaymentRequest request) {
    return '''<html>
      <head>
   <script src="https://js.tosspayments.com/v1"></script>
   </head>
   <body>
   <script>
   var tossPayments = TossPayments('$clientKey')
   tossPayments.requestPayment('${request.payBy}', {
   amount: ${request.amount},
   orderId: '${request.orderId}',
   orderName: '${request.orderName}',
   customerName: '${request.customerName}',
   successUrl: window.location.origin + '/success',
   failUrl: window.location.origin + '/fail',
   })
   </script>
   </body>
   </html>
   ''';
  }

  static String tossPay(PaymentRequest request) {
    return '''<html>
      <head>
   <script src="https://js.tosspayments.com/v1"></script>
   </head>
   <body>
   <script>
   var tossPayments = TossPayments('$clientKey')
   tossPayments.requestPayment('${request.payBy}', {
   amount: ${request.amount},
   orderId: '${request.orderId}',
   orderName: '${request.orderName}',
   customerName: '${request.customerName}',
   successUrl: window.location.origin + '/success',
   failUrl: window.location.origin + '/fail',
   })
   </script>
   </body>
   </html>
   ''';
  }
}

String successHtml = '''<html><h1>Success</h1></html>''';
String failHtml = '''<html><h1>Fail</h1></html>''';
