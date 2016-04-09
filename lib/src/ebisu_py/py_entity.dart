part of ebisu_py.ebisu_py;

/// Used to establish the tree of all python entities
abstract class PyEntity extends Object with Entity {
  Id get id => _id;

  // custom <class PyEntity>

  PyEntity(id) : _id = makeId(id);

  // end <class PyEntity>

  Id _id;
}

/// Top level entity for python code generation
class Installation extends Object with Entity {
  List<Package> get packages => _packages;

  // custom <class Installation>
  // end <class Installation>

  List<Package> _packages = [];
}

class Package extends Object with Entity {
  List get modules => _modules;

  // custom <class Package>
  // end <class Package>

  List _modules = [];
}

class Module extends Object with Entity {
  List get classes => _classes;

  // custom <class Module>
  // end <class Module>

  List _classes = [];
}

// custom <part py_entity>

var _pyNamer = new PyNamer();
get pyNamer => _pyNamer;
set pyNamer(PyNamer pyNamer) => _pyNamer = pyNamer;

// end <part py_entity>
