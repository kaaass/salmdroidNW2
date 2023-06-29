// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetShiftCollection on Isar {
  IsarCollection<Shift> get shifts => this.collection();
}

const ShiftSchema = CollectionSchema(
  name: r'Shift',
  id: 2206702943977601259,
  properties: {
    r'end': PropertySchema(
      id: 0,
      name: r'end',
      type: IsarType.string,
    ),
    r'kingSalmonids': PropertySchema(
      id: 1,
      name: r'kingSalmonids',
      type: IsarType.string,
    ),
    r'maxEggs': PropertySchema(
      id: 2,
      name: r'maxEggs',
      type: IsarType.long,
    ),
    r'maxGradeId': PropertySchema(
      id: 3,
      name: r'maxGradeId',
      type: IsarType.string,
    ),
    r'maxGradePoint': PropertySchema(
      id: 4,
      name: r'maxGradePoint',
      type: IsarType.long,
    ),
    r'played': PropertySchema(
      id: 5,
      name: r'played',
      type: IsarType.long,
    ),
    r'rule': PropertySchema(
      id: 6,
      name: r'rule',
      type: IsarType.string,
    ),
    r'stageId': PropertySchema(
      id: 7,
      name: r'stageId',
      type: IsarType.string,
    ),
    r'start': PropertySchema(
      id: 8,
      name: r'start',
      type: IsarType.string,
    ),
    r'weapons': PropertySchema(
      id: 9,
      name: r'weapons',
      type: IsarType.stringList,
    )
  },
  estimateSize: _shiftEstimateSize,
  serialize: _shiftSerialize,
  deserialize: _shiftDeserialize,
  deserializeProp: _shiftDeserializeProp,
  idName: r'id',
  indexes: {
    r'start': IndexSchema(
      id: -5775659401471708833,
      name: r'start',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'start',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _shiftGetId,
  getLinks: _shiftGetLinks,
  attach: _shiftAttach,
  version: '3.1.0+1',
);

int _shiftEstimateSize(
  Shift object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.end.length * 3;
  bytesCount += 3 + object.kingSalmonids.length * 3;
  bytesCount += 3 + object.maxGradeId.length * 3;
  bytesCount += 3 + object.rule.length * 3;
  bytesCount += 3 + object.stageId.length * 3;
  bytesCount += 3 + object.start.length * 3;
  bytesCount += 3 + object.weapons.length * 3;
  {
    for (var i = 0; i < object.weapons.length; i++) {
      final value = object.weapons[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _shiftSerialize(
  Shift object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.end);
  writer.writeString(offsets[1], object.kingSalmonids);
  writer.writeLong(offsets[2], object.maxEggs);
  writer.writeString(offsets[3], object.maxGradeId);
  writer.writeLong(offsets[4], object.maxGradePoint);
  writer.writeLong(offsets[5], object.played);
  writer.writeString(offsets[6], object.rule);
  writer.writeString(offsets[7], object.stageId);
  writer.writeString(offsets[8], object.start);
  writer.writeStringList(offsets[9], object.weapons);
}

Shift _shiftDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Shift();
  object.end = reader.readString(offsets[0]);
  object.id = id;
  object.kingSalmonids = reader.readString(offsets[1]);
  object.maxEggs = reader.readLong(offsets[2]);
  object.maxGradeId = reader.readString(offsets[3]);
  object.maxGradePoint = reader.readLong(offsets[4]);
  object.played = reader.readLong(offsets[5]);
  object.rule = reader.readString(offsets[6]);
  object.stageId = reader.readString(offsets[7]);
  object.start = reader.readString(offsets[8]);
  object.weapons = reader.readStringList(offsets[9]) ?? [];
  return object;
}

P _shiftDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readStringList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _shiftGetId(Shift object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _shiftGetLinks(Shift object) {
  return [];
}

void _shiftAttach(IsarCollection<dynamic> col, Id id, Shift object) {
  object.id = id;
}

extension ShiftQueryWhereSort on QueryBuilder<Shift, Shift, QWhere> {
  QueryBuilder<Shift, Shift, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ShiftQueryWhere on QueryBuilder<Shift, Shift, QWhereClause> {
  QueryBuilder<Shift, Shift, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Shift, Shift, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Shift, Shift, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Shift, Shift, QAfterWhereClause> idBetween(
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

  QueryBuilder<Shift, Shift, QAfterWhereClause> startEqualTo(String start) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'start',
        value: [start],
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterWhereClause> startNotEqualTo(String start) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'start',
              lower: [],
              upper: [start],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'start',
              lower: [start],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'start',
              lower: [start],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'start',
              lower: [],
              upper: [start],
              includeUpper: false,
            ));
      }
    });
  }
}

extension ShiftQueryFilter on QueryBuilder<Shift, Shift, QFilterCondition> {
  QueryBuilder<Shift, Shift, QAfterFilterCondition> endEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'end',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> endGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'end',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> endLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'end',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> endBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'end',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> endStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'end',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> endEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'end',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> endContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'end',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> endMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'end',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> endIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'end',
        value: '',
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> endIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'end',
        value: '',
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Shift, Shift, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Shift, Shift, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Shift, Shift, QAfterFilterCondition> kingSalmonidsEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kingSalmonids',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> kingSalmonidsGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'kingSalmonids',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> kingSalmonidsLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'kingSalmonids',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> kingSalmonidsBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'kingSalmonids',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> kingSalmonidsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'kingSalmonids',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> kingSalmonidsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'kingSalmonids',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> kingSalmonidsContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'kingSalmonids',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> kingSalmonidsMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'kingSalmonids',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> kingSalmonidsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kingSalmonids',
        value: '',
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> kingSalmonidsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'kingSalmonids',
        value: '',
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> maxEggsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxEggs',
        value: value,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> maxEggsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxEggs',
        value: value,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> maxEggsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxEggs',
        value: value,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> maxEggsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxEggs',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> maxGradeIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxGradeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> maxGradeIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxGradeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> maxGradeIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxGradeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> maxGradeIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxGradeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> maxGradeIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'maxGradeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> maxGradeIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'maxGradeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> maxGradeIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'maxGradeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> maxGradeIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'maxGradeId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> maxGradeIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxGradeId',
        value: '',
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> maxGradeIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'maxGradeId',
        value: '',
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> maxGradePointEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxGradePoint',
        value: value,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> maxGradePointGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxGradePoint',
        value: value,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> maxGradePointLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxGradePoint',
        value: value,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> maxGradePointBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxGradePoint',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> playedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'played',
        value: value,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> playedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'played',
        value: value,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> playedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'played',
        value: value,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> playedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'played',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> ruleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rule',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> ruleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rule',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> ruleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rule',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> ruleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rule',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> ruleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'rule',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> ruleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'rule',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> ruleContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rule',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> ruleMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rule',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> ruleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rule',
        value: '',
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> ruleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rule',
        value: '',
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> stageIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stageId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> stageIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stageId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> stageIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stageId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> stageIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stageId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> stageIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'stageId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> stageIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'stageId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> stageIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'stageId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> stageIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'stageId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> stageIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stageId',
        value: '',
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> stageIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'stageId',
        value: '',
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> startEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'start',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> startGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'start',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> startLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'start',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> startBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'start',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> startStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'start',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> startEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'start',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> startContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'start',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> startMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'start',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> startIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'start',
        value: '',
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> startIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'start',
        value: '',
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> weaponsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weapons',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> weaponsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weapons',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> weaponsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weapons',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> weaponsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weapons',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> weaponsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'weapons',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> weaponsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'weapons',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> weaponsElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'weapons',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> weaponsElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'weapons',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> weaponsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weapons',
        value: '',
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> weaponsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'weapons',
        value: '',
      ));
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> weaponsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weapons',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> weaponsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weapons',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> weaponsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weapons',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> weaponsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weapons',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> weaponsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weapons',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Shift, Shift, QAfterFilterCondition> weaponsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weapons',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension ShiftQueryObject on QueryBuilder<Shift, Shift, QFilterCondition> {}

