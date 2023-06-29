// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coop_history_detail.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCoopHistoryDetailCollection on Isar {
  IsarCollection<CoopHistoryDetail> get coopHistoryDetails => this.collection();
}

const CoopHistoryDetailSchema = CollectionSchema(
  name: r'CoopHistoryDetail',
  id: 547071332020987791,
  properties: {
    r'afterGrade': PropertySchema(
      id: 0,
      name: r'afterGrade',
      type: IsarType.object,
      target: r'AfterGrade',
    ),
    r'afterGradePoint': PropertySchema(
      id: 1,
      name: r'afterGradePoint',
      type: IsarType.long,
    ),
    r'bossResult': PropertySchema(
      id: 2,
      name: r'bossResult',
      type: IsarType.object,
      target: r'BossResult',
    ),
    r'coopStage': PropertySchema(
      id: 3,
      name: r'coopStage',
      type: IsarType.object,
      target: r'CoopStage',
    ),
    r'dangerRate': PropertySchema(
      id: 4,
      name: r'dangerRate',
      type: IsarType.double,
    ),
    r'enemyResults': PropertySchema(
      id: 5,
      name: r'enemyResults',
      type: IsarType.objectList,
      target: r'EnemyResult',
    ),
    r'historyId': PropertySchema(
      id: 6,
      name: r'historyId',
      type: IsarType.string,
    ),
    r'jobBonus': PropertySchema(
      id: 7,
      name: r'jobBonus',
      type: IsarType.long,
    ),
    r'jobPoint': PropertySchema(
      id: 8,
      name: r'jobPoint',
      type: IsarType.long,
    ),
    r'jobRate': PropertySchema(
      id: 9,
      name: r'jobRate',
      type: IsarType.double,
    ),
    r'jobScore': PropertySchema(
      id: 10,
      name: r'jobScore',
      type: IsarType.long,
    ),
    r'memberResults': PropertySchema(
      id: 11,
      name: r'memberResults',
      type: IsarType.objectList,
      target: r'PlayerResult',
    ),
    r'myResult': PropertySchema(
      id: 12,
      name: r'myResult',
      type: IsarType.object,
      target: r'PlayerResult',
    ),
    r'nextHistoryDetail': PropertySchema(
      id: 13,
      name: r'nextHistoryDetail',
      type: IsarType.object,
      target: r'HistoryDetail',
    ),
    r'playedTime': PropertySchema(
      id: 14,
      name: r'playedTime',
      type: IsarType.string,
    ),
    r'prevHistoryDetail': PropertySchema(
      id: 15,
      name: r'prevHistoryDetail',
      type: IsarType.object,
      target: r'HistoryDetail',
    ),
    r'resultWave': PropertySchema(
      id: 16,
      name: r'resultWave',
      type: IsarType.long,
    ),
    r'rule': PropertySchema(
      id: 17,
      name: r'rule',
      type: IsarType.string,
    ),
    r'scale': PropertySchema(
      id: 18,
      name: r'scale',
      type: IsarType.object,
      target: r'Scale',
    ),
    r'scenarioCode': PropertySchema(
      id: 19,
      name: r'scenarioCode',
      type: IsarType.string,
    ),
    r'smellMeter': PropertySchema(
      id: 20,
      name: r'smellMeter',
      type: IsarType.long,
    ),
    r'waveResults': PropertySchema(
      id: 21,
      name: r'waveResults',
      type: IsarType.objectList,
      target: r'WaveResult',
    ),
    r'weapons': PropertySchema(
      id: 22,
      name: r'weapons',
      type: IsarType.objectList,
      target: r'Weapon',
    )
  },
  estimateSize: _coopHistoryDetailEstimateSize,
  serialize: _coopHistoryDetailSerialize,
  deserialize: _coopHistoryDetailDeserialize,
  deserializeProp: _coopHistoryDetailDeserializeProp,
  idName: r'id',
  indexes: {
    r'playedTime': IndexSchema(
      id: 5304876285609367001,
      name: r'playedTime',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'playedTime',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {
    r'AfterGrade': AfterGradeSchema,
    r'PlayerResult': PlayerResultSchema,
    r'Player': PlayerSchema,
    r'Nameplate': NameplateSchema,
    r'Badge': BadgeSchema,
    r'Url': UrlSchema,
    r'Background': BackgroundSchema,
    r'TextColor': TextColorSchema,
    r'Uniform': UniformSchema,
    r'Weapon': WeaponSchema,
    r'SpecialWeapon': SpecialWeaponSchema,
    r'BossResult': BossResultSchema,
    r'Boss': BossSchema,
    r'EnemyResult': EnemyResultSchema,
    r'WaveResult': WaveResultSchema,
    r'EventWave': EventWaveSchema,
    r'CoopStage': CoopStageSchema,
    r'Scale': ScaleSchema,
    r'HistoryDetail': HistoryDetailSchema
  },
  getId: _coopHistoryDetailGetId,
  getLinks: _coopHistoryDetailGetLinks,
  attach: _coopHistoryDetailAttach,
  version: '3.1.0+1',
);

int _coopHistoryDetailEstimateSize(
  CoopHistoryDetail object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.afterGrade;
    if (value != null) {
      bytesCount += 3 +
          AfterGradeSchema.estimateSize(
              value, allOffsets[AfterGrade]!, allOffsets);
    }
  }
  {
    final value = object.bossResult;
    if (value != null) {
      bytesCount += 3 +
          BossResultSchema.estimateSize(
              value, allOffsets[BossResult]!, allOffsets);
    }
  }
  bytesCount += 3 +
      CoopStageSchema.estimateSize(
          object.coopStage, allOffsets[CoopStage]!, allOffsets);
  bytesCount += 3 + object.enemyResults.length * 3;
  {
    final offsets = allOffsets[EnemyResult]!;
    for (var i = 0; i < object.enemyResults.length; i++) {
      final value = object.enemyResults[i];
      bytesCount += EnemyResultSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.historyId.length * 3;
  bytesCount += 3 + object.memberResults.length * 3;
  {
    final offsets = allOffsets[PlayerResult]!;
    for (var i = 0; i < object.memberResults.length; i++) {
      final value = object.memberResults[i];
      bytesCount += PlayerResultSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 +
      PlayerResultSchema.estimateSize(
          object.myResult, allOffsets[PlayerResult]!, allOffsets);
  {
    final value = object.nextHistoryDetail;
    if (value != null) {
      bytesCount += 3 +
          HistoryDetailSchema.estimateSize(
              value, allOffsets[HistoryDetail]!, allOffsets);
    }
  }
  bytesCount += 3 + object.playedTime.length * 3;
  {
    final value = object.prevHistoryDetail;
    if (value != null) {
      bytesCount += 3 +
          HistoryDetailSchema.estimateSize(
              value, allOffsets[HistoryDetail]!, allOffsets);
    }
  }
  bytesCount += 3 + object.rule.length * 3;
  {
    final value = object.scale;
    if (value != null) {
      bytesCount +=
          3 + ScaleSchema.estimateSize(value, allOffsets[Scale]!, allOffsets);
    }
  }
  {
    final value = object.scenarioCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.waveResults.length * 3;
  {
    final offsets = allOffsets[WaveResult]!;
    for (var i = 0; i < object.waveResults.length; i++) {
      final value = object.waveResults[i];
      bytesCount += WaveResultSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.weapons.length * 3;
  {
    final offsets = allOffsets[Weapon]!;
    for (var i = 0; i < object.weapons.length; i++) {
      final value = object.weapons[i];
      bytesCount += WeaponSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _coopHistoryDetailSerialize(
  CoopHistoryDetail object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<AfterGrade>(
    offsets[0],
    allOffsets,
    AfterGradeSchema.serialize,
    object.afterGrade,
  );
  writer.writeLong(offsets[1], object.afterGradePoint);
  writer.writeObject<BossResult>(
    offsets[2],
    allOffsets,
    BossResultSchema.serialize,
    object.bossResult,
  );
  writer.writeObject<CoopStage>(
    offsets[3],
    allOffsets,
    CoopStageSchema.serialize,
    object.coopStage,
  );
  writer.writeDouble(offsets[4], object.dangerRate);
  writer.writeObjectList<EnemyResult>(
    offsets[5],
    allOffsets,
    EnemyResultSchema.serialize,
    object.enemyResults,
  );
  writer.writeString(offsets[6], object.historyId);
  writer.writeLong(offsets[7], object.jobBonus);
  writer.writeLong(offsets[8], object.jobPoint);
  writer.writeDouble(offsets[9], object.jobRate);
  writer.writeLong(offsets[10], object.jobScore);
  writer.writeObjectList<PlayerResult>(
    offsets[11],
    allOffsets,
    PlayerResultSchema.serialize,
    object.memberResults,
  );
  writer.writeObject<PlayerResult>(
    offsets[12],
    allOffsets,
    PlayerResultSchema.serialize,
    object.myResult,
  );
  writer.writeObject<HistoryDetail>(
    offsets[13],
    allOffsets,
    HistoryDetailSchema.serialize,
    object.nextHistoryDetail,
  );
  writer.writeString(offsets[14], object.playedTime);
  writer.writeObject<HistoryDetail>(
    offsets[15],
    allOffsets,
    HistoryDetailSchema.serialize,
    object.prevHistoryDetail,
  );
  writer.writeLong(offsets[16], object.resultWave);
  writer.writeString(offsets[17], object.rule);
  writer.writeObject<Scale>(
    offsets[18],
    allOffsets,
    ScaleSchema.serialize,
    object.scale,
  );
  writer.writeString(offsets[19], object.scenarioCode);
  writer.writeLong(offsets[20], object.smellMeter);
  writer.writeObjectList<WaveResult>(
    offsets[21],
    allOffsets,
    WaveResultSchema.serialize,
    object.waveResults,
  );
  writer.writeObjectList<Weapon>(
    offsets[22],
    allOffsets,
    WeaponSchema.serialize,
    object.weapons,
  );
}

CoopHistoryDetail _coopHistoryDetailDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CoopHistoryDetail();
  object.afterGrade = reader.readObjectOrNull<AfterGrade>(
    offsets[0],
    AfterGradeSchema.deserialize,
    allOffsets,
  );
  object.afterGradePoint = reader.readLongOrNull(offsets[1]);
  object.bossResult = reader.readObjectOrNull<BossResult>(
    offsets[2],
    BossResultSchema.deserialize,
    allOffsets,
  );
  object.coopStage = reader.readObjectOrNull<CoopStage>(
        offsets[3],
        CoopStageSchema.deserialize,
        allOffsets,
      ) ??
      CoopStage();
  object.dangerRate = reader.readDouble(offsets[4]);
  object.enemyResults = reader.readObjectList<EnemyResult>(
        offsets[5],
        EnemyResultSchema.deserialize,
        allOffsets,
        EnemyResult(),
      ) ??
      [];
  object.historyId = reader.readString(offsets[6]);
  object.id = id;
  object.jobBonus = reader.readLongOrNull(offsets[7]);
  object.jobPoint = reader.readLongOrNull(offsets[8]);
  object.jobRate = reader.readDoubleOrNull(offsets[9]);
  object.jobScore = reader.readLongOrNull(offsets[10]);
  object.memberResults = reader.readObjectList<PlayerResult>(
        offsets[11],
        PlayerResultSchema.deserialize,
        allOffsets,
        PlayerResult(),
      ) ??
      [];
  object.myResult = reader.readObjectOrNull<PlayerResult>(
        offsets[12],
        PlayerResultSchema.deserialize,
        allOffsets,
      ) ??
      PlayerResult();
  object.nextHistoryDetail = reader.readObjectOrNull<HistoryDetail>(
    offsets[13],
    HistoryDetailSchema.deserialize,
    allOffsets,
  );
  object.playedTime = reader.readString(offsets[14]);
  object.prevHistoryDetail = reader.readObjectOrNull<HistoryDetail>(
    offsets[15],
    HistoryDetailSchema.deserialize,
    allOffsets,
  );
  object.resultWave = reader.readLong(offsets[16]);
  object.rule = reader.readString(offsets[17]);
  object.scale = reader.readObjectOrNull<Scale>(
    offsets[18],
    ScaleSchema.deserialize,
    allOffsets,
  );
  object.scenarioCode = reader.readStringOrNull(offsets[19]);
  object.smellMeter = reader.readLongOrNull(offsets[20]);
  object.waveResults = reader.readObjectList<WaveResult>(
        offsets[21],
        WaveResultSchema.deserialize,
        allOffsets,
        WaveResult(),
      ) ??
      [];
  object.weapons = reader.readObjectList<Weapon>(
        offsets[22],
        WeaponSchema.deserialize,
        allOffsets,
        Weapon(),
      ) ??
      [];
  return object;
}

P _coopHistoryDetailDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<AfterGrade>(
        offset,
        AfterGradeSchema.deserialize,
        allOffsets,
      )) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readObjectOrNull<BossResult>(
        offset,
        BossResultSchema.deserialize,
        allOffsets,
      )) as P;
    case 3:
      return (reader.readObjectOrNull<CoopStage>(
            offset,
            CoopStageSchema.deserialize,
            allOffsets,
          ) ??
          CoopStage()) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readObjectList<EnemyResult>(
            offset,
            EnemyResultSchema.deserialize,
            allOffsets,
            EnemyResult(),
          ) ??
          []) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readDoubleOrNull(offset)) as P;
    case 10:
      return (reader.readLongOrNull(offset)) as P;
    case 11:
      return (reader.readObjectList<PlayerResult>(
            offset,
            PlayerResultSchema.deserialize,
            allOffsets,
            PlayerResult(),
          ) ??
          []) as P;
    case 12:
      return (reader.readObjectOrNull<PlayerResult>(
            offset,
            PlayerResultSchema.deserialize,
            allOffsets,
          ) ??
          PlayerResult()) as P;
    case 13:
      return (reader.readObjectOrNull<HistoryDetail>(
        offset,
        HistoryDetailSchema.deserialize,
        allOffsets,
      )) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readObjectOrNull<HistoryDetail>(
        offset,
        HistoryDetailSchema.deserialize,
        allOffsets,
      )) as P;
    case 16:
      return (reader.readLong(offset)) as P;
    case 17:
      return (reader.readString(offset)) as P;
    case 18:
      return (reader.readObjectOrNull<Scale>(
        offset,
        ScaleSchema.deserialize,
        allOffsets,
      )) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readLongOrNull(offset)) as P;
    case 21:
      return (reader.readObjectList<WaveResult>(
            offset,
            WaveResultSchema.deserialize,
            allOffsets,
            WaveResult(),
          ) ??
          []) as P;
    case 22:
      return (reader.readObjectList<Weapon>(
            offset,
            WeaponSchema.deserialize,
            allOffsets,
            Weapon(),
          ) ??
          []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _coopHistoryDetailGetId(CoopHistoryDetail object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _coopHistoryDetailGetLinks(
    CoopHistoryDetail object) {
  return [];
}

void _coopHistoryDetailAttach(
    IsarCollection<dynamic> col, Id id, CoopHistoryDetail object) {
  object.id = id;
}

extension CoopHistoryDetailQueryWhereSort
    on QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QWhere> {
  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CoopHistoryDetailQueryWhere
    on QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QWhereClause> {
  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterWhereClause>
      idBetween(
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

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterWhereClause>
      playedTimeEqualTo(String playedTime) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'playedTime',
        value: [playedTime],
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterWhereClause>
      playedTimeNotEqualTo(String playedTime) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'playedTime',
              lower: [],
              upper: [playedTime],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'playedTime',
              lower: [playedTime],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'playedTime',
              lower: [playedTime],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'playedTime',
              lower: [],
              upper: [playedTime],
              includeUpper: false,
            ));
      }
    });
  }
}

extension CoopHistoryDetailQueryFilter
    on QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QFilterCondition> {
  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      afterGradeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'afterGrade',
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      afterGradeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'afterGrade',
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      afterGradePointIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'afterGradePoint',
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      afterGradePointIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'afterGradePoint',
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      afterGradePointEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'afterGradePoint',
        value: value,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      afterGradePointGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'afterGradePoint',
        value: value,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      afterGradePointLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'afterGradePoint',
        value: value,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      afterGradePointBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'afterGradePoint',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      bossResultIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bossResult',
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      bossResultIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bossResult',
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      dangerRateEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dangerRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      dangerRateGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dangerRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      dangerRateLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dangerRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      dangerRateBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dangerRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      enemyResultsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'enemyResults',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      enemyResultsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'enemyResults',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      enemyResultsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'enemyResults',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      enemyResultsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'enemyResults',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      enemyResultsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'enemyResults',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      enemyResultsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'enemyResults',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      historyIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'historyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      historyIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'historyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      historyIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'historyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      historyIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'historyId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      historyIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'historyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      historyIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'historyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      historyIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'historyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      historyIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'historyId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      historyIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'historyId',
        value: '',
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      historyIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'historyId',
        value: '',
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      jobBonusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'jobBonus',
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      jobBonusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'jobBonus',
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      jobBonusEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobBonus',
        value: value,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      jobBonusGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'jobBonus',
        value: value,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      jobBonusLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'jobBonus',
        value: value,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      jobBonusBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'jobBonus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      jobPointIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'jobPoint',
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      jobPointIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'jobPoint',
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      jobPointEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobPoint',
        value: value,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      jobPointGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'jobPoint',
        value: value,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      jobPointLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'jobPoint',
        value: value,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      jobPointBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'jobPoint',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      jobRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'jobRate',
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      jobRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'jobRate',
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      jobRateEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      jobRateGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'jobRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      jobRateLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'jobRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      jobRateBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'jobRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      jobScoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'jobScore',
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      jobScoreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'jobScore',
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      jobScoreEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobScore',
        value: value,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      jobScoreGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'jobScore',
        value: value,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      jobScoreLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'jobScore',
        value: value,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      jobScoreBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'jobScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      memberResultsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'memberResults',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      memberResultsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'memberResults',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      memberResultsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'memberResults',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      memberResultsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'memberResults',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      memberResultsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'memberResults',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      memberResultsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'memberResults',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      nextHistoryDetailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nextHistoryDetail',
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      nextHistoryDetailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nextHistoryDetail',
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      playedTimeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'playedTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      playedTimeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'playedTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      playedTimeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'playedTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      playedTimeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'playedTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      playedTimeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'playedTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      playedTimeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'playedTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      playedTimeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'playedTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      playedTimeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'playedTime',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      playedTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'playedTime',
        value: '',
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      playedTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'playedTime',
        value: '',
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      prevHistoryDetailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'prevHistoryDetail',
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      prevHistoryDetailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'prevHistoryDetail',
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      resultWaveEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'resultWave',
        value: value,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      resultWaveGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'resultWave',
        value: value,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      resultWaveLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'resultWave',
        value: value,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      resultWaveBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'resultWave',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      ruleEqualTo(
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

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      ruleGreaterThan(
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

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      ruleLessThan(
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

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      ruleBetween(
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

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      ruleStartsWith(
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

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      ruleEndsWith(
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

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      ruleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rule',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      ruleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rule',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      ruleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rule',
        value: '',
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      ruleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rule',
        value: '',
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      scaleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'scale',
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      scaleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'scale',
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      scenarioCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'scenarioCode',
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      scenarioCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'scenarioCode',
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      scenarioCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scenarioCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      scenarioCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'scenarioCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      scenarioCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'scenarioCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      scenarioCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'scenarioCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      scenarioCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'scenarioCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      scenarioCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'scenarioCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      scenarioCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'scenarioCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      scenarioCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'scenarioCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      scenarioCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scenarioCode',
        value: '',
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      scenarioCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'scenarioCode',
        value: '',
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      smellMeterIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'smellMeter',
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      smellMeterIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'smellMeter',
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      smellMeterEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'smellMeter',
        value: value,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      smellMeterGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'smellMeter',
        value: value,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      smellMeterLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'smellMeter',
        value: value,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      smellMeterBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'smellMeter',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      waveResultsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'waveResults',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      waveResultsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'waveResults',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      waveResultsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'waveResults',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      waveResultsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'waveResults',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      waveResultsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'waveResults',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      waveResultsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'waveResults',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      weaponsLengthEqualTo(int length) {
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

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      weaponsIsEmpty() {
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

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      weaponsIsNotEmpty() {
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

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      weaponsLengthLessThan(
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

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      weaponsLengthGreaterThan(
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

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      weaponsLengthBetween(
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

extension CoopHistoryDetailQueryObject
    on QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QFilterCondition> {
  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      afterGrade(FilterQuery<AfterGrade> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'afterGrade');
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      bossResult(FilterQuery<BossResult> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'bossResult');
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      coopStage(FilterQuery<CoopStage> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'coopStage');
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      enemyResultsElement(FilterQuery<EnemyResult> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'enemyResults');
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      memberResultsElement(FilterQuery<PlayerResult> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'memberResults');
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      myResult(FilterQuery<PlayerResult> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'myResult');
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      nextHistoryDetail(FilterQuery<HistoryDetail> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'nextHistoryDetail');
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      prevHistoryDetail(FilterQuery<HistoryDetail> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'prevHistoryDetail');
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      scale(FilterQuery<Scale> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'scale');
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      waveResultsElement(FilterQuery<WaveResult> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'waveResults');
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterFilterCondition>
      weaponsElement(FilterQuery<Weapon> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'weapons');
    });
  }
}

extension CoopHistoryDetailQueryLinks
    on QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QFilterCondition> {}

extension CoopHistoryDetailQuerySortBy
    on QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QSortBy> {
  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      sortByAfterGradePoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'afterGradePoint', Sort.asc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      sortByAfterGradePointDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'afterGradePoint', Sort.desc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      sortByDangerRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dangerRate', Sort.asc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      sortByDangerRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dangerRate', Sort.desc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      sortByHistoryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'historyId', Sort.asc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      sortByHistoryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'historyId', Sort.desc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      sortByJobBonus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobBonus', Sort.asc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      sortByJobBonusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobBonus', Sort.desc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      sortByJobPoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobPoint', Sort.asc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      sortByJobPointDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobPoint', Sort.desc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      sortByJobRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobRate', Sort.asc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      sortByJobRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobRate', Sort.desc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      sortByJobScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobScore', Sort.asc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      sortByJobScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobScore', Sort.desc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      sortByPlayedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playedTime', Sort.asc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      sortByPlayedTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playedTime', Sort.desc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      sortByResultWave() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resultWave', Sort.asc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      sortByResultWaveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resultWave', Sort.desc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      sortByRule() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rule', Sort.asc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      sortByRuleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rule', Sort.desc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      sortByScenarioCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scenarioCode', Sort.asc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      sortByScenarioCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scenarioCode', Sort.desc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      sortBySmellMeter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smellMeter', Sort.asc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      sortBySmellMeterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smellMeter', Sort.desc);
    });
  }
}

extension CoopHistoryDetailQuerySortThenBy
    on QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QSortThenBy> {
  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      thenByAfterGradePoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'afterGradePoint', Sort.asc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      thenByAfterGradePointDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'afterGradePoint', Sort.desc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      thenByDangerRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dangerRate', Sort.asc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      thenByDangerRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dangerRate', Sort.desc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      thenByHistoryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'historyId', Sort.asc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      thenByHistoryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'historyId', Sort.desc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      thenByJobBonus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobBonus', Sort.asc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      thenByJobBonusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobBonus', Sort.desc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      thenByJobPoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobPoint', Sort.asc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      thenByJobPointDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobPoint', Sort.desc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      thenByJobRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobRate', Sort.asc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      thenByJobRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobRate', Sort.desc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      thenByJobScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobScore', Sort.asc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      thenByJobScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobScore', Sort.desc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      thenByPlayedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playedTime', Sort.asc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      thenByPlayedTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playedTime', Sort.desc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      thenByResultWave() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resultWave', Sort.asc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      thenByResultWaveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resultWave', Sort.desc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      thenByRule() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rule', Sort.asc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      thenByRuleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rule', Sort.desc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      thenByScenarioCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scenarioCode', Sort.asc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      thenByScenarioCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scenarioCode', Sort.desc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      thenBySmellMeter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smellMeter', Sort.asc);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QAfterSortBy>
      thenBySmellMeterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smellMeter', Sort.desc);
    });
  }
}

extension CoopHistoryDetailQueryWhereDistinct
    on QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QDistinct> {
  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QDistinct>
      distinctByAfterGradePoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'afterGradePoint');
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QDistinct>
      distinctByDangerRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dangerRate');
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QDistinct>
      distinctByHistoryId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'historyId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QDistinct>
      distinctByJobBonus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jobBonus');
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QDistinct>
      distinctByJobPoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jobPoint');
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QDistinct>
      distinctByJobRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jobRate');
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QDistinct>
      distinctByJobScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jobScore');
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QDistinct>
      distinctByPlayedTime({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'playedTime', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QDistinct>
      distinctByResultWave() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'resultWave');
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QDistinct> distinctByRule(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rule', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QDistinct>
      distinctByScenarioCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scenarioCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QDistinct>
      distinctBySmellMeter() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'smellMeter');
    });
  }
}

extension CoopHistoryDetailQueryProperty
    on QueryBuilder<CoopHistoryDetail, CoopHistoryDetail, QQueryProperty> {
  QueryBuilder<CoopHistoryDetail, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CoopHistoryDetail, AfterGrade?, QQueryOperations>
      afterGradeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'afterGrade');
    });
  }

  QueryBuilder<CoopHistoryDetail, int?, QQueryOperations>
      afterGradePointProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'afterGradePoint');
    });
  }

  QueryBuilder<CoopHistoryDetail, BossResult?, QQueryOperations>
      bossResultProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bossResult');
    });
  }

  QueryBuilder<CoopHistoryDetail, CoopStage, QQueryOperations>
      coopStageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coopStage');
    });
  }

  QueryBuilder<CoopHistoryDetail, double, QQueryOperations>
      dangerRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dangerRate');
    });
  }

  QueryBuilder<CoopHistoryDetail, List<EnemyResult>, QQueryOperations>
      enemyResultsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enemyResults');
    });
  }

  QueryBuilder<CoopHistoryDetail, String, QQueryOperations>
      historyIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'historyId');
    });
  }

  QueryBuilder<CoopHistoryDetail, int?, QQueryOperations> jobBonusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jobBonus');
    });
  }

  QueryBuilder<CoopHistoryDetail, int?, QQueryOperations> jobPointProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jobPoint');
    });
  }

  QueryBuilder<CoopHistoryDetail, double?, QQueryOperations> jobRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jobRate');
    });
  }

  QueryBuilder<CoopHistoryDetail, int?, QQueryOperations> jobScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jobScore');
    });
  }

  QueryBuilder<CoopHistoryDetail, List<PlayerResult>, QQueryOperations>
      memberResultsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'memberResults');
    });
  }

  QueryBuilder<CoopHistoryDetail, PlayerResult, QQueryOperations>
      myResultProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'myResult');
    });
  }

  QueryBuilder<CoopHistoryDetail, HistoryDetail?, QQueryOperations>
      nextHistoryDetailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nextHistoryDetail');
    });
  }

  QueryBuilder<CoopHistoryDetail, String, QQueryOperations>
      playedTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'playedTime');
    });
  }

  QueryBuilder<CoopHistoryDetail, HistoryDetail?, QQueryOperations>
      prevHistoryDetailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'prevHistoryDetail');
    });
  }

  QueryBuilder<CoopHistoryDetail, int, QQueryOperations> resultWaveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'resultWave');
    });
  }

  QueryBuilder<CoopHistoryDetail, String, QQueryOperations> ruleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rule');
    });
  }

  QueryBuilder<CoopHistoryDetail, Scale?, QQueryOperations> scaleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scale');
    });
  }

  QueryBuilder<CoopHistoryDetail, String?, QQueryOperations>
      scenarioCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scenarioCode');
    });
  }

  QueryBuilder<CoopHistoryDetail, int?, QQueryOperations> smellMeterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'smellMeter');
    });
  }

  QueryBuilder<CoopHistoryDetail, List<WaveResult>, QQueryOperations>
      waveResultsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'waveResults');
    });
  }

  QueryBuilder<CoopHistoryDetail, List<Weapon>, QQueryOperations>
      weaponsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weapons');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const AfterGradeSchema = Schema(
  name: r'AfterGrade',
  id: 5699085977765055965,
  properties: {
    r'id': PropertySchema(
      id: 0,
      name: r'id',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _afterGradeEstimateSize,
  serialize: _afterGradeSerialize,
  deserialize: _afterGradeDeserialize,
  deserializeProp: _afterGradeDeserializeProp,
);

int _afterGradeEstimateSize(
  AfterGrade object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.id.length * 3;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _afterGradeSerialize(
  AfterGrade object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.id);
  writer.writeString(offsets[1], object.name);
}

AfterGrade _afterGradeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AfterGrade();
  object.id = reader.readString(offsets[0]);
  object.name = reader.readString(offsets[1]);
  return object;
}

