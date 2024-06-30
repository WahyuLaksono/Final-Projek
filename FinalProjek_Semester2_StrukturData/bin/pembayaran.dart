import 'dart:collection';
import 'barang.dart';

class PembayaranQueue {
  final Queue<Barang> _queue = Queue<Barang>();

  void tambahPembayaran(Barang barang) {
    _queue.addLast(barang);
  }

  Barang? prosesPembayaran() {
    if (_queue.isNotEmpty) {
      return _queue.removeFirst();
    }
    return null;
  }

  List<Barang> semuaPembayaran() {
    return _queue.toList();
  }
}