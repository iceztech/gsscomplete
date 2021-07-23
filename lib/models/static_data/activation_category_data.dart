class ActivationData {
  static List<Activation> activate = [
    Activation(index: 1, name: "Session (NGN 800)", price: "NGN 800"),
    Activation(index: 2, name: "Single Semester (NGN 500)", price: "NGN 500"),
    Activation(index: 3, name: "Single GSS Course (NGN 200)", price: "NGN 200"),
    Activation(index: 4, name: "GSS 301 (NGN 200)", price: "NGN 200"),
  ];

  static List<Activation> extraActivation = [
    Activation(index: 1, name: "Single Semester (NGN 500)", price: "NGN 500"),
    Activation(index: 2, name: "Single GSS Course (NGN 200)", price: "NGN 200"),
    Activation(index: 3, name: "GSS 301 (NGN 200)", price: "NGN 200"),
  ];
}

class Activation {
  String name;
  int index;
  String price;
  Activation({required this.name, required this.index, required this.price});
}