P _afterGradeDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension AfterGradeQueryFilter
    on QueryBuilder<AfterGrade, AfterGrade, QFilterCondition> {
  QueryBuilder<AfterGrade, AfterGrade, QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AfterGrade, AfterGrade, QAfterFilterCondition> idGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AfterGrade, AfterGrade, QAfterFilterCondition> idLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AfterGrade, AfterGrade, QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AfterGrade, AfterGrade, QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AfterGrade, AfterGrade, QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AfterGrade, AfterGrade, QAfterFilterCondition> idContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AfterGrade, AfterGrade, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AfterGrade, AfterGrade, QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<AfterGrade, AfterGrade, QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<AfterGrade, AfterGrade, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AfterGrade, AfterGrade, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AfterGrade, AfterGrade, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AfterGrade, AfterGrade, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AfterGrade, AfterGrade, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AfterGrade, AfterGrade, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AfterGrade, AfterGrade, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AfterGrade, AfterGrade, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AfterGrade, AfterGrade, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<AfterGrade, AfterGrade, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension AfterGradeQueryObject
    on QueryBuilder<AfterGrade, AfterGrade, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const PlayerResultSchema = Schema(
  name: r'PlayerResult',
  id: 4030580167141576379,
  properties: {
    r'defeatEnemyCount': PropertySchema(
      id: 0,
      name: r'defeatEnemyCount',
      type: IsarType.long,
    ),
    r'deliverCount': PropertySchema(
      id: 1,
      name: r'deliverCount',
      type: IsarType.long,
    ),
    r'goldenAssistCount': PropertySchema(
      id: 2,
      name: r'goldenAssistCount',
      type: IsarType.long,
    ),
    r'goldenDeliverCount': PropertySchema(
      id: 3,
      name: r'goldenDeliverCount',
      type: IsarType.long,
    ),
    r'player': PropertySchema(
      id: 4,
      name: r'player',
      type: IsarType.object,
      target: r'Player',
    ),
    r'rescueCount': PropertySchema(
      id: 5,
      name: r'rescueCount',
      type: IsarType.long,
    ),
    r'rescuedCount': PropertySchema(
      id: 6,
      name: r'rescuedCount',
      type: IsarType.long,
    ),
    r'specialWeapon': PropertySchema(
      id: 7,
      name: r'specialWeapon',
      type: IsarType.object,
      target: r'SpecialWeapon',
    ),
    r'weapons': PropertySchema(
      id: 8,
      name: r'weapons',
      type: IsarType.objectList,
      target: r'Weapon',
    )
  },
  estimateSize: _playerResultEstimateSize,
  serialize: _playerResultSerialize,
  deserialize: _playerResultDeserialize,
  deserializeProp: _playerResultDeserializeProp,
);

int _playerResultEstimateSize(
  PlayerResult object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 +
      PlayerSchema.estimateSize(object.player, allOffsets[Player]!, allOffsets);
  {
    final value = object.specialWeapon;
    if (value != null) {
      bytesCount += 3 +
          SpecialWeaponSchema.estimateSize(
              value, allOffsets[SpecialWeapon]!, allOffsets);
    }
  }
  bytesCount += 3 + object.weapons.length * 3;
  {
    final offsets = allOffsets[Weapon]!;
    for (var i = 0; i < object.weapons.length; i++) {
      final value = object.weapons[i];
      bytesCount += WeaponSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _playerResultSerialize(
  PlayerResult object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.defeatEnemyCount);
  writer.writeLong(offsets[1], object.deliverCount);
  writer.writeLong(offsets[2], object.goldenAssistCount);
  writer.writeLong(offsets[3], object.goldenDeliverCount);
  writer.writeObject<Player>(
    offsets[4],
    allOffsets,
    PlayerSchema.serialize,
    object.player,
  );
  writer.writeLong(offsets[5], object.rescueCount);
  writer.writeLong(offsets[6], object.rescuedCount);
  writer.writeObject<SpecialWeapon>(
    offsets[7],
    allOffsets,
    SpecialWeaponSchema.serialize,
    object.specialWeapon,
  );
  writer.writeObjectList<Weapon>(
    offsets[8],
    allOffsets,
    WeaponSchema.serialize,
    object.weapons,
  );
}

PlayerResult _playerResultDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PlayerResult();
  object.defeatEnemyCount = reader.readLong(offsets[0]);
  object.deliverCount = reader.readLong(offsets[1]);
  object.goldenAssistCount = reader.readLong(offsets[2]);
  object.goldenDeliverCount = reader.readLong(offsets[3]);
  object.player = reader.readObjectOrNull<Player>(
        offsets[4],
        PlayerSchema.deserialize,
        allOffsets,
      ) ??
      Player();
  object.rescueCount = reader.readLong(offsets[5]);
  object.rescuedCount = reader.readLong(offsets[6]);
  object.specialWeapon = reader.readObjectOrNull<SpecialWeapon>(
    offsets[7],
    SpecialWeaponSchema.deserialize,
    allOffsets,
  );
  object.weapons = reader.readObjectList<Weapon>(
        offsets[8],
        WeaponSchema.deserialize,
        allOffsets,
        Weapon(),
      ) ??
      [];
  return object;
}

P _playerResultDeserializeProp<P>(
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
      return (reader.readObjectOrNull<Player>(
            offset,
            PlayerSchema.deserialize,
            allOffsets,
          ) ??
          Player()) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readObjectOrNull<SpecialWeapon>(
        offset,
        SpecialWeaponSchema.deserialize,
        allOffsets,
      )) as P;
    case 8:
      return (reader.readObjectList<Weapon>(
            offset,
            WeaponSchema.deserialize,
            allOffsets,
            Weapon(),
          ) ??
          []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension PlayerResultQueryFilter
    on QueryBuilder<PlayerResult, PlayerResult, QFilterCondition> {
  QueryBuilder<PlayerResult, PlayerResult, QAfterFilterCondition>
      defeatEnemyCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'defeatEnemyCount',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerResult, PlayerResult, QAfterFilterCondition>
      defeatEnemyCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'defeatEnemyCount',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerResult, PlayerResult, QAfterFilterCondition>
      defeatEnemyCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'defeatEnemyCount',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerResult, PlayerResult, QAfterFilterCondition>
      defeatEnemyCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'defeatEnemyCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PlayerResult, PlayerResult, QAfterFilterCondition>
      deliverCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deliverCount',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerResult, PlayerResult, QAfterFilterCondition>
      deliverCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deliverCount',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerResult, PlayerResult, QAfterFilterCondition>
      deliverCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deliverCount',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerResult, PlayerResult, QAfterFilterCondition>
      deliverCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deliverCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PlayerResult, PlayerResult, QAfterFilterCondition>
      goldenAssistCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'goldenAssistCount',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerResult, PlayerResult, QAfterFilterCondition>
      goldenAssistCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'goldenAssistCount',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerResult, PlayerResult, QAfterFilterCondition>
      goldenAssistCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'goldenAssistCount',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerResult, PlayerResult, QAfterFilterCondition>
      goldenAssistCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'goldenAssistCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PlayerResult, PlayerResult, QAfterFilterCondition>
      goldenDeliverCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'goldenDeliverCount',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerResult, PlayerResult, QAfterFilterCondition>
      goldenDeliverCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'goldenDeliverCount',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerResult, PlayerResult, QAfterFilterCondition>
      goldenDeliverCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'goldenDeliverCount',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerResult, PlayerResult, QAfterFilterCondition>
      goldenDeliverCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'goldenDeliverCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PlayerResult, PlayerResult, QAfterFilterCondition>
      rescueCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rescueCount',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerResult, PlayerResult, QAfterFilterCondition>
      rescueCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rescueCount',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerResult, PlayerResult, QAfterFilterCondition>
      rescueCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rescueCount',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerResult, PlayerResult, QAfterFilterCondition>
      rescueCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rescueCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PlayerResult, PlayerResult, QAfterFilterCondition>
      rescuedCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rescuedCount',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerResult, PlayerResult, QAfterFilterCondition>
      rescuedCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rescuedCount',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerResult, PlayerResult, QAfterFilterCondition>
      rescuedCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rescuedCount',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerResult, PlayerResult, QAfterFilterCondition>
      rescuedCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rescuedCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PlayerResult, PlayerResult, QAfterFilterCondition>
      specialWeaponIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'specialWeapon',
      ));
    });
  }

  QueryBuilder<PlayerResult, PlayerResult, QAfterFilterCondition>
      specialWeaponIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'specialWeapon',
      ));
    });
  }

  QueryBuilder<PlayerResult, PlayerResult, QAfterFilterCondition>
      weaponsLengthEqualTo(int length) {
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

  QueryBuilder<PlayerResult, PlayerResult, QAfterFilterCondition>
      weaponsIsEmpty() {
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

  QueryBuilder<PlayerResult, PlayerResult, QAfterFilterCondition>
      weaponsIsNotEmpty() {
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

  QueryBuilder<PlayerResult, PlayerResult, QAfterFilterCondition>
      weaponsLengthLessThan(
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

  QueryBuilder<PlayerResult, PlayerResult, QAfterFilterCondition>
      weaponsLengthGreaterThan(
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

  QueryBuilder<PlayerResult, PlayerResult, QAfterFilterCondition>
      weaponsLengthBetween(
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

extension PlayerResultQueryObject
    on QueryBuilder<PlayerResult, PlayerResult, QFilterCondition> {
  QueryBuilder<PlayerResult, PlayerResult, QAfterFilterCondition> player(
      FilterQuery<Player> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'player');
    });
  }

  QueryBuilder<PlayerResult, PlayerResult, QAfterFilterCondition> specialWeapon(
      FilterQuery<SpecialWeapon> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'specialWeapon');
    });
  }

  QueryBuilder<PlayerResult, PlayerResult, QAfterFilterCondition>
      weaponsElement(FilterQuery<Weapon> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'weapons');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const PlayerSchema = Schema(
  name: r'Player',
  id: -1052842935974721688,
  properties: {
    r'byname': PropertySchema(
      id: 0,
      name: r'byname',
      type: IsarType.string,
    ),
    r'id': PropertySchema(
      id: 1,
      name: r'id',
      type: IsarType.string,
    ),
    r'isplayer': PropertySchema(
      id: 2,
      name: r'isplayer',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    ),
    r'nameId': PropertySchema(
      id: 4,
      name: r'nameId',
      type: IsarType.string,
    ),
    r'nameplate': PropertySchema(
      id: 5,
      name: r'nameplate',
      type: IsarType.object,
      target: r'Nameplate',
    ),
    r'species': PropertySchema(
      id: 6,
      name: r'species',
      type: IsarType.string,
    ),
    r'uniform': PropertySchema(
      id: 7,
      name: r'uniform',
      type: IsarType.object,
      target: r'Uniform',
    )
  },
  estimateSize: _playerEstimateSize,
  serialize: _playerSerialize,
  deserialize: _playerDeserialize,
  deserializeProp: _playerDeserializeProp,
);

int _playerEstimateSize(
  Player object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.byname.length * 3;
  bytesCount += 3 + object.id.length * 3;
  bytesCount += 3 + object.isplayer.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.nameId.length * 3;
  bytesCount += 3 +
      NameplateSchema.estimateSize(
          object.nameplate, allOffsets[Nameplate]!, allOffsets);
  bytesCount += 3 + object.species.length * 3;
  bytesCount += 3 +
      UniformSchema.estimateSize(
          object.uniform, allOffsets[Uniform]!, allOffsets);
  return bytesCount;
}

void _playerSerialize(
  Player object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.byname);
  writer.writeString(offsets[1], object.id);
  writer.writeString(offsets[2], object.isplayer);
  writer.writeString(offsets[3], object.name);
  writer.writeString(offsets[4], object.nameId);
  writer.writeObject<Nameplate>(
    offsets[5],
    allOffsets,
    NameplateSchema.serialize,
    object.nameplate,
  );
  writer.writeString(offsets[6], object.species);
  writer.writeObject<Uniform>(
    offsets[7],
    allOffsets,
    UniformSchema.serialize,
    object.uniform,
  );
}

