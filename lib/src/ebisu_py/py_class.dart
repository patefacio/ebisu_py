part of ebisu_py.ebisu_py;

/// A python class
class Class extends PyEntity {
  /// The members of the class
  List<Members> get members => _members;
  String get name => _name;

  // custom <class Class>

  Class(id) : super(id) {
    _name = nameClass(_id);
  }

  get definition => brCompact(['class $name:',]);

  // end <class Class>

  List<Members> _members = [];
  String _name;
}

// custom <part py_class>
// end <part py_class>
