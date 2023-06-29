// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'king_defeat.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetKingDefeatCollection on Isar {
  IsarCollection<KingDefeat> get kingDefeats => this.collection();
}

const KingDefeatSchema = CollectionSchema(
  name: r'KingDefeat',
  id: -617086247936616824,
  properties: {
    r'coopEnemy23': PropertySchema(
      id: 0,
      name: r'coopEnemy23',
      type: IsarType.long,
    ),
    r'coopEnemy24': PropertySchema(
      id: 1,
      name: r'coopEnemy24',
      type: IsarType.long,
    ),
    r'latestId': PropertySchema(
      id: 2,
      name: r'latestId',
      type: IsarType.string,
    ),
    r'num': PropertySchema(
      id: 3,
      name: r'num',
      type: IsarType.long,
    )
  },
  estimateSize: _kingDefeatEstimateSize,
  serialize: _kingDefeatSerialize,
  deserialize: _kingDefeatDeserialize,
  deserializeProp: _kingDefeatDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _kingDefeatGetId,
  getLinks: _kingDefeatGetLinks,
  attach: _kingDefeatAttach,
  version: '3.1.0+1',
);

int _kingDefeatEstimateSize(
  KingDefeat object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.latestId.length * 3;
  return bytesCount;
}

void _kingDefeatSerialize(
  KingDefeat object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.coopEnemy23);
  writer.writeLong(offsets[1], object.coopEnemy24);
  writer.writeString(offsets[2], object.latestId);
  writer.writeLong(offsets[3], object.num);
}

KingDefeat _kingDefeatDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = KingDefeat();
  object.coopEnemy23 = reader.readLong(offsets[0]);
  object.coopEnemy24 = reader.readLong(offsets[1]);
  object.id = id;
  object.latestId = reader.readString(offsets[2]);
  object.num = reader.readLong(offsets[3]);
  return object;
}

P _kingDefeatDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _kingDefeatGetId(KingDefeat object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _kingDefeatGetLinks(KingDefeat object) {
  return [];
}

void _kingDefeatAttach(IsarCollection<dynamic> col, Id id, KingDefeat object) {
  object.id = id;
}

extension KingDefeatQueryWhereSort
    on QueryBuilder<KingDefeat, KingDefeat, QWhere> {
  QueryBuilder<KingDefeat, KingDefeat, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension KingDefeatQueryWhere
    on QueryBuilder<KingDefeat, KingDefeat, QWhereClause> {
  QueryBuilder<KingDefeat, KingDefeat, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<KingDefeat, KingDefeat, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<KingDefeat, KingDefeat, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<KingDefeat, KingDefeat, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<KingDefeat, KingDefeat, QAfterWhereClause> idBetween(
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

extension KingDefeatQueryFilter
    on QueryBuilder<KingDefeat, KingDefeat, QFilterCondition> {
  QueryBuilder<KingDefeat, KingDefeat, QAfterFilterCondition>
      coopEnemy23EqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coopEnemy23',
        value: value,
      ));
    });
  }

  QueryBuilder<KingDefeat, KingDefeat, QAfterFilterCondition>
      coopEnemy23GreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'coopEnemy23',
        value: value,
      ));
    });
  }

  QueryBuilder<KingDefeat, KingDefeat, QAfterFilterCondition>
      coopEnemy23LessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'coopEnemy23',
        value: value,
      ));
    });
  }

  QueryBuilder<KingDefeat, KingDefeat, QAfterFilterCondition>
      coopEnemy23Between(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'coopEnemy23',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<KingDefeat, KingDefeat, QAfterFilterCondition>
      coopEnemy24EqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coopEnemy24',
        value: value,
      ));
    });
  }

  QueryBuilder<KingDefeat, KingDefeat, QAfterFilterCondition>
      coopEnemy24GreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'coopEnemy24',
        value: value,
      ));
    });
  }

  QueryBuilder<KingDefeat, KingDefeat, QAfterFilterCondition>
      coopEnemy24LessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'coopEnemy24',
        value: value,
      ));
    });
  }

  QueryBuilder<KingDefeat, KingDefeat, QAfterFilterCondition>
      coopEnemy24Between(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'coopEnemy24',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<KingDefeat, KingDefeat, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<KingDefeat, KingDefeat, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<KingDefeat, KingDefeat, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<KingDefeat, KingDefeat, QAfterFilterCondition> idBetween(
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

  QueryBuilder<KingDefeat, KingDefeat, QAfterFilterCondition> latestIdEqualTo(
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

  QueryBuilder<KingDefeat, KingDefeat, QAfterFilterCondition>
      latestIdGreaterThan(
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

  QueryBuilder<KingDefeat, KingDefeat, QAfterFilterCondition> latestIdLessThan(
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

  QueryBuilder<KingDefeat, KingDefeat, QAfterFilterCondition> latestIdBetween(
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

  QueryBuilder<KingDefeat, KingDefeat, QAfterFilterCondition>
      latestIdStartsWith(
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

  QueryBuilder<KingDefeat, KingDefeat, QAfterFilterCondition> latestIdEndsWith(
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

  QueryBuilder<KingDefeat, KingDefeat, QAfterFilterCondition> latestIdContains(
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

  QueryBuilder<KingDefeat, KingDefeat, QAfterFilterCondition> latestIdMatches(
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

  QueryBuilder<KingDefeat, KingDefeat, QAfterFilterCondition>
      latestIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'latestId',
        value: '',
      ));
    });
  }

  QueryBuilder<KingDefeat, KingDefeat, QAfterFilterCondition>
      latestIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'latestId',
        value: '',
      ));
    });
  }

  QueryBuilder<KingDefeat, KingDefeat, QAfterFilterCondition> numEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'num',
        value: value,
      ));
    });
  }

  QueryBuilder<KingDefeat, KingDefeat, QAfterFilterCondition> numGreaterThan(
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

  QueryBuilder<KingDefeat, KingDefeat, QAfterFilterCondition> numLessThan(
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

  QueryBuilder<KingDefeat, KingDefeat, QAfterFilterCondition> numBetween(
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

extension KingDefeatQueryObject
    on QueryBuilder<KingDefeat, KingDefeat, QFilterCondition> {}

extension KingDefeatQueryLinks
    on QueryBuilder<KingDefeat, KingDefeat, QFilterCondition> {}

extension KingDefeatQuerySortBy
    on QueryBuilder<KingDefeat, KingDefeat, QSortBy> {
  QueryBuilder<KingDefeat, KingDefeat, QAfterSortBy> sortByCoopEnemy23() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy23', Sort.asc);
    });
  }

  QueryBuilder<KingDefeat, KingDefeat, QAfterSortBy> sortByCoopEnemy23Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy23', Sort.desc);
    });
  }

  QueryBuilder<KingDefeat, KingDefeat, QAfterSortBy> sortByCoopEnemy24() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy24', Sort.asc);
    });
  }

  QueryBuilder<KingDefeat, KingDefeat, QAfterSortBy> sortByCoopEnemy24Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy24', Sort.desc);
    });
  }

  QueryBuilder<KingDefeat, KingDefeat, QAfterSortBy> sortByLatestId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latestId', Sort.asc);
    });
  }

  QueryBuilder<KingDefeat, KingDefeat, QAfterSortBy> sortByLatestIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latestId', Sort.desc);
    });
  }

  QueryBuilder<KingDefeat, KingDefeat, QAfterSortBy> sortByNum() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'num', Sort.asc);
    });
  }

  QueryBuilder<KingDefeat, KingDefeat, QAfterSortBy> sortByNumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'num', Sort.desc);
    });
  }
}

