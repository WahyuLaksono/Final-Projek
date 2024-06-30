import 'barang.dart';

class Penyimpanan {
  final Map<String, Barang> _barang = {};

  void tambahBarang(Barang barang) {
    _barang[barang.id] = barang;
  }

  Barang? ambilBarang(String id) {
    return _barang[id];
  }

  void hapusBarang(String id) {
    _barang.remove(id);
  }

  List<Barang> getAllItems() {
    return _barang.values.toList();
  }

  void add(Barang barangBaru) {}
}