Player _playerDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Player();
  object.byname = reader.readString(offsets[0]);
  object.id = reader.readString(offsets[1]);
  object.isplayer = reader.readString(offsets[2]);
  object.name = reader.readString(offsets[3]);
  object.nameId = reader.readString(offsets[4]);
  object.nameplate = reader.readObjectOrNull<Nameplate>(
        offsets[5],
        NameplateSchema.deserialize,
        allOffsets,
      ) ??
      Nameplate();
  object.species = reader.readString(offsets[6]);
  object.uniform = reader.readObjectOrNull<Uniform>(
        offsets[7],
        UniformSchema.deserialize,
        allOffsets,
      ) ??
      Uniform();
  return object;
}

P _playerDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readObjectOrNull<Nameplate>(
            offset,
            NameplateSchema.deserialize,
            allOffsets,
          ) ??
          Nameplate()) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readObjectOrNull<Uniform>(
            offset,
            UniformSchema.deserialize,
            allOffsets,
          ) ??
          Uniform()) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension PlayerQueryFilter on QueryBuilder<Player, Player, QFilterCondition> {
  QueryBuilder<Player, Player, QAfterFilterCondition> bynameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'byname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> bynameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'byname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> bynameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'byname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> bynameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'byname',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> bynameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'byname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> bynameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'byname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> bynameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'byname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> bynameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'byname',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> bynameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'byname',
        value: '',
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> bynameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'byname',
        value: '',
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> idGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> idLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> idContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> idMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> isplayerEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isplayer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> isplayerGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isplayer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> isplayerLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isplayer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> isplayerBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isplayer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> isplayerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'isplayer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> isplayerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'isplayer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> isplayerContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'isplayer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> isplayerMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'isplayer',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> isplayerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isplayer',
        value: '',
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> isplayerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'isplayer',
        value: '',
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> nameIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> nameIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nameId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> nameIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nameId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> nameIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nameId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> nameIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nameId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> nameIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nameId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> nameIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nameId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> nameIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nameId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> nameIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameId',
        value: '',
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> nameIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nameId',
        value: '',
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> speciesEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'species',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> speciesGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'species',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> speciesLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'species',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> speciesBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'species',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> speciesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'species',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> speciesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'species',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> speciesContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'species',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> speciesMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'species',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> speciesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'species',
        value: '',
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> speciesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'species',
        value: '',
      ));
    });
  }
}

