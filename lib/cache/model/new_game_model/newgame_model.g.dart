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
    r'murderTexts': PropertySchema(
      id: 0,
      name: r'murderTexts',
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
  bytesCount += 3 + object.murderTexts.length * 3;
  return bytesCount;
}

void _newGameSerialize(
  NewGame object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.murderTexts);
}

NewGame _newGameDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NewGame();
  object.id = id;
  object.murderTexts = reader.readString(offsets[0]);
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
      return (reader.readString(offset)) as P;
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

  QueryBuilder<NewGame, NewGame, QAfterFilterCondition> murderTextsEqualTo(
    String value, {
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
    String value, {
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
    String value, {
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
    String lower,
    String upper, {
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
}

extension NewGameQueryObject
    on QueryBuilder<NewGame, NewGame, QFilterCondition> {}

extension NewGameQueryLinks
    on QueryBuilder<NewGame, NewGame, QFilterCondition> {}

extension NewGameQuerySortBy on QueryBuilder<NewGame, NewGame, QSortBy> {
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
}

extension NewGameQuerySortThenBy
    on QueryBuilder<NewGame, NewGame, QSortThenBy> {
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
}

extension NewGameQueryWhereDistinct
    on QueryBuilder<NewGame, NewGame, QDistinct> {
  QueryBuilder<NewGame, NewGame, QDistinct> distinctByMurderTexts(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'murderTexts', caseSensitive: caseSensitive);
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

  QueryBuilder<NewGame, String, QQueryOperations> murderTextsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'murderTexts');
    });
  }
}
