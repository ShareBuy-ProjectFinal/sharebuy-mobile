class CartState {
  bool isLoading;
  // List<>

  CartState({
    this.isLoading = false,
  });

  CartState copyWith({
    bool? isLoading,
  }) {
    return CartState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
