import 'package:kawal_desa2/constants/route_name.dart';
import 'package:kawal_desa2/services/navigation_service.dart';
import 'package:kawal_desa2/ui/locator.dart';
import 'package:kawal_desa2/viewmodels/base_model.dart';

class LoginViewModel extends BaseModel{
  final NavigationService _navigationService = locator<NavigationService>();

  void navigateToSignUpView(){
    _navigationService.navigateTo(SignUpViewRoute);
  }
}
