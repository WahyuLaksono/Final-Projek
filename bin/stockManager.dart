import 'dart:io';
import 'barang.dart';
import 'pembayaran.dart';
import 'penyimpanan.dart';
import 'tree.dart';
import 'undoStack.dart';

class StockManager {
  final Penyimpanan penyimpanan = Penyimpanan();
  final PembayaranQueue pembayaranQueue = PembayaranQueue();
  final Tree tree = Tree();
  final UndoStack undoStack = UndoStack();

  void tambahBarang() {
    stdout.write("Masukkan ID barang : ");
    String id = stdin.readLineSync()!;
    stdout.write("Masukkan nama barang : ");
    String nama = stdin.readLineSync()!;
    stdout.write("Masukkan harga barang : ");
    double harga = double.parse(stdin.readLineSync()!);
    stdout.write("Masukkan stok barang : ");
    int stock = int.parse(stdin.readLineSync()!);
    
    Barang barangBaru = Barang(id, harga, nama, stock);
    penyimpanan.tambahBarang(barangBaru);
    tree.insert(barangBaru);
    undoStack.action(() => penyimpanan.hapusBarang(id));
    print("Barang berhasil ditambahkan");
  }

  void tampilanBarang() {
    print("\nSemua barang dalam penyimpanan : ");
    penyimpanan.getAllItems().forEach((barang) => print(barang));
  }

  void cariBarang() {
    stdout.write("Masukkan nama barang yang dicari : ");
    String cariNama = stdin.readLineSync()!;
    Barang? barangDitemukan = tree.search(cariNama);
    if (barangDitemukan != null) {
      print("Barang yang dicari : $barangDitemukan");
    } else {
      print("Barang tidak ditemukan");
    }
  }

  void tambahPembayaran() {
    stdout.write("Masukkan ID barang : ");
    String id = stdin.readLineSync()!;
    Barang? barangDibeli = penyimpanan.ambilBarang(id);
    if (barangDibeli != null) {
      pembayaranQueue.tambahPembayaran(barangDibeli);
      print("Barang berhasil ditambahkan ke antrian pembelian.");
    } else {
      print("Barang tidak ditemukan");
    }
  }

  void prosesPembayaran() {
    Barang? barangDiproses = pembayaranQueue.prosesPembayaran();
    if (barangDiproses != null) {
      print("Barang berhasil diproses. Barang yang diproses : $barangDiproses");
    } else {
      print("Abtrian tidak ditemukan");
    }
  }

  void undoAction() {
    undoStack.undo();
    print("Operasi berhasil dibatalkan");
  }
}