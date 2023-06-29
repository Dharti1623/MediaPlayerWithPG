import 'package:get/get.dart';
import 'package:music_mix/Network/Repository/authentication_repository/authentication_repository.dart';
import 'package:music_mix/UI/View/PaymentScreen/ViewModel/payment_view_model.dart';
class NetworkBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<PaymentViewModel>(() => PaymentViewModel(),fenix: true);
    Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepository(),fenix: true);
  }
}