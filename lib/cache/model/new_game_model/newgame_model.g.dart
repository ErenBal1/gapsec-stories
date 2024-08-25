// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newgame_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNewGameCollection on Isar {
  IsarCollection<NewGame> get newGames => this.collection();
}

const NewGameSchema = CollectionSchema(
  name: r'NewGame',
  id: -9088015340658716945,
  properties: {
    r'behindTexts': PropertySchema(
      id: 0,
      name: r'behindTexts',
      type: IsarType.string,
    ),
    r'dontLookBackTexts': PropertySchema(
      id: 1,
      name: r'dontLookBackTexts',
      type: IsarType.string,
    ),
    r'lostLucyTexts': PropertySchema(
      id: 2,
      name: r'lostLucyTexts',
      type: IsarType.string,
    ),
    r'luckyTexts': PropertySchema(
      id: 3,
      name: r'luckyTexts',
      type: IsarType.string,
    ),
    r'murderTexts': PropertySchema(
      id: 4,
      name: r'murderTexts',
      type: IsarType.string,
    ),
    r'nightGameTexts': PropertySchema(
      id: 5,
      name: r'nightGameTexts',
      type: IsarType.string,
    ),
    r'runKaityTexts': PropertySchema(
      id: 6,
      name: r'runKaityTexts',
      type: IsarType.string,
    ),
    r'smileTexts': PropertySchema(
      id: 7,
      name: r'smileTexts',
      type: IsarType.string,
    )
  },
  estimateSize: _newGameEstimateSize,
  serialize: _newGameSerialize,
  deserialize: _newGameDeserialize,
  deserializeProp: _newGameDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _newGameGetId,
  getLinks: _newGameGetLinks,
  attach: _newGameAttach,
  version: '3.1.0+1',
);

int _newGameEstimateSize(
  NewGame object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.behindTexts;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.dontLookBackTexts;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.lostLucyTexts;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.luckyTexts;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.murderTexts;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.nightGameTexts;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.runKaityTexts;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.smileTexts;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _newGameSerialize(
  NewGame object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.behindTexts);
  writer.writeString(offsets[1], object.dontLookBackTexts);
  writer.writeString(offsets[2], object.lostLucyTexts);
  writer.writeString(offsets[3], object.luckyTexts);
  writer.writeString(offsets[4], object.murderTexts);
  writer.writeString(offsets[5], object.nightGameTexts);
  writer.writeString(offsets[6], object.runKaityTexts);
  writer.writeString(offsets[7], object.smileTexts);
}

NewGame _newGameDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NewGame();
  object.behindTexts = reader.readStringOrNull(offsets[0]);
  object.dontLookBackTexts = reader.readStringOrNull(offsets[1]);
  object.id = id;
  object.lostLucyTexts = reader.readStringOrNull(offsets[2]);
  object.luckyTexts = reader.readStringOrNull(offsets[3]);
  object.murderTexts = reader.readStringOrNull(offsets[4]);
  object.nightGameTexts = reader.readStringOrNull(offsets[5]);
  object.runKaityTexts = reader.readStringOrNull(offsets[6]);
  object.smileTexts = reader.readStringOrNull(offsets[7]);
  return object;
}

