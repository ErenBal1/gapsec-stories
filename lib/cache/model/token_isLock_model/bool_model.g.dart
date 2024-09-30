// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bool_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBoolModelCollection on Isar {
  IsarCollection<BoolModel> get boolModels => this.collection();
}

const BoolModelSchema = CollectionSchema(
  name: r'BoolModel',
  id: -103170618473282043,
  properties: {
    r'behindIsLock': PropertySchema(
      id: 0,
      name: r'behindIsLock',
      type: IsarType.bool,
    ),
    r'gravehurstIsLock': PropertySchema(
      id: 1,
      name: r'gravehurstIsLock',
      type: IsarType.bool,
    ),
    r'luckyIsLock': PropertySchema(
      id: 2,
      name: r'luckyIsLock',
      type: IsarType.bool,
    ),
    r'murderIsLock': PropertySchema(
      id: 3,
      name: r'murderIsLock',
      type: IsarType.bool,
    ),
    r'mysteriousIsLock': PropertySchema(
      id: 4,
      name: r'mysteriousIsLock',
      type: IsarType.bool,
    ),
    r'tokenAmount': PropertySchema(
      id: 5,
      name: r'tokenAmount',
      type: IsarType.long,
    ),
    r'unknownIsLock': PropertySchema(
      id: 6,
      name: r'unknownIsLock',
      type: IsarType.bool,
    ),
    r'webOfDeceitIsLock': PropertySchema(
      id: 7,
      name: r'webOfDeceitIsLock',
      type: IsarType.bool,
    ),
    r'zetaIsLock': PropertySchema(
      id: 8,
      name: r'zetaIsLock',
      type: IsarType.bool,
    )
  },
  estimateSize: _boolModelEstimateSize,
  serialize: _boolModelSerialize,
  deserialize: _boolModelDeserialize,
  deserializeProp: _boolModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _boolModelGetId,
  getLinks: _boolModelGetLinks,
  attach: _boolModelAttach,
  version: '3.1.0+1',
);

int _boolModelEstimateSize(
  BoolModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _boolModelSerialize(
  BoolModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.behindIsLock);
  writer.writeBool(offsets[1], object.gravehurstIsLock);
  writer.writeBool(offsets[2], object.luckyIsLock);
  writer.writeBool(offsets[3], object.murderIsLock);
  writer.writeBool(offsets[4], object.mysteriousIsLock);
  writer.writeLong(offsets[5], object.tokenAmount);
  writer.writeBool(offsets[6], object.unknownIsLock);
  writer.writeBool(offsets[7], object.webOfDeceitIsLock);
  writer.writeBool(offsets[8], object.zetaIsLock);
}

BoolModel _boolModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BoolModel();
  object.behindIsLock = reader.readBoolOrNull(offsets[0]);
  object.gravehurstIsLock = reader.readBoolOrNull(offsets[1]);
  object.id = id;
  object.luckyIsLock = reader.readBoolOrNull(offsets[2]);
  object.murderIsLock = reader.readBoolOrNull(offsets[3]);
  object.mysteriousIsLock = reader.readBoolOrNull(offsets[4]);
  object.tokenAmount = reader.readLongOrNull(offsets[5]);
  object.unknownIsLock = reader.readBoolOrNull(offsets[6]);
  object.webOfDeceitIsLock = reader.readBoolOrNull(offsets[7]);
  object.zetaIsLock = reader.readBoolOrNull(offsets[8]);
  return object;
}

