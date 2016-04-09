part of ebisu_py.ebisu_py;

enum NamingStyle { public, internal, private }

/// Convenient access to NamingStyle.public with *public* see [NamingStyle].
///
const NamingStyle public = NamingStyle.public;

/// Convenient access to NamingStyle.internal with *internal* see [NamingStyle].
///
const NamingStyle internal = NamingStyle.internal;

/// Convenient access to NamingStyle.private with *private* see [NamingStyle].
///
const NamingStyle private = NamingStyle.private;

class PyNamer {
  // custom <class PyNamer>

  String nameFunction(Id id) => id.snake;

  String nameMethod(Id id) => id.snake;

  String nameAttribute(Id id, [NamingStyle namingStyle = public]) =>
      namingStyle == public
          ? id.snake
          : namingStyle == internal ? '_${id.snake}' : '__${id.snake}';

  String nameConstant(Id id) => id.shout;

  String nameClass(Id id) => id.capCamel;

  // end <class PyNamer>

}

// custom <part py_namer>
// end <part py_namer>