P _newGameDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _newGameGetId(NewGame object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _newGameGetLinks(NewGame object) {
  return [];
}

void _newGameAttach(IsarCollection<dynamic> col, Id id, NewGame object) {
  object.id = id;
}

extension NewGameQueryWhereSort on QueryBuilder<NewGame, NewGame, QWhere> {
  QueryBuilder<NewGame, NewGame, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NewGameQueryWhere on QueryBuilder<NewGame, NewGame, QWhereClause> {
  QueryBuilder<NewGame, NewGame, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<NewGame, NewGame, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterWhereClause> idBetween(
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

extension NewGameQueryFilter
    on QueryBuilder<NewGame, NewGame, QFilterCondition> {
  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> behindTextsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'behindTexts',
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> behindTextsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'behindTexts',
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> behindTextsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'behindTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> behindTextsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'behindTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> behindTextsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'behindTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> behindTextsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'behindTexts',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> behindTextsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'behindTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> behindTextsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'behindTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> behindTextsContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'behindTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> behindTextsMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'behindTexts',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> behindTextsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'behindTexts',
        value: '',
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition>
      behindTextsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'behindTexts',
        value: '',
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition>
      dontLookBackTextsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dontLookBackTexts',
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition>
      dontLookBackTextsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dontLookBackTexts',
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition>
      dontLookBackTextsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dontLookBackTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition>
      dontLookBackTextsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dontLookBackTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition>
      dontLookBackTextsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dontLookBackTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition>
      dontLookBackTextsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dontLookBackTexts',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition>
      dontLookBackTextsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dontLookBackTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition>
      dontLookBackTextsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dontLookBackTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition>
      dontLookBackTextsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dontLookBackTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition>
      dontLookBackTextsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dontLookBackTexts',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition>
      dontLookBackTextsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dontLookBackTexts',
        value: '',
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition>
      dontLookBackTextsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dontLookBackTexts',
        value: '',
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> idBetween(
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

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> lostLucyTextsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lostLucyTexts',
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition>
      lostLucyTextsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lostLucyTexts',
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> lostLucyTextsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lostLucyTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition>
      lostLucyTextsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lostLucyTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> lostLucyTextsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lostLucyTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> lostLucyTextsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lostLucyTexts',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> lostLucyTextsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lostLucyTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> lostLucyTextsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lostLucyTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> lostLucyTextsContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lostLucyTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> lostLucyTextsMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lostLucyTexts',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> lostLucyTextsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lostLucyTexts',
        value: '',
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition>
      lostLucyTextsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lostLucyTexts',
        value: '',
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> luckyTextsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'luckyTexts',
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> luckyTextsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'luckyTexts',
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> luckyTextsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'luckyTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> luckyTextsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'luckyTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> luckyTextsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'luckyTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> luckyTextsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'luckyTexts',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> luckyTextsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'luckyTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> luckyTextsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'luckyTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> luckyTextsContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'luckyTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> luckyTextsMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'luckyTexts',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> luckyTextsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'luckyTexts',
        value: '',
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> luckyTextsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'luckyTexts',
        value: '',
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> murderTextsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'murderTexts',
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> murderTextsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'murderTexts',
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> murderTextsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'murderTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> murderTextsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'murderTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> murderTextsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'murderTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> murderTextsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'murderTexts',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> murderTextsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'murderTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> murderTextsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'murderTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> murderTextsContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'murderTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> murderTextsMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'murderTexts',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> murderTextsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'murderTexts',
        value: '',
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition>
      murderTextsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'murderTexts',
        value: '',
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> nightGameTextsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nightGameTexts',
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition>
      nightGameTextsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nightGameTexts',
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> nightGameTextsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nightGameTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition>
      nightGameTextsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nightGameTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> nightGameTextsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nightGameTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> nightGameTextsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nightGameTexts',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition>
      nightGameTextsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nightGameTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> nightGameTextsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nightGameTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> nightGameTextsContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nightGameTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> nightGameTextsMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nightGameTexts',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition>
      nightGameTextsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nightGameTexts',
        value: '',
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition>
      nightGameTextsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nightGameTexts',
        value: '',
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> runKaityTextsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'runKaityTexts',
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition>
      runKaityTextsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'runKaityTexts',
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> runKaityTextsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'runKaityTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition>
      runKaityTextsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'runKaityTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> runKaityTextsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'runKaityTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> runKaityTextsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'runKaityTexts',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> runKaityTextsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'runKaityTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> runKaityTextsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'runKaityTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> runKaityTextsContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'runKaityTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> runKaityTextsMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'runKaityTexts',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> runKaityTextsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'runKaityTexts',
        value: '',
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition>
      runKaityTextsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'runKaityTexts',
        value: '',
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> smileTextsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'smileTexts',
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> smileTextsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'smileTexts',
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> smileTextsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'smileTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> smileTextsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'smileTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> smileTextsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'smileTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> smileTextsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'smileTexts',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> smileTextsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'smileTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> smileTextsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'smileTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> smileTextsContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'smileTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> smileTextsMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'smileTexts',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> smileTextsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'smileTexts',
        value: '',
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> smileTextsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'smileTexts',
        value: '',
      ));
    });
  }
}

extension NewGameQueryObject
    on QueryBuilder<NewGame, NewGame, QFilterCondition> {}

extension NewGameQueryLinks
    on QueryBuilder<NewGame, NewGame, QFilterCondition> {}

