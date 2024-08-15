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
    r'dontLookBackIsLock': PropertySchema(
      id: 1,
      name: r'dontLookBackIsLock',
      type: IsarType.bool,
    ),
    r'lostLucyIsLock': PropertySchema(
      id: 2,
      name: r'lostLucyIsLock',
      type: IsarType.bool,
    ),
    r'luckyIsLock': PropertySchema(
      id: 3,
      name: r'luckyIsLock',
      type: IsarType.bool,
    ),
    r'murderIsLock': PropertySchema(
      id: 4,
      name: r'murderIsLock',
      type: IsarType.bool,
    ),
    r'nightGameIsLock': PropertySchema(
      id: 5,
      name: r'nightGameIsLock',
      type: IsarType.bool,
    ),
    r'runKaityIsLock': PropertySchema(
      id: 6,
      name: r'runKaityIsLock',
      type: IsarType.bool,
    ),
    r'smileIsLock': PropertySchema(
      id: 7,
      name: r'smileIsLock',
      type: IsarType.bool,
    ),
    r'tokenAmount': PropertySchema(
      id: 8,
      name: r'tokenAmount',
      type: IsarType.long,
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
  writer.writeBool(offsets[1], object.dontLookBackIsLock);
  writer.writeBool(offsets[2], object.lostLucyIsLock);
  writer.writeBool(offsets[3], object.luckyIsLock);
  writer.writeBool(offsets[4], object.murderIsLock);
  writer.writeBool(offsets[5], object.nightGameIsLock);
  writer.writeBool(offsets[6], object.runKaityIsLock);
  writer.writeBool(offsets[7], object.smileIsLock);
  writer.writeLong(offsets[8], object.tokenAmount);
}

BoolModel _boolModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BoolModel();
  object.behindIsLock = reader.readBoolOrNull(offsets[0]);
  object.dontLookBackIsLock = reader.readBoolOrNull(offsets[1]);
  object.id = id;
  object.lostLucyIsLock = reader.readBoolOrNull(offsets[2]);
  object.luckyIsLock = reader.readBoolOrNull(offsets[3]);
  object.murderIsLock = reader.readBoolOrNull(offsets[4]);
  object.nightGameIsLock = reader.readBoolOrNull(offsets[5]);
  object.runKaityIsLock = reader.readBoolOrNull(offsets[6]);
  object.smileIsLock = reader.readBoolOrNull(offsets[7]);
  object.tokenAmount = reader.readLongOrNull(offsets[8]);
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
      return (reader.readBoolOrNull(offset)) as P;
    case 6:
      return (reader.readBoolOrNull(offset)) as P;
    case 7:
      return (reader.readBoolOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
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
      dontLookBackIsLockIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dontLookBackIsLock',
      ));
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterFilterCondition>
      dontLookBackIsLockIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dontLookBackIsLock',
      ));
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterFilterCondition>
      dontLookBackIsLockEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dontLookBackIsLock',
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
      lostLucyIsLockIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lostLucyIsLock',
      ));
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterFilterCondition>
      lostLucyIsLockIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lostLucyIsLock',
      ));
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterFilterCondition>
      lostLucyIsLockEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lostLucyIsLock',
        value: value,
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
      nightGameIsLockIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nightGameIsLock',
      ));
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterFilterCondition>
      nightGameIsLockIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nightGameIsLock',
      ));
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterFilterCondition>
      nightGameIsLockEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nightGameIsLock',
        value: value,
      ));
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterFilterCondition>
      runKaityIsLockIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'runKaityIsLock',
      ));
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterFilterCondition>
      runKaityIsLockIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'runKaityIsLock',
      ));
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterFilterCondition>
      runKaityIsLockEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'runKaityIsLock',
        value: value,
      ));
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterFilterCondition>
      smileIsLockIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'smileIsLock',
      ));
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterFilterCondition>
      smileIsLockIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'smileIsLock',
      ));
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterFilterCondition> smileIsLockEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'smileIsLock',
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

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> sortByDontLookBackIsLock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dontLookBackIsLock', Sort.asc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy>
      sortByDontLookBackIsLockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dontLookBackIsLock', Sort.desc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> sortByLostLucyIsLock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lostLucyIsLock', Sort.asc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> sortByLostLucyIsLockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lostLucyIsLock', Sort.desc);
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

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> sortByNightGameIsLock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nightGameIsLock', Sort.asc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> sortByNightGameIsLockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nightGameIsLock', Sort.desc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> sortByRunKaityIsLock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'runKaityIsLock', Sort.asc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> sortByRunKaityIsLockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'runKaityIsLock', Sort.desc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> sortBySmileIsLock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smileIsLock', Sort.asc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> sortBySmileIsLockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smileIsLock', Sort.desc);
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

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> thenByDontLookBackIsLock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dontLookBackIsLock', Sort.asc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy>
      thenByDontLookBackIsLockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dontLookBackIsLock', Sort.desc);
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

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> thenByLostLucyIsLock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lostLucyIsLock', Sort.asc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> thenByLostLucyIsLockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lostLucyIsLock', Sort.desc);
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

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> thenByNightGameIsLock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nightGameIsLock', Sort.asc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> thenByNightGameIsLockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nightGameIsLock', Sort.desc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> thenByRunKaityIsLock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'runKaityIsLock', Sort.asc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> thenByRunKaityIsLockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'runKaityIsLock', Sort.desc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> thenBySmileIsLock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smileIsLock', Sort.asc);
    });
  }

  QueryBuilder<BoolModel, BoolModel, QAfterSortBy> thenBySmileIsLockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smileIsLock', Sort.desc);
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
}

extension BoolModelQueryWhereDistinct
    on QueryBuilder<BoolModel, BoolModel, QDistinct> {
  QueryBuilder<BoolModel, BoolModel, QDistinct> distinctByBehindIsLock() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'behindIsLock');
    });
  }

  QueryBuilder<BoolModel, BoolModel, QDistinct> distinctByDontLookBackIsLock() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dontLookBackIsLock');
    });
  }

  QueryBuilder<BoolModel, BoolModel, QDistinct> distinctByLostLucyIsLock() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lostLucyIsLock');
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

  QueryBuilder<BoolModel, BoolModel, QDistinct> distinctByNightGameIsLock() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nightGameIsLock');
    });
  }

  QueryBuilder<BoolModel, BoolModel, QDistinct> distinctByRunKaityIsLock() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'runKaityIsLock');
    });
  }

  QueryBuilder<BoolModel, BoolModel, QDistinct> distinctBySmileIsLock() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'smileIsLock');
    });
  }

  QueryBuilder<BoolModel, BoolModel, QDistinct> distinctByTokenAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tokenAmount');
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

  QueryBuilder<BoolModel, bool?, QQueryOperations>
      dontLookBackIsLockProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dontLookBackIsLock');
    });
  }

  QueryBuilder<BoolModel, bool?, QQueryOperations> lostLucyIsLockProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lostLucyIsLock');
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

  QueryBuilder<BoolModel, bool?, QQueryOperations> nightGameIsLockProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nightGameIsLock');
    });
  }

  QueryBuilder<BoolModel, bool?, QQueryOperations> runKaityIsLockProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'runKaityIsLock');
    });
  }

  QueryBuilder<BoolModel, bool?, QQueryOperations> smileIsLockProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'smileIsLock');
    });
  }

  QueryBuilder<BoolModel, int?, QQueryOperations> tokenAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tokenAmount');
    });
  }
}
