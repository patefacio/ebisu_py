part of ebisu_py.ebisu_py;

abstract class PyEntity extends Object with Entity {
  Id get id => _id;

  // custom <class PyEntity>

  PyEntity(id) : _id = makeId(id);

  // end <class PyEntity>

  Id _id;
}

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
// end <part py_entity>
