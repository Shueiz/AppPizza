class PaymentController {
  List<String> paymentMethods = [
    "Visa",
    "Mastercard",
    "Pix",
    "Boleto",
  ];

  String selectedMethod = "Visa";

  void setPaymentMethod(String method) {
    selectedMethod = method;
  }
}
