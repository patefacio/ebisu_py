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

final ro = Access.ro;
final rw = Access.rw;
final wo = Access.wo;
final ia = Access.ia;

// end <part py_core>
