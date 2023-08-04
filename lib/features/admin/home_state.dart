abstract class HomeStates {}

class HomeLayoutLoading extends HomeStates {}

class ChangeBottomNavState extends HomeStates {}

class InitialProduct extends HomeStates {}

class GetProductLoading extends HomeStates {}

class GetProductsSuccess extends HomeStates {
  var productList = [];
  GetProductsSuccess(this.productList);
}

class GetProductsFailed extends HomeStates {
  final String msg;
  GetProductsFailed(this.msg);
}

class ImageGallery extends HomeStates {
  ImageGallery();
}

class ImageCamera extends HomeStates {
  ImageCamera();
}

class CheckGetProductLoading extends HomeStates {}

class CreateProductsSuccess extends HomeStates {
  var productList = [];
  CreateProductsSuccess(this.productList);
}

class CreateProductsFailed extends HomeStates {
  final String msg;
  CreateProductsFailed(this.msg);
}

class DeleteProductLoading extends HomeStates {}

class DeleteProductsSuccess extends HomeStates {

}

class DeleteProductsFailed extends HomeStates {
  final String msg;
  DeleteProductsFailed(this.msg);
}

class NetworkFailed extends HomeStates {
  final String msg;
  NetworkFailed(this.msg);
}