extension PlayerQueryObject on QueryBuilder<Player, Player, QFilterCondition> {
  QueryBuilder<Player, Player, QAfterFilterCondition> nameplate(
      FilterQuery<Nameplate> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'nameplate');
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> uniform(
      FilterQuery<Uniform> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'uniform');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const NameplateSchema = Schema(
  name: r'Nameplate',
  id: -269624747771743981,
  properties: {
    r'background': PropertySchema(
      id: 0,
      name: r'background',
      type: IsarType.object,
      target: r'Background',
    ),
    r'badges': PropertySchema(
      id: 1,
      name: r'badges',
      type: IsarType.objectList,
      target: r'Badge',
    )
  },
  estimateSize: _nameplateEstimateSize,
  serialize: _nameplateSerialize,
  deserialize: _nameplateDeserialize,
  deserializeProp: _nameplateDeserializeProp,
);

int _nameplateEstimateSize(
  Nameplate object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 +
      BackgroundSchema.estimateSize(
          object.background, allOffsets[Background]!, allOffsets);
  bytesCount += 3 + object.badges.length * 3;
  {
    final offsets = allOffsets[Badge]!;
    for (var i = 0; i < object.badges.length; i++) {
      final value = object.badges[i];
      if (value != null) {
        bytesCount += BadgeSchema.estimateSize(value, offsets, allOffsets);
      }
    }
  }
  return bytesCount;
}

void _nameplateSerialize(
  Nameplate object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<Background>(
    offsets[0],
    allOffsets,
    BackgroundSchema.serialize,
    object.background,
  );
  writer.writeObjectList<Badge>(
    offsets[1],
    allOffsets,
    BadgeSchema.serialize,
    object.badges,
  );
}

Nameplate _nameplateDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Nameplate();
  object.background = reader.readObjectOrNull<Background>(
        offsets[0],
        BackgroundSchema.deserialize,
        allOffsets,
      ) ??
      Background();
  object.badges = reader.readObjectOrNullList<Badge>(
        offsets[1],
        BadgeSchema.deserialize,
        allOffsets,
      ) ??
      [];
  return object;
}

