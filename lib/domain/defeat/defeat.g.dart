// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'defeat.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDefeatCollection on Isar {
  IsarCollection<Defeat> get defeats => this.collection();
}

const DefeatSchema = CollectionSchema(
  name: r'Defeat',
  id: 4427020366165117089,
  properties: {
    r'coopEnemy10': PropertySchema(
      id: 0,
      name: r'coopEnemy10',
      type: IsarType.long,
    ),
    r'coopEnemy11': PropertySchema(
      id: 1,
      name: r'coopEnemy11',
      type: IsarType.long,
    ),
    r'coopEnemy12': PropertySchema(
      id: 2,
      name: r'coopEnemy12',
      type: IsarType.long,
    ),
    r'coopEnemy13': PropertySchema(
      id: 3,
      name: r'coopEnemy13',
      type: IsarType.long,
    ),
    r'coopEnemy14': PropertySchema(
      id: 4,
      name: r'coopEnemy14',
      type: IsarType.long,
    ),
    r'coopEnemy4': PropertySchema(
      id: 5,
      name: r'coopEnemy4',
      type: IsarType.long,
    ),
    r'coopEnemy5': PropertySchema(
      id: 6,
      name: r'coopEnemy5',
      type: IsarType.long,
    ),
    r'coopEnemy6': PropertySchema(
      id: 7,
      name: r'coopEnemy6',
      type: IsarType.long,
    ),
    r'coopEnemy7': PropertySchema(
      id: 8,
      name: r'coopEnemy7',
      type: IsarType.long,
    ),
    r'coopEnemy8': PropertySchema(
      id: 9,
      name: r'coopEnemy8',
      type: IsarType.long,
    ),
    r'coopEnemy9': PropertySchema(
      id: 10,
      name: r'coopEnemy9',
      type: IsarType.long,
    ),
    r'latestId': PropertySchema(
      id: 11,
      name: r'latestId',
      type: IsarType.string,
    ),
    r'num': PropertySchema(
      id: 12,
      name: r'num',
      type: IsarType.long,
    )
  },
  estimateSize: _defeatEstimateSize,
  serialize: _defeatSerialize,
  deserialize: _defeatDeserialize,
  deserializeProp: _defeatDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _defeatGetId,
  getLinks: _defeatGetLinks,
  attach: _defeatAttach,
  version: '3.1.0+1',
);

int _defeatEstimateSize(
  Defeat object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.latestId.length * 3;
  return bytesCount;
}

void _defeatSerialize(
  Defeat object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.coopEnemy10);
  writer.writeLong(offsets[1], object.coopEnemy11);
  writer.writeLong(offsets[2], object.coopEnemy12);
  writer.writeLong(offsets[3], object.coopEnemy13);
  writer.writeLong(offsets[4], object.coopEnemy14);
  writer.writeLong(offsets[5], object.coopEnemy4);
  writer.writeLong(offsets[6], object.coopEnemy5);
  writer.writeLong(offsets[7], object.coopEnemy6);
  writer.writeLong(offsets[8], object.coopEnemy7);
  writer.writeLong(offsets[9], object.coopEnemy8);
  writer.writeLong(offsets[10], object.coopEnemy9);
  writer.writeString(offsets[11], object.latestId);
  writer.writeLong(offsets[12], object.num);
}

Defeat _defeatDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Defeat();
  object.coopEnemy10 = reader.readLong(offsets[0]);
  object.coopEnemy11 = reader.readLong(offsets[1]);
  object.coopEnemy12 = reader.readLong(offsets[2]);
  object.coopEnemy13 = reader.readLong(offsets[3]);
  object.coopEnemy14 = reader.readLong(offsets[4]);
  object.coopEnemy4 = reader.readLong(offsets[5]);
  object.coopEnemy5 = reader.readLong(offsets[6]);
  object.coopEnemy6 = reader.readLong(offsets[7]);
  object.coopEnemy7 = reader.readLong(offsets[8]);
  object.coopEnemy8 = reader.readLong(offsets[9]);
  object.coopEnemy9 = reader.readLong(offsets[10]);
  object.id = id;
  object.latestId = reader.readString(offsets[11]);
  object.num = reader.readLong(offsets[12]);
  return object;
}

