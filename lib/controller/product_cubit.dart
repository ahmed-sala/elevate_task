import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/model/ProductModel.dart';
import 'repository/product_repository.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository repository;

  ProductCubit(this.repository) : super(ProductInitial());

  void fetchProducts() async {
    try {
      emit(ProductLoading());
      final products = await repository.fetchProducts();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError("Failed to fetch products: ${e.toString()}"));
    }
  }
}