P _nameplateDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<Background>(
            offset,
            BackgroundSchema.deserialize,
            allOffsets,
          ) ??
          Background()) as P;
    case 1:
      return (reader.readObjectOrNullList<Badge>(
            offset,
            BadgeSchema.deserialize,
            allOffsets,
          ) ??
          []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension NameplateQueryFilter
    on QueryBuilder<Nameplate, Nameplate, QFilterCondition> {
  QueryBuilder<Nameplate, Nameplate, QAfterFilterCondition>
      badgesElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'badges',
      ));
    });
  }

  QueryBuilder<Nameplate, Nameplate, QAfterFilterCondition>
      badgesElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'badges',
      ));
    });
  }

  QueryBuilder<Nameplate, Nameplate, QAfterFilterCondition> badgesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'badges',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Nameplate, Nameplate, QAfterFilterCondition> badgesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'badges',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Nameplate, Nameplate, QAfterFilterCondition> badgesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'badges',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Nameplate, Nameplate, QAfterFilterCondition>
      badgesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'badges',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Nameplate, Nameplate, QAfterFilterCondition>
      badgesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'badges',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Nameplate, Nameplate, QAfterFilterCondition> badgesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'badges',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension NameplateQueryObject
    on QueryBuilder<Nameplate, Nameplate, QFilterCondition> {
  QueryBuilder<Nameplate, Nameplate, QAfterFilterCondition> background(
      FilterQuery<Background> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'background');
    });
  }

  QueryBuilder<Nameplate, Nameplate, QAfterFilterCondition> badgesElement(
      FilterQuery<Badge> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'badges');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const BackgroundSchema = Schema(
  name: r'Background',
  id: -5432158777051388817,
  properties: {
    r'id': PropertySchema(
      id: 0,
      name: r'id',
      type: IsarType.string,
    ),
    r'textColor': PropertySchema(
      id: 1,
      name: r'textColor',
      type: IsarType.object,
      target: r'TextColor',
    ),
    r'url': PropertySchema(
      id: 2,
      name: r'url',
      type: IsarType.object,
      target: r'Url',
    )
  },
  estimateSize: _backgroundEstimateSize,
  serialize: _backgroundSerialize,
  deserialize: _backgroundDeserialize,
  deserializeProp: _backgroundDeserializeProp,
);

int _backgroundEstimateSize(
  Background object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.id.length * 3;
  bytesCount += 3 +
      TextColorSchema.estimateSize(
          object.textColor, allOffsets[TextColor]!, allOffsets);
  bytesCount +=
      3 + UrlSchema.estimateSize(object.url, allOffsets[Url]!, allOffsets);
  return bytesCount;
}

void _backgroundSerialize(
  Background object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.id);
  writer.writeObject<TextColor>(
    offsets[1],
    allOffsets,
    TextColorSchema.serialize,
    object.textColor,
  );
  writer.writeObject<Url>(
    offsets[2],
    allOffsets,
    UrlSchema.serialize,
    object.url,
  );
}

Background _backgroundDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Background();
  object.id = reader.readString(offsets[0]);
  object.textColor = reader.readObjectOrNull<TextColor>(
        offsets[1],
        TextColorSchema.deserialize,
        allOffsets,
      ) ??
      TextColor();
  object.url = reader.readObjectOrNull<Url>(
        offsets[2],
        UrlSchema.deserialize,
        allOffsets,
      ) ??
      Url();
  return object;
}

P _backgroundDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<TextColor>(
            offset,
            TextColorSchema.deserialize,
            allOffsets,
          ) ??
          TextColor()) as P;
    case 2:
      return (reader.readObjectOrNull<Url>(
            offset,
            UrlSchema.deserialize,
            allOffsets,
          ) ??
          Url()) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension BackgroundQueryFilter
    on QueryBuilder<Background, Background, QFilterCondition> {
  QueryBuilder<Background, Background, QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Background, Background, QAfterFilterCondition> idGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Background, Background, QAfterFilterCondition> idLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Background, Background, QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Background, Background, QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Background, Background, QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Background, Background, QAfterFilterCondition> idContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Background, Background, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Background, Background, QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<Background, Background, QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }
}

extension BackgroundQueryObject
    on QueryBuilder<Background, Background, QFilterCondition> {
  QueryBuilder<Background, Background, QAfterFilterCondition> textColor(
      FilterQuery<TextColor> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'textColor');
    });
  }

  QueryBuilder<Background, Background, QAfterFilterCondition> url(
      FilterQuery<Url> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'url');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const TextColorSchema = Schema(
  name: r'TextColor',
  id: 7290128455891123296,
  properties: {
    r'a': PropertySchema(
      id: 0,
      name: r'a',
      type: IsarType.double,
    ),
    r'b': PropertySchema(
      id: 1,
      name: r'b',
      type: IsarType.double,
    ),
    r'g': PropertySchema(
      id: 2,
      name: r'g',
      type: IsarType.double,
    ),
    r'r': PropertySchema(
      id: 3,
      name: r'r',
      type: IsarType.double,
    )
  },
  estimateSize: _textColorEstimateSize,
  serialize: _textColorSerialize,
  deserialize: _textColorDeserialize,
  deserializeProp: _textColorDeserializeProp,
);

int _textColorEstimateSize(
  TextColor object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _textColorSerialize(
  TextColor object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.a);
  writer.writeDouble(offsets[1], object.b);
  writer.writeDouble(offsets[2], object.g);
  writer.writeDouble(offsets[3], object.r);
}

TextColor _textColorDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TextColor();
  object.a = reader.readDouble(offsets[0]);
  object.b = reader.readDouble(offsets[1]);
  object.g = reader.readDouble(offsets[2]);
  object.r = reader.readDouble(offsets[3]);
  return object;
}

P _textColorDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension TextColorQueryFilter
    on QueryBuilder<TextColor, TextColor, QFilterCondition> {
  QueryBuilder<TextColor, TextColor, QAfterFilterCondition> aEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'a',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TextColor, TextColor, QAfterFilterCondition> aGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'a',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TextColor, TextColor, QAfterFilterCondition> aLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'a',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TextColor, TextColor, QAfterFilterCondition> aBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'a',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TextColor, TextColor, QAfterFilterCondition> bEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'b',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TextColor, TextColor, QAfterFilterCondition> bGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'b',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TextColor, TextColor, QAfterFilterCondition> bLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'b',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TextColor, TextColor, QAfterFilterCondition> bBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'b',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TextColor, TextColor, QAfterFilterCondition> gEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'g',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TextColor, TextColor, QAfterFilterCondition> gGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'g',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TextColor, TextColor, QAfterFilterCondition> gLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'g',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TextColor, TextColor, QAfterFilterCondition> gBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'g',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TextColor, TextColor, QAfterFilterCondition> rEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'r',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TextColor, TextColor, QAfterFilterCondition> rGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'r',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TextColor, TextColor, QAfterFilterCondition> rLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'r',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TextColor, TextColor, QAfterFilterCondition> rBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'r',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension TextColorQueryObject
    on QueryBuilder<TextColor, TextColor, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const UrlSchema = Schema(
  name: r'Url',
  id: -4123948750620638102,
  properties: {
    r'url': PropertySchema(
      id: 0,
      name: r'url',
      type: IsarType.string,
    )
  },
  estimateSize: _urlEstimateSize,
  serialize: _urlSerialize,
  deserialize: _urlDeserialize,
  deserializeProp: _urlDeserializeProp,
);

int _urlEstimateSize(
  Url object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.url.length * 3;
  return bytesCount;
}

void _urlSerialize(
  Url object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.url);
}

Url _urlDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Url();
  object.url = reader.readString(offsets[0]);
  return object;
}

P _urlDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension UrlQueryFilter on QueryBuilder<Url, Url, QFilterCondition> {
  QueryBuilder<Url, Url, QAfterFilterCondition> urlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Url, Url, QAfterFilterCondition> urlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Url, Url, QAfterFilterCondition> urlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Url, Url, QAfterFilterCondition> urlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'url',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Url, Url, QAfterFilterCondition> urlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Url, Url, QAfterFilterCondition> urlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Url, Url, QAfterFilterCondition> urlContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Url, Url, QAfterFilterCondition> urlMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'url',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Url, Url, QAfterFilterCondition> urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: '',
      ));
    });
  }

  QueryBuilder<Url, Url, QAfterFilterCondition> urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'url',
        value: '',
      ));
    });
  }
}

extension UrlQueryObject on QueryBuilder<Url, Url, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const BadgeSchema = Schema(
  name: r'Badge',
  id: -7407612234180284598,
  properties: {
    r'id': PropertySchema(
      id: 0,
      name: r'id',
      type: IsarType.string,
    ),
    r'image': PropertySchema(
      id: 1,
      name: r'image',
      type: IsarType.object,
      target: r'Url',
    )
  },
  estimateSize: _badgeEstimateSize,
  serialize: _badgeSerialize,
  deserialize: _badgeDeserialize,
  deserializeProp: _badgeDeserializeProp,
);

int _badgeEstimateSize(
  Badge object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.id.length * 3;
  bytesCount +=
      3 + UrlSchema.estimateSize(object.image, allOffsets[Url]!, allOffsets);
  return bytesCount;
}

void _badgeSerialize(
  Badge object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.id);
  writer.writeObject<Url>(
    offsets[1],
    allOffsets,
    UrlSchema.serialize,
    object.image,
  );
}

