part of ebisu_py.ebisu_py;

enum Access {
  /// Read only
  ro,
  /// Read/write - effectively public
  rw,
  /// Write accessor but no read accessor
  wo,
  /// Inaccessible
  ia
}

// custom <part py_core>
// end <part py_core>
