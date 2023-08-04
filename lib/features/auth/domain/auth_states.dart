abstract class AuthStates{
}

class AuthLoading extends AuthStates{}

class SignInLoading extends AuthStates{}
class SignInSuccess extends AuthStates{}
class SignInFailed extends AuthStates{}

class GetUsersLoading extends AuthStates{}
class GetUsersSuccess extends AuthStates {
  var productList = [];
  GetUsersSuccess(this.productList);
}

class GetUsersFailed extends AuthStates {
  final String msg;
  GetUsersFailed(this.msg);
}

class SignUpLoading extends AuthStates{}
class SignUpSuccess extends AuthStates{}
class SignUpFailed extends AuthStates{}

class ImageCamera extends AuthStates{}
class ImageGallery extends AuthStates{}

class SignInGoogleLoading extends AuthStates{}
class SignInGoogleSuccess extends AuthStates{}
class SignInGoogleFailed extends AuthStates{}

