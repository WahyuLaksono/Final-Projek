import 'barang.dart';

class Node {
  Barang barang;
  Node? left;
  Node? right;

  Node(this.barang);
}

class Tree {
  Node? root;

  void insert(Barang barang) {
    root = _insert(root, barang);
  }

  Node _insert(Node? node, Barang barang) {
    if (node == null) {
      return Node(barang);
    }

    if(barang.nama.compareTo(node.barang.nama) < 0) {
      node.left = _insert(node.left, barang);
    } else {
      node.right = _insert(node.right, barang);
    }

    return node;
  }

  Barang? search(String nama) {
    return _search(root, nama);
  }

  Barang? _search(Node? node, String nama) {
    if (node == null) {
      return null;
    }

    if (nama.compareTo(node.barang.nama) == 0) {
      return node.barang;
    } else if (nama.compareTo(node.barang.nama) < 0) {
      return _search(node.left, nama);
    } else {
      return _search(node.right, nama);
    }
  }

  void inOrderTraversal(void Function(Barang) action) {
    _inOrderTraversal(root, action);
  }

  void _inOrderTraversal(Node? node, void Function(Barang) action) {
    if (node != null) {
      _inOrderTraversal(node.left, action);
      action(node.barang);
      _inOrderTraversal(node.right, action);
    }
  }
}