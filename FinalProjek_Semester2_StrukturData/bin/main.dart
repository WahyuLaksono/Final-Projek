import 'dart:io';
import 'stockManager.dart';

void main() {
  StockManager manager = StockManager();

    while (true) {
      print("\nMenu Pilihan : ");
      print("1. Tambah barang");
      print("2. Lihat semua barang di penyimpanan");
      print("3. Cari barang berdasarkan nama");
      print("4. Tambah pembelian barang");
      print("5. Proses pembelian");
      print("6. Batalkan operasi terakhir");
      print("7. Keluar");
      stdout.write("Pilih operasi (1-7) : ");
      String? pilih = stdin.readLineSync();

      switch (pilih) {
        case "1":
          manager.tambahBarang();
          break;

        case "2":
          manager.tampilanBarang();
          break;

        case "3":
          manager.cariBarang();
          break;

        case "4":
          manager.tambahPembayaran();
          break;

        case "5":
          manager.prosesPembayaran();
          break;

        case "6":
          manager.undoAction();
          break;

        case "7":
          print("Terima kasih. Program selesai.");
          exit(0);

        default:
          print("Pilhan tidak valid. Silahkan coba lagi.");
          break;
      }
    }
}