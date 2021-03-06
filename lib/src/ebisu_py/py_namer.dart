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

  String nameMember(Id id) => id.snake;

  // end <class PyNamer>

}

// custom <part py_namer>

nameFunction(id) => pyNamer.nameFunction(id);
nameMethod(id) => pyNamer.nameMethod(id);
nameAttribute(id, [NamingStyle namingStyle = public]) =>
    pyNamer.nameAttribute(id, namingStyle);
nameConstant(id) => pyNamer.nameConstant(id);
nameClass(id) => pyNamer.nameClass(id);
nameMember(id) => pyNamer.nameMember(id);

// end <part py_namer>