Badge _badgeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Badge();
  object.id = reader.readString(offsets[0]);
  object.image = reader.readObjectOrNull<Url>(
        offsets[1],
        UrlSchema.deserialize,
        allOffsets,
      ) ??
      Url();
  return object;
}

P _badgeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<Url>(
            offset,
            UrlSchema.deserialize,
            allOffsets,
          ) ??
          Url()) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension BadgeQueryFilter on QueryBuilder<Badge, Badge, QFilterCondition> {
  QueryBuilder<Badge, Badge, QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Badge, Badge, QAfterFilterCondition> idGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Badge, Badge, QAfterFilterCondition> idLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Badge, Badge, QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Badge, Badge, QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Badge, Badge, QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Badge, Badge, QAfterFilterCondition> idContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Badge, Badge, QAfterFilterCondition> idMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Badge, Badge, QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<Badge, Badge, QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }
}

extension BadgeQueryObject on QueryBuilder<Badge, Badge, QFilterCondition> {
  QueryBuilder<Badge, Badge, QAfterFilterCondition> image(FilterQuery<Url> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'image');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const UniformSchema = Schema(
  name: r'Uniform',
  id: -2799796605545317985,
  properties: {
    r'id': PropertySchema(
      id: 0,
      name: r'id',
      type: IsarType.string,
    ),
    r'image': PropertySchema(
      id: 1,
      name: r'image',
      type: IsarType.object,
      target: r'Url',
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _uniformEstimateSize,
  serialize: _uniformSerialize,
  deserialize: _uniformDeserialize,
  deserializeProp: _uniformDeserializeProp,
);

int _uniformEstimateSize(
  Uniform object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.id.length * 3;
  bytesCount +=
      3 + UrlSchema.estimateSize(object.image, allOffsets[Url]!, allOffsets);
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _uniformSerialize(
  Uniform object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.id);
  writer.writeObject<Url>(
    offsets[1],
    allOffsets,
    UrlSchema.serialize,
    object.image,
  );
  writer.writeString(offsets[2], object.name);
}

Uniform _uniformDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Uniform();
  object.id = reader.readString(offsets[0]);
  object.image = reader.readObjectOrNull<Url>(
        offsets[1],
        UrlSchema.deserialize,
        allOffsets,
      ) ??
      Url();
  object.name = reader.readString(offsets[2]);
  return object;
}

P _uniformDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<Url>(
            offset,
            UrlSchema.deserialize,
            allOffsets,
          ) ??
          Url()) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension UniformQueryFilter
    on QueryBuilder<Uniform, Uniform, QFilterCondition> {
  QueryBuilder<Uniform, Uniform, QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Uniform, Uniform, QAfterFilterCondition> idGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Uniform, Uniform, QAfterFilterCondition> idLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Uniform, Uniform, QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Uniform, Uniform, QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Uniform, Uniform, QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Uniform, Uniform, QAfterFilterCondition> idContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Uniform, Uniform, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Uniform, Uniform, QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<Uniform, Uniform, QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<Uniform, Uniform, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Uniform, Uniform, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Uniform, Uniform, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Uniform, Uniform, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Uniform, Uniform, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Uniform, Uniform, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Uniform, Uniform, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Uniform, Uniform, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Uniform, Uniform, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Uniform, Uniform, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension UniformQueryObject
    on QueryBuilder<Uniform, Uniform, QFilterCondition> {
  QueryBuilder<Uniform, Uniform, QAfterFilterCondition> image(
      FilterQuery<Url> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'image');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const WeaponSchema = Schema(
  name: r'Weapon',
  id: -7996961866191931403,
  properties: {
    r'image': PropertySchema(
      id: 0,
      name: r'image',
      type: IsarType.object,
      target: r'Url',
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _weaponEstimateSize,
  serialize: _weaponSerialize,
  deserialize: _weaponDeserialize,
  deserializeProp: _weaponDeserializeProp,
);

int _weaponEstimateSize(
  Weapon object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount +=
      3 + UrlSchema.estimateSize(object.image, allOffsets[Url]!, allOffsets);
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _weaponSerialize(
  Weapon object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<Url>(
    offsets[0],
    allOffsets,
    UrlSchema.serialize,
    object.image,
  );
  writer.writeString(offsets[1], object.name);
}

Weapon _weaponDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Weapon();
  object.image = reader.readObjectOrNull<Url>(
        offsets[0],
        UrlSchema.deserialize,
        allOffsets,
      ) ??
      Url();
  object.name = reader.readString(offsets[1]);
  return object;
}

P _weaponDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<Url>(
            offset,
            UrlSchema.deserialize,
            allOffsets,
          ) ??
          Url()) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension WeaponQueryFilter on QueryBuilder<Weapon, Weapon, QFilterCondition> {
  QueryBuilder<Weapon, Weapon, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weapon, Weapon, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weapon, Weapon, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weapon, Weapon, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weapon, Weapon, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weapon, Weapon, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weapon, Weapon, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weapon, Weapon, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weapon, Weapon, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Weapon, Weapon, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension WeaponQueryObject on QueryBuilder<Weapon, Weapon, QFilterCondition> {
  QueryBuilder<Weapon, Weapon, QAfterFilterCondition> image(
      FilterQuery<Url> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'image');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const SpecialWeaponSchema = Schema(
  name: r'SpecialWeapon',
  id: 2239312494182674387,
  properties: {
    r'id': PropertySchema(
      id: 0,
      name: r'id',
      type: IsarType.string,
    ),
    r'image': PropertySchema(
      id: 1,
      name: r'image',
      type: IsarType.object,
      target: r'Url',
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _specialWeaponEstimateSize,
  serialize: _specialWeaponSerialize,
  deserialize: _specialWeaponDeserialize,
  deserializeProp: _specialWeaponDeserializeProp,
);

int _specialWeaponEstimateSize(
  SpecialWeapon object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.id.length * 3;
  bytesCount +=
      3 + UrlSchema.estimateSize(object.image, allOffsets[Url]!, allOffsets);
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _specialWeaponSerialize(
  SpecialWeapon object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.id);
  writer.writeObject<Url>(
    offsets[1],
    allOffsets,
    UrlSchema.serialize,
    object.image,
  );
  writer.writeString(offsets[2], object.name);
}

SpecialWeapon _specialWeaponDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SpecialWeapon();
  object.id = reader.readString(offsets[0]);
  object.image = reader.readObjectOrNull<Url>(
        offsets[1],
        UrlSchema.deserialize,
        allOffsets,
      ) ??
      Url();
  object.name = reader.readString(offsets[2]);
  return object;
}

P _specialWeaponDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<Url>(
            offset,
            UrlSchema.deserialize,
            allOffsets,
          ) ??
          Url()) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension SpecialWeaponQueryFilter
    on QueryBuilder<SpecialWeapon, SpecialWeapon, QFilterCondition> {
  QueryBuilder<SpecialWeapon, SpecialWeapon, QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpecialWeapon, SpecialWeapon, QAfterFilterCondition>
      idGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpecialWeapon, SpecialWeapon, QAfterFilterCondition> idLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpecialWeapon, SpecialWeapon, QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpecialWeapon, SpecialWeapon, QAfterFilterCondition>
      idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpecialWeapon, SpecialWeapon, QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpecialWeapon, SpecialWeapon, QAfterFilterCondition> idContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpecialWeapon, SpecialWeapon, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpecialWeapon, SpecialWeapon, QAfterFilterCondition>
      idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<SpecialWeapon, SpecialWeapon, QAfterFilterCondition>
      idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<SpecialWeapon, SpecialWeapon, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpecialWeapon, SpecialWeapon, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpecialWeapon, SpecialWeapon, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpecialWeapon, SpecialWeapon, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpecialWeapon, SpecialWeapon, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpecialWeapon, SpecialWeapon, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpecialWeapon, SpecialWeapon, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpecialWeapon, SpecialWeapon, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpecialWeapon, SpecialWeapon, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<SpecialWeapon, SpecialWeapon, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension SpecialWeaponQueryObject
    on QueryBuilder<SpecialWeapon, SpecialWeapon, QFilterCondition> {
  QueryBuilder<SpecialWeapon, SpecialWeapon, QAfterFilterCondition> image(
      FilterQuery<Url> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'image');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const BossResultSchema = Schema(
  name: r'BossResult',
  id: 3969122744621371212,
  properties: {
    r'boss': PropertySchema(
      id: 0,
      name: r'boss',
      type: IsarType.object,
      target: r'Boss',
    ),
    r'hasDefeatBoss': PropertySchema(
      id: 1,
      name: r'hasDefeatBoss',
      type: IsarType.bool,
    )
  },
  estimateSize: _bossResultEstimateSize,
  serialize: _bossResultSerialize,
  deserialize: _bossResultDeserialize,
  deserializeProp: _bossResultDeserializeProp,
);

int _bossResultEstimateSize(
  BossResult object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount +=
      3 + BossSchema.estimateSize(object.boss, allOffsets[Boss]!, allOffsets);
  return bytesCount;
}

void _bossResultSerialize(
  BossResult object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<Boss>(
    offsets[0],
    allOffsets,
    BossSchema.serialize,
    object.boss,
  );
  writer.writeBool(offsets[1], object.hasDefeatBoss);
}

BossResult _bossResultDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BossResult();
  object.boss = reader.readObjectOrNull<Boss>(
        offsets[0],
        BossSchema.deserialize,
        allOffsets,
      ) ??
      Boss();
  object.hasDefeatBoss = reader.readBool(offsets[1]);
  return object;
}

P _bossResultDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<Boss>(
            offset,
            BossSchema.deserialize,
            allOffsets,
          ) ??
          Boss()) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension BossResultQueryFilter
    on QueryBuilder<BossResult, BossResult, QFilterCondition> {
  QueryBuilder<BossResult, BossResult, QAfterFilterCondition>
      hasDefeatBossEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasDefeatBoss',
        value: value,
      ));
    });
  }
}

extension BossResultQueryObject
    on QueryBuilder<BossResult, BossResult, QFilterCondition> {
  QueryBuilder<BossResult, BossResult, QAfterFilterCondition> boss(
      FilterQuery<Boss> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'boss');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const BossSchema = Schema(
  name: r'Boss',
  id: -5178046439840458779,
  properties: {
    r'id': PropertySchema(
      id: 0,
      name: r'id',
      type: IsarType.string,
    ),
    r'image': PropertySchema(
      id: 1,
      name: r'image',
      type: IsarType.object,
      target: r'Url',
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _bossEstimateSize,
  serialize: _bossSerialize,
  deserialize: _bossDeserialize,
  deserializeProp: _bossDeserializeProp,
);

int _bossEstimateSize(
  Boss object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.id.length * 3;
  bytesCount +=
      3 + UrlSchema.estimateSize(object.image, allOffsets[Url]!, allOffsets);
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _bossSerialize(
  Boss object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.id);
  writer.writeObject<Url>(
    offsets[1],
    allOffsets,
    UrlSchema.serialize,
    object.image,
  );
  writer.writeString(offsets[2], object.name);
}

Boss _bossDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Boss();
  object.id = reader.readString(offsets[0]);
  object.image = reader.readObjectOrNull<Url>(
        offsets[1],
        UrlSchema.deserialize,
        allOffsets,
      ) ??
      Url();
  object.name = reader.readString(offsets[2]);
  return object;
}

P _bossDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<Url>(
            offset,
            UrlSchema.deserialize,
            allOffsets,
          ) ??
          Url()) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension BossQueryFilter on QueryBuilder<Boss, Boss, QFilterCondition> {
  QueryBuilder<Boss, Boss, QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Boss, Boss, QAfterFilterCondition> idGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Boss, Boss, QAfterFilterCondition> idLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Boss, Boss, QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Boss, Boss, QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Boss, Boss, QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Boss, Boss, QAfterFilterCondition> idContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Boss, Boss, QAfterFilterCondition> idMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Boss, Boss, QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<Boss, Boss, QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<Boss, Boss, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Boss, Boss, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Boss, Boss, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Boss, Boss, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Boss, Boss, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Boss, Boss, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Boss, Boss, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Boss, Boss, QAfterFilterCondition> nameMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Boss, Boss, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Boss, Boss, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension BossQueryObject on QueryBuilder<Boss, Boss, QFilterCondition> {
  QueryBuilder<Boss, Boss, QAfterFilterCondition> image(FilterQuery<Url> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'image');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const EnemyResultSchema = Schema(
  name: r'EnemyResult',
  id: 5629252018169353969,
  properties: {
    r'defeatCount': PropertySchema(
      id: 0,
      name: r'defeatCount',
      type: IsarType.long,
    ),
    r'enemy': PropertySchema(
      id: 1,
      name: r'enemy',
      type: IsarType.object,
      target: r'Boss',
    ),
    r'popCount': PropertySchema(
      id: 2,
      name: r'popCount',
      type: IsarType.long,
    ),
    r'teamDefeatCount': PropertySchema(
      id: 3,
      name: r'teamDefeatCount',
      type: IsarType.long,
    )
  },
  estimateSize: _enemyResultEstimateSize,
  serialize: _enemyResultSerialize,
  deserialize: _enemyResultDeserialize,
  deserializeProp: _enemyResultDeserializeProp,
);

int _enemyResultEstimateSize(
  EnemyResult object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount +=
      3 + BossSchema.estimateSize(object.enemy, allOffsets[Boss]!, allOffsets);
  return bytesCount;
}

void _enemyResultSerialize(
  EnemyResult object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.defeatCount);
  writer.writeObject<Boss>(
    offsets[1],
    allOffsets,
    BossSchema.serialize,
    object.enemy,
  );
  writer.writeLong(offsets[2], object.popCount);
  writer.writeLong(offsets[3], object.teamDefeatCount);
}

EnemyResult _enemyResultDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = EnemyResult();
  object.defeatCount = reader.readLong(offsets[0]);
  object.enemy = reader.readObjectOrNull<Boss>(
        offsets[1],
        BossSchema.deserialize,
        allOffsets,
      ) ??
      Boss();
  object.popCount = reader.readLong(offsets[2]);
  object.teamDefeatCount = reader.readLong(offsets[3]);
  return object;
}

P _enemyResultDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<Boss>(
            offset,
            BossSchema.deserialize,
            allOffsets,
          ) ??
          Boss()) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension EnemyResultQueryFilter
    on QueryBuilder<EnemyResult, EnemyResult, QFilterCondition> {
  QueryBuilder<EnemyResult, EnemyResult, QAfterFilterCondition>
      defeatCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'defeatCount',
        value: value,
      ));
    });
  }

  QueryBuilder<EnemyResult, EnemyResult, QAfterFilterCondition>
      defeatCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'defeatCount',
        value: value,
      ));
    });
  }

  QueryBuilder<EnemyResult, EnemyResult, QAfterFilterCondition>
      defeatCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'defeatCount',
        value: value,
      ));
    });
  }

  QueryBuilder<EnemyResult, EnemyResult, QAfterFilterCondition>
      defeatCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'defeatCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EnemyResult, EnemyResult, QAfterFilterCondition> popCountEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'popCount',
        value: value,
      ));
    });
  }

  QueryBuilder<EnemyResult, EnemyResult, QAfterFilterCondition>
      popCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'popCount',
        value: value,
      ));
    });
  }

  QueryBuilder<EnemyResult, EnemyResult, QAfterFilterCondition>
      popCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'popCount',
        value: value,
      ));
    });
  }

  QueryBuilder<EnemyResult, EnemyResult, QAfterFilterCondition> popCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'popCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EnemyResult, EnemyResult, QAfterFilterCondition>
      teamDefeatCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'teamDefeatCount',
        value: value,
      ));
    });
  }

  QueryBuilder<EnemyResult, EnemyResult, QAfterFilterCondition>
      teamDefeatCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'teamDefeatCount',
        value: value,
      ));
    });
  }

  QueryBuilder<EnemyResult, EnemyResult, QAfterFilterCondition>
      teamDefeatCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'teamDefeatCount',
        value: value,
      ));
    });
  }

  QueryBuilder<EnemyResult, EnemyResult, QAfterFilterCondition>
      teamDefeatCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'teamDefeatCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension EnemyResultQueryObject
    on QueryBuilder<EnemyResult, EnemyResult, QFilterCondition> {
  QueryBuilder<EnemyResult, EnemyResult, QAfterFilterCondition> enemy(
      FilterQuery<Boss> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'enemy');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const WaveResultSchema = Schema(
  name: r'WaveResult',
  id: -614354028374683305,
  properties: {
    r'deliverNorm': PropertySchema(
      id: 0,
      name: r'deliverNorm',
      type: IsarType.long,
    ),
    r'eventWave': PropertySchema(
      id: 1,
      name: r'eventWave',
      type: IsarType.object,
      target: r'EventWave',
    ),
    r'goldenPopCount': PropertySchema(
      id: 2,
      name: r'goldenPopCount',
      type: IsarType.long,
    ),
    r'specialWeapons': PropertySchema(
      id: 3,
      name: r'specialWeapons',
      type: IsarType.objectList,
      target: r'SpecialWeapon',
    ),
    r'teamDeliverCount': PropertySchema(
      id: 4,
      name: r'teamDeliverCount',
      type: IsarType.long,
    ),
    r'waterLevel': PropertySchema(
      id: 5,
      name: r'waterLevel',
      type: IsarType.long,
    ),
    r'waveNumber': PropertySchema(
      id: 6,
      name: r'waveNumber',
      type: IsarType.long,
    )
  },
  estimateSize: _waveResultEstimateSize,
  serialize: _waveResultSerialize,
  deserialize: _waveResultDeserialize,
  deserializeProp: _waveResultDeserializeProp,
);

int _waveResultEstimateSize(
  WaveResult object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.eventWave;
    if (value != null) {
      bytesCount += 3 +
          EventWaveSchema.estimateSize(
              value, allOffsets[EventWave]!, allOffsets);
    }
  }
  bytesCount += 3 + object.specialWeapons.length * 3;
  {
    final offsets = allOffsets[SpecialWeapon]!;
    for (var i = 0; i < object.specialWeapons.length; i++) {
      final value = object.specialWeapons[i];
      bytesCount +=
          SpecialWeaponSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _waveResultSerialize(
  WaveResult object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.deliverNorm);
  writer.writeObject<EventWave>(
    offsets[1],
    allOffsets,
    EventWaveSchema.serialize,
    object.eventWave,
  );
  writer.writeLong(offsets[2], object.goldenPopCount);
  writer.writeObjectList<SpecialWeapon>(
    offsets[3],
    allOffsets,
    SpecialWeaponSchema.serialize,
    object.specialWeapons,
  );
  writer.writeLong(offsets[4], object.teamDeliverCount);
  writer.writeLong(offsets[5], object.waterLevel);
  writer.writeLong(offsets[6], object.waveNumber);
}

WaveResult _waveResultDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WaveResult();
  object.deliverNorm = reader.readLongOrNull(offsets[0]);
  object.eventWave = reader.readObjectOrNull<EventWave>(
    offsets[1],
    EventWaveSchema.deserialize,
    allOffsets,
  );
  object.goldenPopCount = reader.readLong(offsets[2]);
  object.specialWeapons = reader.readObjectList<SpecialWeapon>(
        offsets[3],
        SpecialWeaponSchema.deserialize,
        allOffsets,
        SpecialWeapon(),
      ) ??
      [];
  object.teamDeliverCount = reader.readLongOrNull(offsets[4]);
  object.waterLevel = reader.readLong(offsets[5]);
  object.waveNumber = reader.readLong(offsets[6]);
  return object;
}

P _waveResultDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<EventWave>(
        offset,
        EventWaveSchema.deserialize,
        allOffsets,
      )) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readObjectList<SpecialWeapon>(
            offset,
            SpecialWeaponSchema.deserialize,
            allOffsets,
            SpecialWeapon(),
          ) ??
          []) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension WaveResultQueryFilter
    on QueryBuilder<WaveResult, WaveResult, QFilterCondition> {
  QueryBuilder<WaveResult, WaveResult, QAfterFilterCondition>
      deliverNormIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deliverNorm',
      ));
    });
  }

  QueryBuilder<WaveResult, WaveResult, QAfterFilterCondition>
      deliverNormIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deliverNorm',
      ));
    });
  }

  QueryBuilder<WaveResult, WaveResult, QAfterFilterCondition>
      deliverNormEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deliverNorm',
        value: value,
      ));
    });
  }

  QueryBuilder<WaveResult, WaveResult, QAfterFilterCondition>
      deliverNormGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deliverNorm',
        value: value,
      ));
    });
  }

  QueryBuilder<WaveResult, WaveResult, QAfterFilterCondition>
      deliverNormLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deliverNorm',
        value: value,
      ));
    });
  }

  QueryBuilder<WaveResult, WaveResult, QAfterFilterCondition>
      deliverNormBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deliverNorm',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WaveResult, WaveResult, QAfterFilterCondition>
      eventWaveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'eventWave',
      ));
    });
  }

  QueryBuilder<WaveResult, WaveResult, QAfterFilterCondition>
      eventWaveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'eventWave',
      ));
    });
  }

  QueryBuilder<WaveResult, WaveResult, QAfterFilterCondition>
      goldenPopCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'goldenPopCount',
        value: value,
      ));
    });
  }

  QueryBuilder<WaveResult, WaveResult, QAfterFilterCondition>
      goldenPopCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'goldenPopCount',
        value: value,
      ));
    });
  }

  QueryBuilder<WaveResult, WaveResult, QAfterFilterCondition>
      goldenPopCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'goldenPopCount',
        value: value,
      ));
    });
  }

  QueryBuilder<WaveResult, WaveResult, QAfterFilterCondition>
      goldenPopCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'goldenPopCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WaveResult, WaveResult, QAfterFilterCondition>
      specialWeaponsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'specialWeapons',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WaveResult, WaveResult, QAfterFilterCondition>
      specialWeaponsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'specialWeapons',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WaveResult, WaveResult, QAfterFilterCondition>
      specialWeaponsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'specialWeapons',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WaveResult, WaveResult, QAfterFilterCondition>
      specialWeaponsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'specialWeapons',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WaveResult, WaveResult, QAfterFilterCondition>
      specialWeaponsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'specialWeapons',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WaveResult, WaveResult, QAfterFilterCondition>
      specialWeaponsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'specialWeapons',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WaveResult, WaveResult, QAfterFilterCondition>
      teamDeliverCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'teamDeliverCount',
      ));
    });
  }

  QueryBuilder<WaveResult, WaveResult, QAfterFilterCondition>
      teamDeliverCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'teamDeliverCount',
      ));
    });
  }

  QueryBuilder<WaveResult, WaveResult, QAfterFilterCondition>
      teamDeliverCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'teamDeliverCount',
        value: value,
      ));
    });
  }

  QueryBuilder<WaveResult, WaveResult, QAfterFilterCondition>
      teamDeliverCountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'teamDeliverCount',
        value: value,
      ));
    });
  }

  QueryBuilder<WaveResult, WaveResult, QAfterFilterCondition>
      teamDeliverCountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'teamDeliverCount',
        value: value,
      ));
    });
  }

  QueryBuilder<WaveResult, WaveResult, QAfterFilterCondition>
      teamDeliverCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'teamDeliverCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WaveResult, WaveResult, QAfterFilterCondition> waterLevelEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'waterLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<WaveResult, WaveResult, QAfterFilterCondition>
      waterLevelGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'waterLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<WaveResult, WaveResult, QAfterFilterCondition>
      waterLevelLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'waterLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<WaveResult, WaveResult, QAfterFilterCondition> waterLevelBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'waterLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WaveResult, WaveResult, QAfterFilterCondition> waveNumberEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'waveNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<WaveResult, WaveResult, QAfterFilterCondition>
      waveNumberGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'waveNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<WaveResult, WaveResult, QAfterFilterCondition>
      waveNumberLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'waveNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<WaveResult, WaveResult, QAfterFilterCondition> waveNumberBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'waveNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension WaveResultQueryObject
    on QueryBuilder<WaveResult, WaveResult, QFilterCondition> {
  QueryBuilder<WaveResult, WaveResult, QAfterFilterCondition> eventWave(
      FilterQuery<EventWave> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'eventWave');
    });
  }

  QueryBuilder<WaveResult, WaveResult, QAfterFilterCondition>
      specialWeaponsElement(FilterQuery<SpecialWeapon> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'specialWeapons');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const EventWaveSchema = Schema(
  name: r'EventWave',
  id: 2227663016018753023,
  properties: {
    r'id': PropertySchema(
      id: 0,
      name: r'id',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _eventWaveEstimateSize,
  serialize: _eventWaveSerialize,
  deserialize: _eventWaveDeserialize,
  deserializeProp: _eventWaveDeserializeProp,
);

int _eventWaveEstimateSize(
  EventWave object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.id.length * 3;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _eventWaveSerialize(
  EventWave object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.id);
  writer.writeString(offsets[1], object.name);
}

EventWave _eventWaveDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = EventWave();
  object.id = reader.readString(offsets[0]);
  object.name = reader.readString(offsets[1]);
  return object;
}

P _eventWaveDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension EventWaveQueryFilter
    on QueryBuilder<EventWave, EventWave, QFilterCondition> {
  QueryBuilder<EventWave, EventWave, QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventWave, EventWave, QAfterFilterCondition> idGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventWave, EventWave, QAfterFilterCondition> idLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventWave, EventWave, QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventWave, EventWave, QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventWave, EventWave, QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventWave, EventWave, QAfterFilterCondition> idContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventWave, EventWave, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventWave, EventWave, QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<EventWave, EventWave, QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<EventWave, EventWave, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventWave, EventWave, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventWave, EventWave, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventWave, EventWave, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventWave, EventWave, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventWave, EventWave, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventWave, EventWave, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventWave, EventWave, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventWave, EventWave, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<EventWave, EventWave, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension EventWaveQueryObject
    on QueryBuilder<EventWave, EventWave, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const CoopStageSchema = Schema(
  name: r'CoopStage',
  id: 6892630540793159313,
  properties: {
    r'id': PropertySchema(
      id: 0,
      name: r'id',
      type: IsarType.string,
    ),
    r'image': PropertySchema(
      id: 1,
      name: r'image',
      type: IsarType.object,
      target: r'Url',
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _coopStageEstimateSize,
  serialize: _coopStageSerialize,
  deserialize: _coopStageDeserialize,
  deserializeProp: _coopStageDeserializeProp,
);

int _coopStageEstimateSize(
  CoopStage object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.id.length * 3;
  bytesCount +=
      3 + UrlSchema.estimateSize(object.image, allOffsets[Url]!, allOffsets);
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _coopStageSerialize(
  CoopStage object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.id);
  writer.writeObject<Url>(
    offsets[1],
    allOffsets,
    UrlSchema.serialize,
    object.image,
  );
  writer.writeString(offsets[2], object.name);
}

CoopStage _coopStageDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CoopStage();
  object.id = reader.readString(offsets[0]);
  object.image = reader.readObjectOrNull<Url>(
        offsets[1],
        UrlSchema.deserialize,
        allOffsets,
      ) ??
      Url();
  object.name = reader.readString(offsets[2]);
  return object;
}

P _coopStageDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<Url>(
            offset,
            UrlSchema.deserialize,
            allOffsets,
          ) ??
          Url()) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension CoopStageQueryFilter
    on QueryBuilder<CoopStage, CoopStage, QFilterCondition> {
  QueryBuilder<CoopStage, CoopStage, QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoopStage, CoopStage, QAfterFilterCondition> idGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoopStage, CoopStage, QAfterFilterCondition> idLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoopStage, CoopStage, QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoopStage, CoopStage, QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoopStage, CoopStage, QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoopStage, CoopStage, QAfterFilterCondition> idContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoopStage, CoopStage, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoopStage, CoopStage, QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<CoopStage, CoopStage, QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<CoopStage, CoopStage, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoopStage, CoopStage, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoopStage, CoopStage, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoopStage, CoopStage, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoopStage, CoopStage, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoopStage, CoopStage, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoopStage, CoopStage, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoopStage, CoopStage, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoopStage, CoopStage, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<CoopStage, CoopStage, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension CoopStageQueryObject
    on QueryBuilder<CoopStage, CoopStage, QFilterCondition> {
  QueryBuilder<CoopStage, CoopStage, QAfterFilterCondition> image(
      FilterQuery<Url> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'image');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ScaleSchema = Schema(
  name: r'Scale',
  id: 8209759280566230421,
  properties: {
    r'bronze': PropertySchema(
      id: 0,
      name: r'bronze',
      type: IsarType.long,
    ),
    r'gold': PropertySchema(
      id: 1,
      name: r'gold',
      type: IsarType.long,
    ),
    r'silver': PropertySchema(
      id: 2,
      name: r'silver',
      type: IsarType.long,
    )
  },
  estimateSize: _scaleEstimateSize,
  serialize: _scaleSerialize,
  deserialize: _scaleDeserialize,
  deserializeProp: _scaleDeserializeProp,
);

int _scaleEstimateSize(
  Scale object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _scaleSerialize(
  Scale object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.bronze);
  writer.writeLong(offsets[1], object.gold);
  writer.writeLong(offsets[2], object.silver);
}

Scale _scaleDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Scale();
  object.bronze = reader.readLong(offsets[0]);
  object.gold = reader.readLong(offsets[1]);
  object.silver = reader.readLong(offsets[2]);
  return object;
}

P _scaleDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ScaleQueryFilter on QueryBuilder<Scale, Scale, QFilterCondition> {
  QueryBuilder<Scale, Scale, QAfterFilterCondition> bronzeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bronze',
        value: value,
      ));
    });
  }

  QueryBuilder<Scale, Scale, QAfterFilterCondition> bronzeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bronze',
        value: value,
      ));
    });
  }

  QueryBuilder<Scale, Scale, QAfterFilterCondition> bronzeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bronze',
        value: value,
      ));
    });
  }

  QueryBuilder<Scale, Scale, QAfterFilterCondition> bronzeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bronze',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Scale, Scale, QAfterFilterCondition> goldEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gold',
        value: value,
      ));
    });
  }

  QueryBuilder<Scale, Scale, QAfterFilterCondition> goldGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gold',
        value: value,
      ));
    });
  }

  QueryBuilder<Scale, Scale, QAfterFilterCondition> goldLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gold',
        value: value,
      ));
    });
  }

  QueryBuilder<Scale, Scale, QAfterFilterCondition> goldBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gold',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Scale, Scale, QAfterFilterCondition> silverEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'silver',
        value: value,
      ));
    });
  }

  QueryBuilder<Scale, Scale, QAfterFilterCondition> silverGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'silver',
        value: value,
      ));
    });
  }

  QueryBuilder<Scale, Scale, QAfterFilterCondition> silverLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'silver',
        value: value,
      ));
    });
  }

  QueryBuilder<Scale, Scale, QAfterFilterCondition> silverBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'silver',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ScaleQueryObject on QueryBuilder<Scale, Scale, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const HistoryDetailSchema = Schema(
  name: r'HistoryDetail',
  id: 201237360684281054,
  properties: {
    r'id': PropertySchema(
      id: 0,
      name: r'id',
      type: IsarType.string,
    )
  },
  estimateSize: _historyDetailEstimateSize,
  serialize: _historyDetailSerialize,
  deserialize: _historyDetailDeserialize,
  deserializeProp: _historyDetailDeserializeProp,
);

int _historyDetailEstimateSize(
  HistoryDetail object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.id.length * 3;
  return bytesCount;
}

void _historyDetailSerialize(
  HistoryDetail object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.id);
}

HistoryDetail _historyDetailDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = HistoryDetail();
  object.id = reader.readString(offsets[0]);
  return object;
}

P _historyDetailDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension HistoryDetailQueryFilter
    on QueryBuilder<HistoryDetail, HistoryDetail, QFilterCondition> {
  QueryBuilder<HistoryDetail, HistoryDetail, QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryDetail, HistoryDetail, QAfterFilterCondition>
      idGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryDetail, HistoryDetail, QAfterFilterCondition> idLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryDetail, HistoryDetail, QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryDetail, HistoryDetail, QAfterFilterCondition>
      idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryDetail, HistoryDetail, QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryDetail, HistoryDetail, QAfterFilterCondition> idContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryDetail, HistoryDetail, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryDetail, HistoryDetail, QAfterFilterCondition>
      idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<HistoryDetail, HistoryDetail, QAfterFilterCondition>
      idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }
}

extension HistoryDetailQueryObject
    on QueryBuilder<HistoryDetail, HistoryDetail, QFilterCondition> {}
