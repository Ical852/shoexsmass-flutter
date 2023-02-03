import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shoexsmass/models/productmodel.dart';

class ProductCubit extends Cubit<List<ProductModel>> {
  ProductCubit() : super([]);

  void addFav(ProductModel product) {
    if (!isSelected(product)) {
      state.add(product);
    } else {
      state.removeWhere((p) => p.id == product.id);
    }
    print(state);
    emit(List.from(state));
  }

  bool isSelected(ProductModel product) {
    int index = state.indexWhere((p) => p.id == product.id);
    print(index);
    if (index == -1) {
      return false;
    } else {
      return true;
    }
  }
}
