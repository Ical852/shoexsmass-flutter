import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shoexsmass/models/cartmodel.dart';
import 'package:shoexsmass/models/productmodel.dart';

class CartCubit extends Cubit<List<CartModel>> {
  CartCubit() : super([]);

  void addCart(CartModel cartProduct) {
    if (!isSelected(cartProduct)) {
      state.add(cartProduct);
    } else {
      return increase(cartProduct);
    }
    print(state);
    emit(List.from(state));
  }

  void increase(CartModel cartProduct) {
    int index = state.indexWhere((cart) => cart.product.id == cartProduct.product.id);
    state[index].qty += 1;
    print(state[index].qty);
    emit(List.from(state));
  }

  void removeCart(CartModel cartProduct) {
    state.removeWhere((cart) => cart.product.id == cartProduct.product.id);
    emit(List.from(state));
  }

  bool isSelected(CartModel cartProduct) {
    int index = state.indexWhere((cart) => cart.product.id == cartProduct.product.id);
    print(index);
    if (index == -1) {
      return false;
    } else {
      return true;
    }
  }

  void resetCart() {
    emit([]);
  }
}
