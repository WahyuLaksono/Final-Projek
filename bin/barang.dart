class Barang {
  String id;
  String nama;
  double harga;
  int stock;

  Barang(this.id, this.harga, this.nama, this.stock);

  String toString() {
    return 'Item(id: $id, nama: $nama, harga: $harga, stock: $stock)';
  }
}