extension ShiftQueryLinks on QueryBuilder<Shift, Shift, QFilterCondition> {}

extension ShiftQuerySortBy on QueryBuilder<Shift, Shift, QSortBy> {
  QueryBuilder<Shift, Shift, QAfterSortBy> sortByEnd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'end', Sort.asc);
    });
  }

  QueryBuilder<Shift, Shift, QAfterSortBy> sortByEndDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'end', Sort.desc);
    });
  }

  QueryBuilder<Shift, Shift, QAfterSortBy> sortByKingSalmonids() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kingSalmonids', Sort.asc);
    });
  }

  QueryBuilder<Shift, Shift, QAfterSortBy> sortByKingSalmonidsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kingSalmonids', Sort.desc);
    });
  }

  QueryBuilder<Shift, Shift, QAfterSortBy> sortByMaxEggs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxEggs', Sort.asc);
    });
  }

  QueryBuilder<Shift, Shift, QAfterSortBy> sortByMaxEggsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxEggs', Sort.desc);
    });
  }

  QueryBuilder<Shift, Shift, QAfterSortBy> sortByMaxGradeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxGradeId', Sort.asc);
    });
  }

  QueryBuilder<Shift, Shift, QAfterSortBy> sortByMaxGradeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxGradeId', Sort.desc);
    });
  }

  QueryBuilder<Shift, Shift, QAfterSortBy> sortByMaxGradePoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxGradePoint', Sort.asc);
    });
  }

  QueryBuilder<Shift, Shift, QAfterSortBy> sortByMaxGradePointDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxGradePoint', Sort.desc);
    });
  }

  QueryBuilder<Shift, Shift, QAfterSortBy> sortByPlayed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'played', Sort.asc);
    });
  }

  QueryBuilder<Shift, Shift, QAfterSortBy> sortByPlayedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'played', Sort.desc);
    });
  }

  QueryBuilder<Shift, Shift, QAfterSortBy> sortByRule() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rule', Sort.asc);
    });
  }

  QueryBuilder<Shift, Shift, QAfterSortBy> sortByRuleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rule', Sort.desc);
    });
  }

  QueryBuilder<Shift, Shift, QAfterSortBy> sortByStageId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stageId', Sort.asc);
    });
  }

  QueryBuilder<Shift, Shift, QAfterSortBy> sortByStageIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stageId', Sort.desc);
    });
  }

  QueryBuilder<Shift, Shift, QAfterSortBy> sortByStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'start', Sort.asc);
    });
  }

  QueryBuilder<Shift, Shift, QAfterSortBy> sortByStartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'start', Sort.desc);
    });
  }
}