P _defeatDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _defeatGetId(Defeat object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _defeatGetLinks(Defeat object) {
  return [];
}

void _defeatAttach(IsarCollection<dynamic> col, Id id, Defeat object) {
  object.id = id;
}

extension DefeatQueryWhereSort on QueryBuilder<Defeat, Defeat, QWhere> {
  QueryBuilder<Defeat, Defeat, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DefeatQueryWhere on QueryBuilder<Defeat, Defeat, QWhereClause> {
  QueryBuilder<Defeat, Defeat, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DefeatQueryFilter on QueryBuilder<Defeat, Defeat, QFilterCondition> {
  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> coopEnemy10EqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coopEnemy10',
        value: value,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> coopEnemy10GreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'coopEnemy10',
        value: value,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> coopEnemy10LessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'coopEnemy10',
        value: value,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> coopEnemy10Between(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'coopEnemy10',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> coopEnemy11EqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coopEnemy11',
        value: value,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> coopEnemy11GreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'coopEnemy11',
        value: value,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> coopEnemy11LessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'coopEnemy11',
        value: value,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> coopEnemy11Between(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'coopEnemy11',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> coopEnemy12EqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coopEnemy12',
        value: value,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> coopEnemy12GreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'coopEnemy12',
        value: value,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> coopEnemy12LessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'coopEnemy12',
        value: value,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> coopEnemy12Between(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'coopEnemy12',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> coopEnemy13EqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coopEnemy13',
        value: value,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> coopEnemy13GreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'coopEnemy13',
        value: value,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> coopEnemy13LessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'coopEnemy13',
        value: value,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> coopEnemy13Between(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'coopEnemy13',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> coopEnemy14EqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coopEnemy14',
        value: value,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> coopEnemy14GreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'coopEnemy14',
        value: value,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> coopEnemy14LessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'coopEnemy14',
        value: value,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> coopEnemy14Between(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'coopEnemy14',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> coopEnemy4EqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coopEnemy4',
        value: value,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> coopEnemy4GreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'coopEnemy4',
        value: value,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> coopEnemy4LessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'coopEnemy4',
        value: value,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> coopEnemy4Between(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'coopEnemy4',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> coopEnemy5EqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coopEnemy5',
        value: value,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> coopEnemy5GreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'coopEnemy5',
        value: value,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> coopEnemy5LessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'coopEnemy5',
        value: value,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> coopEnemy5Between(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'coopEnemy5',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> coopEnemy6EqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coopEnemy6',
        value: value,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> coopEnemy6GreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'coopEnemy6',
        value: value,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> coopEnemy6LessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'coopEnemy6',
        value: value,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> coopEnemy6Between(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'coopEnemy6',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> coopEnemy7EqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coopEnemy7',
        value: value,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> coopEnemy7GreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'coopEnemy7',
        value: value,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> coopEnemy7LessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'coopEnemy7',
        value: value,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> coopEnemy7Between(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'coopEnemy7',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> coopEnemy8EqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coopEnemy8',
        value: value,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> coopEnemy8GreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'coopEnemy8',
        value: value,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> coopEnemy8LessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'coopEnemy8',
        value: value,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> coopEnemy8Between(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'coopEnemy8',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> coopEnemy9EqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coopEnemy9',
        value: value,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> coopEnemy9GreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'coopEnemy9',
        value: value,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> coopEnemy9LessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'coopEnemy9',
        value: value,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> coopEnemy9Between(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'coopEnemy9',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> latestIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'latestId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> latestIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'latestId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> latestIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'latestId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> latestIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'latestId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> latestIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'latestId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> latestIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'latestId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> latestIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'latestId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> latestIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'latestId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> latestIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'latestId',
        value: '',
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> latestIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'latestId',
        value: '',
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> numEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'num',
        value: value,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> numGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'num',
        value: value,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> numLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'num',
        value: value,
      ));
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterFilterCondition> numBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'num',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DefeatQueryObject on QueryBuilder<Defeat, Defeat, QFilterCondition> {}

extension DefeatQueryLinks on QueryBuilder<Defeat, Defeat, QFilterCondition> {}

extension DefeatQuerySortBy on QueryBuilder<Defeat, Defeat, QSortBy> {
  QueryBuilder<Defeat, Defeat, QAfterSortBy> sortByCoopEnemy10() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy10', Sort.asc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> sortByCoopEnemy10Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy10', Sort.desc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> sortByCoopEnemy11() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy11', Sort.asc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> sortByCoopEnemy11Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy11', Sort.desc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> sortByCoopEnemy12() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy12', Sort.asc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> sortByCoopEnemy12Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy12', Sort.desc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> sortByCoopEnemy13() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy13', Sort.asc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> sortByCoopEnemy13Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy13', Sort.desc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> sortByCoopEnemy14() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy14', Sort.asc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> sortByCoopEnemy14Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy14', Sort.desc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> sortByCoopEnemy4() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy4', Sort.asc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> sortByCoopEnemy4Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy4', Sort.desc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> sortByCoopEnemy5() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy5', Sort.asc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> sortByCoopEnemy5Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy5', Sort.desc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> sortByCoopEnemy6() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy6', Sort.asc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> sortByCoopEnemy6Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy6', Sort.desc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> sortByCoopEnemy7() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy7', Sort.asc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> sortByCoopEnemy7Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy7', Sort.desc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> sortByCoopEnemy8() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy8', Sort.asc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> sortByCoopEnemy8Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy8', Sort.desc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> sortByCoopEnemy9() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy9', Sort.asc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> sortByCoopEnemy9Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy9', Sort.desc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> sortByLatestId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latestId', Sort.asc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> sortByLatestIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latestId', Sort.desc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> sortByNum() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'num', Sort.asc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> sortByNumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'num', Sort.desc);
    });
  }
}

extension DefeatQuerySortThenBy on QueryBuilder<Defeat, Defeat, QSortThenBy> {
  QueryBuilder<Defeat, Defeat, QAfterSortBy> thenByCoopEnemy10() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy10', Sort.asc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> thenByCoopEnemy10Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy10', Sort.desc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> thenByCoopEnemy11() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy11', Sort.asc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> thenByCoopEnemy11Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy11', Sort.desc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> thenByCoopEnemy12() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy12', Sort.asc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> thenByCoopEnemy12Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy12', Sort.desc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> thenByCoopEnemy13() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy13', Sort.asc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> thenByCoopEnemy13Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy13', Sort.desc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> thenByCoopEnemy14() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy14', Sort.asc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> thenByCoopEnemy14Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy14', Sort.desc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> thenByCoopEnemy4() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy4', Sort.asc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> thenByCoopEnemy4Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy4', Sort.desc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> thenByCoopEnemy5() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy5', Sort.asc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> thenByCoopEnemy5Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy5', Sort.desc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> thenByCoopEnemy6() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy6', Sort.asc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> thenByCoopEnemy6Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy6', Sort.desc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> thenByCoopEnemy7() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy7', Sort.asc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> thenByCoopEnemy7Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy7', Sort.desc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> thenByCoopEnemy8() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy8', Sort.asc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> thenByCoopEnemy8Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy8', Sort.desc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> thenByCoopEnemy9() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy9', Sort.asc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> thenByCoopEnemy9Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy9', Sort.desc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> thenByLatestId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latestId', Sort.asc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> thenByLatestIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latestId', Sort.desc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> thenByNum() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'num', Sort.asc);
    });
  }

  QueryBuilder<Defeat, Defeat, QAfterSortBy> thenByNumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'num', Sort.desc);
    });
  }
}

extension DefeatQueryWhereDistinct on QueryBuilder<Defeat, Defeat, QDistinct> {
  QueryBuilder<Defeat, Defeat, QDistinct> distinctByCoopEnemy10() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coopEnemy10');
    });
  }

  QueryBuilder<Defeat, Defeat, QDistinct> distinctByCoopEnemy11() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coopEnemy11');
    });
  }

  QueryBuilder<Defeat, Defeat, QDistinct> distinctByCoopEnemy12() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coopEnemy12');
    });
  }

  QueryBuilder<Defeat, Defeat, QDistinct> distinctByCoopEnemy13() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coopEnemy13');
    });
  }

  QueryBuilder<Defeat, Defeat, QDistinct> distinctByCoopEnemy14() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coopEnemy14');
    });
  }

  QueryBuilder<Defeat, Defeat, QDistinct> distinctByCoopEnemy4() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coopEnemy4');
    });
  }

  QueryBuilder<Defeat, Defeat, QDistinct> distinctByCoopEnemy5() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coopEnemy5');
    });
  }

  QueryBuilder<Defeat, Defeat, QDistinct> distinctByCoopEnemy6() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coopEnemy6');
    });
  }

  QueryBuilder<Defeat, Defeat, QDistinct> distinctByCoopEnemy7() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coopEnemy7');
    });
  }

  QueryBuilder<Defeat, Defeat, QDistinct> distinctByCoopEnemy8() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coopEnemy8');
    });
  }

  QueryBuilder<Defeat, Defeat, QDistinct> distinctByCoopEnemy9() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coopEnemy9');
    });
  }

  QueryBuilder<Defeat, Defeat, QDistinct> distinctByLatestId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'latestId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Defeat, Defeat, QDistinct> distinctByNum() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'num');
    });
  }
}