P _boolModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset)) as P;
    case 1:
      return (reader.readBoolOrNull(offset)) as P;
    case 2:
      return (reader.readBoolOrNull(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset)) as P;
    case 4:
      return (reader.readBoolOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readBoolOrNull(offset)) as P;
    case 7:
      return (reader.readBoolOrNull(offset)) as P;
    case 8:
      return (reader.readBoolOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _boolModelGetId(BoolModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _boolModelGetLinks(BoolModel object) {
  return [];
}

void _boolModelAttach(IsarCollection<dynamic> col, Id id, BoolModel object) {
  object.id = id;
}

extension BoolModelQueryWhereSort
    on QueryBuilder<BoolModel, BoolModel, QWhere> {
  QueryBuilder<BoolModel, BoolModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BoolModelQueryWhere
    on QueryBuilder<BoolModel, BoolModel, QWhereClause> {
  QueryBuilder<BoolModel, BoolModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<BoolModel, BoolModel, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterWhereClause> idBetween(
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

extension BoolModelQueryFilter
    on QueryBuilder<BoolModel, BoolModel, QFilterCondition> {
  QueryBuilder<BoolModel, BoolModel, QAfterFilterCondition>
      behindIsLockIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'behindIsLock',
      ));
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterFilterCondition>
      behindIsLockIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'behindIsLock',
      ));
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterFilterCondition> behindIsLockEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'behindIsLock',
        value: value,
      ));
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterFilterCondition>
      gravehurstIsLockIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gravehurstIsLock',
      ));
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterFilterCondition>
      gravehurstIsLockIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gravehurstIsLock',
      ));
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterFilterCondition>
      gravehurstIsLockEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gravehurstIsLock',
        value: value,
      ));
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<BoolModel, BoolModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<BoolModel, BoolModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<BoolModel, BoolModel, QAfterFilterCondition>
      luckyIsLockIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'luckyIsLock',
      ));
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterFilterCondition>
      luckyIsLockIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'luckyIsLock',
      ));
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterFilterCondition> luckyIsLockEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'luckyIsLock',
        value: value,
      ));
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterFilterCondition>
      murderIsLockIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'murderIsLock',
      ));
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterFilterCondition>
      murderIsLockIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'murderIsLock',
      ));
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterFilterCondition> murderIsLockEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'murderIsLock',
        value: value,
      ));
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterFilterCondition>
      mysteriousIsLockIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mysteriousIsLock',
      ));
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterFilterCondition>
      mysteriousIsLockIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mysteriousIsLock',
      ));
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterFilterCondition>
      mysteriousIsLockEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mysteriousIsLock',
        value: value,
      ));
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterFilterCondition>
      tokenAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tokenAmount',
      ));
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterFilterCondition>
      tokenAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tokenAmount',
      ));
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterFilterCondition> tokenAmountEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tokenAmount',
        value: value,
      ));
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterFilterCondition>
      tokenAmountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tokenAmount',
        value: value,
      ));
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterFilterCondition> tokenAmountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tokenAmount',
        value: value,
      ));
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterFilterCondition> tokenAmountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tokenAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterFilterCondition>
      unknownIsLockIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unknownIsLock',
      ));
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterFilterCondition>
      unknownIsLockIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unknownIsLock',
      ));
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterFilterCondition>
      unknownIsLockEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unknownIsLock',
        value: value,
      ));
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterFilterCondition>
      webOfDeceitIsLockIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'webOfDeceitIsLock',
      ));
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterFilterCondition>
      webOfDeceitIsLockIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'webOfDeceitIsLock',
      ));
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterFilterCondition>
      webOfDeceitIsLockEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'webOfDeceitIsLock',
        value: value,
      ));
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterFilterCondition> zetaIsLockIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'zetaIsLock',
      ));
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterFilterCondition>
      zetaIsLockIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'zetaIsLock',
      ));
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterFilterCondition> zetaIsLockEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'zetaIsLock',
        value: value,
      ));
    });
  }
}

extension BoolModelQueryObject
    on QueryBuilder<BoolModel, BoolModel, QFilterCondition> {}

extension BoolModelQueryLinks
    on QueryBuilder<BoolModel, BoolModel, QFilterCondition> {}

extension BoolModelQuerySortBy on QueryBuilder<BoolModel, BoolModel, QSortBy> {
  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> sortByBehindIsLock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'behindIsLock', Sort.asc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> sortByBehindIsLockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'behindIsLock', Sort.desc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> sortByGravehurstIsLock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gravehurstIsLock', Sort.asc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy>
      sortByGravehurstIsLockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gravehurstIsLock', Sort.desc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> sortByLuckyIsLock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'luckyIsLock', Sort.asc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> sortByLuckyIsLockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'luckyIsLock', Sort.desc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> sortByMurderIsLock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'murderIsLock', Sort.asc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> sortByMurderIsLockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'murderIsLock', Sort.desc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> sortByMysteriousIsLock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mysteriousIsLock', Sort.asc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy>
      sortByMysteriousIsLockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mysteriousIsLock', Sort.desc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> sortByTokenAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenAmount', Sort.asc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> sortByTokenAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenAmount', Sort.desc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> sortByUnknownIsLock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unknownIsLock', Sort.asc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> sortByUnknownIsLockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unknownIsLock', Sort.desc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> sortByWebOfDeceitIsLock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webOfDeceitIsLock', Sort.asc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy>
      sortByWebOfDeceitIsLockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webOfDeceitIsLock', Sort.desc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> sortByZetaIsLock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zetaIsLock', Sort.asc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> sortByZetaIsLockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zetaIsLock', Sort.desc);
    });
  }
}