extension ShiftQuerySortThenBy on QueryBuilder<Shift, Shift, QSortThenBy> {
  QueryBuilder<Shift, Shift, QAfterSortBy> thenByEnd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'end', Sort.asc);
    });
  }

  QueryBuilder<Shift, Shift, QAfterSortBy> thenByEndDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'end', Sort.desc);
    });
  }

  QueryBuilder<Shift, Shift, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Shift, Shift, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Shift, Shift, QAfterSortBy> thenByKingSalmonids() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kingSalmonids', Sort.asc);
    });
  }

  QueryBuilder<Shift, Shift, QAfterSortBy> thenByKingSalmonidsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kingSalmonids', Sort.desc);
    });
  }

  QueryBuilder<Shift, Shift, QAfterSortBy> thenByMaxEggs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxEggs', Sort.asc);
    });
  }

  QueryBuilder<Shift, Shift, QAfterSortBy> thenByMaxEggsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxEggs', Sort.desc);
    });
  }

  QueryBuilder<Shift, Shift, QAfterSortBy> thenByMaxGradeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxGradeId', Sort.asc);
    });
  }

  QueryBuilder<Shift, Shift, QAfterSortBy> thenByMaxGradeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxGradeId', Sort.desc);
    });
  }

  QueryBuilder<Shift, Shift, QAfterSortBy> thenByMaxGradePoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxGradePoint', Sort.asc);
    });
  }

  QueryBuilder<Shift, Shift, QAfterSortBy> thenByMaxGradePointDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxGradePoint', Sort.desc);
    });
  }

  QueryBuilder<Shift, Shift, QAfterSortBy> thenByPlayed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'played', Sort.asc);
    });
  }

  QueryBuilder<Shift, Shift, QAfterSortBy> thenByPlayedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'played', Sort.desc);
    });
  }

  QueryBuilder<Shift, Shift, QAfterSortBy> thenByRule() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rule', Sort.asc);
    });
  }

  QueryBuilder<Shift, Shift, QAfterSortBy> thenByRuleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rule', Sort.desc);
    });
  }

  QueryBuilder<Shift, Shift, QAfterSortBy> thenByStageId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stageId', Sort.asc);
    });
  }

  QueryBuilder<Shift, Shift, QAfterSortBy> thenByStageIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stageId', Sort.desc);
    });
  }

  QueryBuilder<Shift, Shift, QAfterSortBy> thenByStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'start', Sort.asc);
    });
  }

  QueryBuilder<Shift, Shift, QAfterSortBy> thenByStartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'start', Sort.desc);
    });
  }
}

extension ShiftQueryWhereDistinct on QueryBuilder<Shift, Shift, QDistinct> {
  QueryBuilder<Shift, Shift, QDistinct> distinctByEnd(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'end', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Shift, Shift, QDistinct> distinctByKingSalmonids(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'kingSalmonids',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Shift, Shift, QDistinct> distinctByMaxEggs() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxEggs');
    });
  }

  QueryBuilder<Shift, Shift, QDistinct> distinctByMaxGradeId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxGradeId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Shift, Shift, QDistinct> distinctByMaxGradePoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxGradePoint');
    });
  }

  QueryBuilder<Shift, Shift, QDistinct> distinctByPlayed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'played');
    });
  }

  QueryBuilder<Shift, Shift, QDistinct> distinctByRule(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rule', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Shift, Shift, QDistinct> distinctByStageId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stageId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Shift, Shift, QDistinct> distinctByStart(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'start', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Shift, Shift, QDistinct> distinctByWeapons() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weapons');
    });
  }
}

extension ShiftQueryProperty on QueryBuilder<Shift, Shift, QQueryProperty> {
  QueryBuilder<Shift, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Shift, String, QQueryOperations> endProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'end');
    });
  }

  QueryBuilder<Shift, String, QQueryOperations> kingSalmonidsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'kingSalmonids');
    });
  }

  QueryBuilder<Shift, int, QQueryOperations> maxEggsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxEggs');
    });
  }

  QueryBuilder<Shift, String, QQueryOperations> maxGradeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxGradeId');
    });
  }

  QueryBuilder<Shift, int, QQueryOperations> maxGradePointProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxGradePoint');
    });
  }

  QueryBuilder<Shift, int, QQueryOperations> playedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'played');
    });
  }

  QueryBuilder<Shift, String, QQueryOperations> ruleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rule');
    });
  }

  QueryBuilder<Shift, String, QQueryOperations> stageIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stageId');
    });
  }

  QueryBuilder<Shift, String, QQueryOperations> startProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'start');
    });
  }

  QueryBuilder<Shift, List<String>, QQueryOperations> weaponsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weapons');
    });
  }
}