extension KingDefeatQuerySortThenBy
    on QueryBuilder<KingDefeat, KingDefeat, QSortThenBy> {
  QueryBuilder<KingDefeat, KingDefeat, QAfterSortBy> thenByCoopEnemy23() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy23', Sort.asc);
    });
  }

  QueryBuilder<KingDefeat, KingDefeat, QAfterSortBy> thenByCoopEnemy23Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy23', Sort.desc);
    });
  }

  QueryBuilder<KingDefeat, KingDefeat, QAfterSortBy> thenByCoopEnemy24() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy24', Sort.asc);
    });
  }

  QueryBuilder<KingDefeat, KingDefeat, QAfterSortBy> thenByCoopEnemy24Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coopEnemy24', Sort.desc);
    });
  }

  QueryBuilder<KingDefeat, KingDefeat, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<KingDefeat, KingDefeat, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<KingDefeat, KingDefeat, QAfterSortBy> thenByLatestId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latestId', Sort.asc);
    });
  }

  QueryBuilder<KingDefeat, KingDefeat, QAfterSortBy> thenByLatestIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latestId', Sort.desc);
    });
  }

  QueryBuilder<KingDefeat, KingDefeat, QAfterSortBy> thenByNum() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'num', Sort.asc);
    });
  }

  QueryBuilder<KingDefeat, KingDefeat, QAfterSortBy> thenByNumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'num', Sort.desc);
    });
  }
}

extension KingDefeatQueryWhereDistinct
    on QueryBuilder<KingDefeat, KingDefeat, QDistinct> {
  QueryBuilder<KingDefeat, KingDefeat, QDistinct> distinctByCoopEnemy23() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coopEnemy23');
    });
  }

  QueryBuilder<KingDefeat, KingDefeat, QDistinct> distinctByCoopEnemy24() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coopEnemy24');
    });
  }

  QueryBuilder<KingDefeat, KingDefeat, QDistinct> distinctByLatestId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'latestId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<KingDefeat, KingDefeat, QDistinct> distinctByNum() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'num');
    });
  }
}

extension KingDefeatQueryProperty
    on QueryBuilder<KingDefeat, KingDefeat, QQueryProperty> {
  QueryBuilder<KingDefeat, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<KingDefeat, int, QQueryOperations> coopEnemy23Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coopEnemy23');
    });
  }

  QueryBuilder<KingDefeat, int, QQueryOperations> coopEnemy24Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coopEnemy24');
    });
  }

  QueryBuilder<KingDefeat, String, QQueryOperations> latestIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'latestId');
    });
  }

  QueryBuilder<KingDefeat, int, QQueryOperations> numProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'num');
    });
  }
}
