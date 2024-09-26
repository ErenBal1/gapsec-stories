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
    r'gravehurstTexts': PropertySchema(
      id: 1,
      name: r'gravehurstTexts',
      type: IsarType.string,
    ),
    r'luckyTexts': PropertySchema(
      id: 2,
      name: r'luckyTexts',
      type: IsarType.string,
    ),
    r'murderTexts': PropertySchema(
      id: 3,
      name: r'murderTexts',
      type: IsarType.string,
    ),
    r'smileTexts': PropertySchema(
      id: 4,
      name: r'smileTexts',
      type: IsarType.string,
    ),
    r'unknownTexts': PropertySchema(
      id: 5,
      name: r'unknownTexts',
      type: IsarType.string,
    ),
    r'webOfDeceitTexts': PropertySchema(
      id: 6,
      name: r'webOfDeceitTexts',
      type: IsarType.string,
    ),
    r'zetaTexts': PropertySchema(
      id: 7,
      name: r'zetaTexts',
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
    final value = object.gravehurstTexts;
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
    final value = object.smileTexts;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.unknownTexts;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.webOfDeceitTexts;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.zetaTexts;
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
  writer.writeString(offsets[1], object.gravehurstTexts);
  writer.writeString(offsets[2], object.luckyTexts);
  writer.writeString(offsets[3], object.murderTexts);
  writer.writeString(offsets[4], object.smileTexts);
  writer.writeString(offsets[5], object.unknownTexts);
  writer.writeString(offsets[6], object.webOfDeceitTexts);
  writer.writeString(offsets[7], object.zetaTexts);
}

NewGame _newGameDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NewGame();
  object.behindTexts = reader.readStringOrNull(offsets[0]);
  object.gravehurstTexts = reader.readStringOrNull(offsets[1]);
  object.id = id;
  object.luckyTexts = reader.readStringOrNull(offsets[2]);
  object.murderTexts = reader.readStringOrNull(offsets[3]);
  object.smileTexts = reader.readStringOrNull(offsets[4]);
  object.unknownTexts = reader.readStringOrNull(offsets[5]);
  object.webOfDeceitTexts = reader.readStringOrNull(offsets[6]);
  object.zetaTexts = reader.readStringOrNull(offsets[7]);
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
      gravehurstTextsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gravehurstTexts',
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition>
      gravehurstTextsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gravehurstTexts',
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> gravehurstTextsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gravehurstTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition>
      gravehurstTextsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gravehurstTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> gravehurstTextsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gravehurstTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> gravehurstTextsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gravehurstTexts',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition>
      gravehurstTextsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'gravehurstTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> gravehurstTextsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'gravehurstTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> gravehurstTextsContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gravehurstTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> gravehurstTextsMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gravehurstTexts',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition>
      gravehurstTextsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gravehurstTexts',
        value: '',
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition>
      gravehurstTextsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gravehurstTexts',
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

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> unknownTextsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unknownTexts',
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition>
      unknownTextsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unknownTexts',
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> unknownTextsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unknownTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> unknownTextsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unknownTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> unknownTextsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unknownTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> unknownTextsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unknownTexts',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> unknownTextsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unknownTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> unknownTextsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unknownTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> unknownTextsContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unknownTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> unknownTextsMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unknownTexts',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> unknownTextsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unknownTexts',
        value: '',
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition>
      unknownTextsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unknownTexts',
        value: '',
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition>
      webOfDeceitTextsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'webOfDeceitTexts',
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition>
      webOfDeceitTextsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'webOfDeceitTexts',
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> webOfDeceitTextsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'webOfDeceitTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition>
      webOfDeceitTextsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'webOfDeceitTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition>
      webOfDeceitTextsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'webOfDeceitTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> webOfDeceitTextsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'webOfDeceitTexts',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition>
      webOfDeceitTextsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'webOfDeceitTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition>
      webOfDeceitTextsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'webOfDeceitTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition>
      webOfDeceitTextsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'webOfDeceitTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> webOfDeceitTextsMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'webOfDeceitTexts',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition>
      webOfDeceitTextsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'webOfDeceitTexts',
        value: '',
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition>
      webOfDeceitTextsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'webOfDeceitTexts',
        value: '',
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> zetaTextsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'zetaTexts',
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> zetaTextsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'zetaTexts',
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> zetaTextsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'zetaTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> zetaTextsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'zetaTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> zetaTextsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'zetaTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> zetaTextsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'zetaTexts',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> zetaTextsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'zetaTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> zetaTextsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'zetaTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> zetaTextsContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'zetaTexts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> zetaTextsMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'zetaTexts',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> zetaTextsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'zetaTexts',
        value: '',
      ));
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> zetaTextsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'zetaTexts',
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

  QueryBuilder<NewGame, NewGame, QAfterSortBy> sortByGravehurstTexts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gravehurstTexts', Sort.asc);
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterSortBy> sortByGravehurstTextsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gravehurstTexts', Sort.desc);
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

  QueryBuilder<NewGame, NewGame, QAfterSortBy> sortByUnknownTexts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unknownTexts', Sort.asc);
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterSortBy> sortByUnknownTextsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unknownTexts', Sort.desc);
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterSortBy> sortByWebOfDeceitTexts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webOfDeceitTexts', Sort.asc);
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterSortBy> sortByWebOfDeceitTextsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webOfDeceitTexts', Sort.desc);
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterSortBy> sortByZetaTexts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zetaTexts', Sort.asc);
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterSortBy> sortByZetaTextsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zetaTexts', Sort.desc);
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

  QueryBuilder<NewGame, NewGame, QAfterSortBy> thenByGravehurstTexts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gravehurstTexts', Sort.asc);
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterSortBy> thenByGravehurstTextsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gravehurstTexts', Sort.desc);
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

  QueryBuilder<NewGame, NewGame, QAfterSortBy> thenByUnknownTexts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unknownTexts', Sort.asc);
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterSortBy> thenByUnknownTextsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unknownTexts', Sort.desc);
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterSortBy> thenByWebOfDeceitTexts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webOfDeceitTexts', Sort.asc);
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterSortBy> thenByWebOfDeceitTextsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webOfDeceitTexts', Sort.desc);
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterSortBy> thenByZetaTexts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zetaTexts', Sort.asc);
    });
  }

  QueryBuilder<NewGame, NewGame, QAfterSortBy> thenByZetaTextsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zetaTexts', Sort.desc);
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

  QueryBuilder<NewGame, NewGame, QDistinct> distinctByGravehurstTexts(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gravehurstTexts',
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

  QueryBuilder<NewGame, NewGame, QDistinct> distinctBySmileTexts(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'smileTexts', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NewGame, NewGame, QDistinct> distinctByUnknownTexts(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unknownTexts', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NewGame, NewGame, QDistinct> distinctByWebOfDeceitTexts(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'webOfDeceitTexts',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NewGame, NewGame, QDistinct> distinctByZetaTexts(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'zetaTexts', caseSensitive: caseSensitive);
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

  QueryBuilder<NewGame, String?, QQueryOperations> gravehurstTextsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gravehurstTexts');
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

  QueryBuilder<NewGame, String?, QQueryOperations> smileTextsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'smileTexts');
    });
  }

  QueryBuilder<NewGame, String?, QQueryOperations> unknownTextsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unknownTexts');
    });
  }

  QueryBuilder<NewGame, String?, QQueryOperations> webOfDeceitTextsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'webOfDeceitTexts');
    });
  }

  QueryBuilder<NewGame, String?, QQueryOperations> zetaTextsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'zetaTexts');
    });
  }
}