extension NewGameQuerySortBy on QueryBuilder<NewGame, NewGame, QSortBy> {
  QueryBuilder<NewGame, NewGame, QAfterSortBy> sortByBehindTexts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'behindTexts', Sort.asc);
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterSortBy> sortByBehindTextsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'behindTexts', Sort.desc);
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterSortBy> sortByDontLookBackTexts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dontLookBackTexts', Sort.asc);
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterSortBy> sortByDontLookBackTextsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dontLookBackTexts', Sort.desc);
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterSortBy> sortByLostLucyTexts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lostLucyTexts', Sort.asc);
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterSortBy> sortByLostLucyTextsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lostLucyTexts', Sort.desc);
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterSortBy> sortByLuckyTexts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'luckyTexts', Sort.asc);
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterSortBy> sortByLuckyTextsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'luckyTexts', Sort.desc);
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterSortBy> sortByMurderTexts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'murderTexts', Sort.asc);
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterSortBy> sortByMurderTextsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'murderTexts', Sort.desc);
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterSortBy> sortByNightGameTexts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nightGameTexts', Sort.asc);
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterSortBy> sortByNightGameTextsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nightGameTexts', Sort.desc);
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterSortBy> sortByRunKaityTexts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'runKaityTexts', Sort.asc);
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterSortBy> sortByRunKaityTextsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'runKaityTexts', Sort.desc);
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterSortBy> sortBySmileTexts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smileTexts', Sort.asc);
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterSortBy> sortBySmileTextsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smileTexts', Sort.desc);
    });
  }
}

extension NewGameQuerySortThenBy
    on QueryBuilder<NewGame, NewGame, QSortThenBy> {
  QueryBuilder<NewGame, NewGame, QAfterSortBy> thenByBehindTexts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'behindTexts', Sort.asc);
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterSortBy> thenByBehindTextsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'behindTexts', Sort.desc);
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterSortBy> thenByDontLookBackTexts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dontLookBackTexts', Sort.asc);
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterSortBy> thenByDontLookBackTextsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dontLookBackTexts', Sort.desc);
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterSortBy> thenByLostLucyTexts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lostLucyTexts', Sort.asc);
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterSortBy> thenByLostLucyTextsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lostLucyTexts', Sort.desc);
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterSortBy> thenByLuckyTexts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'luckyTexts', Sort.asc);
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterSortBy> thenByLuckyTextsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'luckyTexts', Sort.desc);
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterSortBy> thenByMurderTexts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'murderTexts', Sort.asc);
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterSortBy> thenByMurderTextsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'murderTexts', Sort.desc);
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterSortBy> thenByNightGameTexts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nightGameTexts', Sort.asc);
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterSortBy> thenByNightGameTextsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nightGameTexts', Sort.desc);
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterSortBy> thenByRunKaityTexts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'runKaityTexts', Sort.asc);
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterSortBy> thenByRunKaityTextsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'runKaityTexts', Sort.desc);
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterSortBy> thenBySmileTexts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smileTexts', Sort.asc);
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterSortBy> thenBySmileTextsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smileTexts', Sort.desc);
    });
  }
}

extension NewGameQueryWhereDistinct
    on QueryBuilder<NewGame, NewGame, QDistinct> {
  QueryBuilder<NewGame, NewGame, QDistinct> distinctByBehindTexts(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'behindTexts', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NewGame, NewGame, QDistinct> distinctByDontLookBackTexts(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dontLookBackTexts',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NewGame, NewGame, QDistinct> distinctByLostLucyTexts(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lostLucyTexts',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NewGame, NewGame, QDistinct> distinctByLuckyTexts(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'luckyTexts', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NewGame, NewGame, QDistinct> distinctByMurderTexts(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'murderTexts', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NewGame, NewGame, QDistinct> distinctByNightGameTexts(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nightGameTexts',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NewGame, NewGame, QDistinct> distinctByRunKaityTexts(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'runKaityTexts',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NewGame, NewGame, QDistinct> distinctBySmileTexts(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'smileTexts', caseSensitive: caseSensitive);
    });
  }
}

extension NewGameQueryProperty
    on QueryBuilder<NewGame, NewGame, QQueryProperty> {
  QueryBuilder<NewGame, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NewGame, String?, QQueryOperations> behindTextsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'behindTexts');
    });
  }

  QueryBuilder<NewGame, String?, QQueryOperations> dontLookBackTextsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dontLookBackTexts');
    });
  }

  QueryBuilder<NewGame, String?, QQueryOperations> lostLucyTextsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lostLucyTexts');
    });
  }

  QueryBuilder<NewGame, String?, QQueryOperations> luckyTextsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'luckyTexts');
    });
  }

  QueryBuilder<NewGame, String?, QQueryOperations> murderTextsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'murderTexts');
    });
  }

  QueryBuilder<NewGame, String?, QQueryOperations> nightGameTextsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nightGameTexts');
    });
  }

  QueryBuilder<NewGame, String?, QQueryOperations> runKaityTextsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'runKaityTexts');
    });
  }

  QueryBuilder<NewGame, String?, QQueryOperations> smileTextsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'smileTexts');
    });
  }
}