extension DefeatQueryProperty on QueryBuilder<Defeat, Defeat, QQueryProperty> {
  QueryBuilder<Defeat, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Defeat, int, QQueryOperations> coopEnemy10Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coopEnemy10');
    });
  }

  QueryBuilder<Defeat, int, QQueryOperations> coopEnemy11Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coopEnemy11');
    });
  }

  QueryBuilder<Defeat, int, QQueryOperations> coopEnemy12Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coopEnemy12');
    });
  }

  QueryBuilder<Defeat, int, QQueryOperations> coopEnemy13Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coopEnemy13');
    });
  }

  QueryBuilder<Defeat, int, QQueryOperations> coopEnemy14Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coopEnemy14');
    });
  }

  QueryBuilder<Defeat, int, QQueryOperations> coopEnemy4Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coopEnemy4');
    });
  }

  QueryBuilder<Defeat, int, QQueryOperations> coopEnemy5Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coopEnemy5');
    });
  }

  QueryBuilder<Defeat, int, QQueryOperations> coopEnemy6Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coopEnemy6');
    });
  }

  QueryBuilder<Defeat, int, QQueryOperations> coopEnemy7Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coopEnemy7');
    });
  }

  QueryBuilder<Defeat, int, QQueryOperations> coopEnemy8Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coopEnemy8');
    });
  }

  QueryBuilder<Defeat, int, QQueryOperations> coopEnemy9Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coopEnemy9');
    });
  }

  QueryBuilder<Defeat, String, QQueryOperations> latestIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'latestId');
    });
  }

  QueryBuilder<Defeat, int, QQueryOperations> numProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'num');
    });
  }
}