extension BoolModelQuerySortThenBy
    on QueryBuilder<BoolModel, BoolModel, QSortThenBy> {
  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> thenByBehindIsLock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'behindIsLock', Sort.asc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> thenByBehindIsLockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'behindIsLock', Sort.desc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> thenByGravehurstIsLock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gravehurstIsLock', Sort.asc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy>
      thenByGravehurstIsLockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gravehurstIsLock', Sort.desc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> thenByLuckyIsLock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'luckyIsLock', Sort.asc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> thenByLuckyIsLockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'luckyIsLock', Sort.desc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> thenByMurderIsLock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'murderIsLock', Sort.asc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> thenByMurderIsLockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'murderIsLock', Sort.desc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> thenByMysteriousIsLock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mysteriousIsLock', Sort.asc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy>
      thenByMysteriousIsLockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mysteriousIsLock', Sort.desc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> thenByTokenAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenAmount', Sort.asc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> thenByTokenAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenAmount', Sort.desc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> thenByUnknownIsLock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unknownIsLock', Sort.asc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> thenByUnknownIsLockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unknownIsLock', Sort.desc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> thenByWebOfDeceitIsLock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webOfDeceitIsLock', Sort.asc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy>
      thenByWebOfDeceitIsLockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webOfDeceitIsLock', Sort.desc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> thenByZetaIsLock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zetaIsLock', Sort.asc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> thenByZetaIsLockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zetaIsLock', Sort.desc);
    });
  }
}

extension BoolModelQueryWhereDistinct
    on QueryBuilder<BoolModel, BoolModel, QDistinct> {
  QueryBuilder<BoolModel, BoolModel, QDistinct> distinctByBehindIsLock() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'behindIsLock');
    });
  }

  QueryBuilder<BoolModel, BoolModel, QDistinct> distinctByGravehurstIsLock() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gravehurstIsLock');
    });
  }

  QueryBuilder<BoolModel, BoolModel, QDistinct> distinctByLuckyIsLock() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'luckyIsLock');
    });
  }

  QueryBuilder<BoolModel, BoolModel, QDistinct> distinctByMurderIsLock() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'murderIsLock');
    });
  }

  QueryBuilder<BoolModel, BoolModel, QDistinct> distinctByMysteriousIsLock() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mysteriousIsLock');
    });
  }

  QueryBuilder<BoolModel, BoolModel, QDistinct> distinctByTokenAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tokenAmount');
    });
  }

  QueryBuilder<BoolModel, BoolModel, QDistinct> distinctByUnknownIsLock() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unknownIsLock');
    });
  }

  QueryBuilder<BoolModel, BoolModel, QDistinct> distinctByWebOfDeceitIsLock() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'webOfDeceitIsLock');
    });
  }

  QueryBuilder<BoolModel, BoolModel, QDistinct> distinctByZetaIsLock() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'zetaIsLock');
    });
  }
}

extension BoolModelQueryProperty
    on QueryBuilder<BoolModel, BoolModel, QQueryProperty> {
  QueryBuilder<BoolModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BoolModel, bool?, QQueryOperations> behindIsLockProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'behindIsLock');
    });
  }

  QueryBuilder<BoolModel, bool?, QQueryOperations> gravehurstIsLockProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gravehurstIsLock');
    });
  }

  QueryBuilder<BoolModel, bool?, QQueryOperations> luckyIsLockProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'luckyIsLock');
    });
  }

  QueryBuilder<BoolModel, bool?, QQueryOperations> murderIsLockProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'murderIsLock');
    });
  }

  QueryBuilder<BoolModel, bool?, QQueryOperations> mysteriousIsLockProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mysteriousIsLock');
    });
  }

  QueryBuilder<BoolModel, int?, QQueryOperations> tokenAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tokenAmount');
    });
  }

  QueryBuilder<BoolModel, bool?, QQueryOperations> unknownIsLockProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unknownIsLock');
    });
  }

  QueryBuilder<BoolModel, bool?, QQueryOperations> webOfDeceitIsLockProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'webOfDeceitIsLock');
    });
  }

  QueryBuilder<BoolModel, bool?, QQueryOperations> zetaIsLockProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'zetaIsLock');
    });
  }
}
