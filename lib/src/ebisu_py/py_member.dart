part of ebisu_py.ebisu_py;

/// An accessible data item in a class.
class Member extends PyEntity {
  /// Initialization for the member
  String get init => _init;
  Access get access => _access;

  /// Variable name derived from *id*
  String get vname => _vname;

  // custom <class Member>

  Member(id) : super(id) {
    _vname = _id.snake;
  }

  get type => _type == null ? 'String' : _type;

  get definition => brCompact([_reader, '$_vname # of type $type']);

  get _reader => _access == ro || _access == rw ? '# ${vname} reader' : null;

  // end <class Member>

  String _init;
  Access _access;

  /// Optional type for the member
  String _type;
  String _vname;
}

// custom <part py_member>

Member member(id) => new Member(id);

// end <part py_member>
