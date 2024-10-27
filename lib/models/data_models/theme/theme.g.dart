// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetThemeCollection on Isar {
  IsarCollection<Theme> get themes => this.collection();
}

const ThemeSchema = CollectionSchema(
  name: r'Theme',
  id: 265716503294065488,
  properties: {
    r'scheme': PropertySchema(
      id: 0,
      name: r'scheme',
      type: IsarType.byte,
      enumMap: _ThemeschemeEnumValueMap,
    ),
    r'theme': PropertySchema(
      id: 1,
      name: r'theme',
      type: IsarType.byte,
      enumMap: _ThemethemeEnumValueMap,
    )
  },
  estimateSize: _themeEstimateSize,
  serialize: _themeSerialize,
  deserialize: _themeDeserialize,
  deserializeProp: _themeDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _themeGetId,
  getLinks: _themeGetLinks,
  attach: _themeAttach,
  version: '3.1.0+1',
);

int _themeEstimateSize(
  Theme object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _themeSerialize(
  Theme object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByte(offsets[0], object.scheme.index);
  writer.writeByte(offsets[1], object.theme.index);
}

Theme _themeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Theme();
  object.id = id;
  object.scheme = _ThemeschemeValueEnumMap[reader.readByteOrNull(offsets[0])] ??
      FlexScheme.material;
  object.theme = _ThemethemeValueEnumMap[reader.readByteOrNull(offsets[1])] ??
      ThemeType.light;
  return object;
}

P _themeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_ThemeschemeValueEnumMap[reader.readByteOrNull(offset)] ??
          FlexScheme.material) as P;
    case 1:
      return (_ThemethemeValueEnumMap[reader.readByteOrNull(offset)] ??
          ThemeType.light) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ThemeschemeEnumValueMap = {
  'material': 0,
  'materialHc': 1,
  'blue': 2,
  'indigo': 3,
  'hippieBlue': 4,
  'aquaBlue': 5,
  'brandBlue': 6,
  'deepBlue': 7,
  'sakura': 8,
  'mandyRed': 9,
  'red': 10,
  'redWine': 11,
  'purpleBrown': 12,
  'green': 13,
  'money': 14,
  'jungle': 15,
  'greyLaw': 16,
  'wasabi': 17,
  'gold': 18,
  'mango': 19,
  'amber': 20,
  'vesuviusBurn': 21,
  'deepPurple': 22,
  'ebonyClay': 23,
  'barossa': 24,
  'shark': 25,
  'bigStone': 26,
  'damask': 27,
  'bahamaBlue': 28,
  'mallardGreen': 29,
  'espresso': 30,
  'outerSpace': 31,
  'blueWhale': 32,
  'sanJuanBlue': 33,
  'rosewood': 34,
  'blumineBlue': 35,
  'flutterDash': 36,
  'materialBaseline': 37,
  'verdunHemlock': 38,
  'dellGenoa': 39,
  'redM3': 40,
  'pinkM3': 41,
  'purpleM3': 42,
  'indigoM3': 43,
  'blueM3': 44,
  'cyanM3': 45,
  'tealM3': 46,
  'greenM3': 47,
  'limeM3': 48,
  'yellowM3': 49,
  'orangeM3': 50,
  'deepOrangeM3': 51,
  'custom': 52,
};
const _ThemeschemeValueEnumMap = {
  0: FlexScheme.material,
  1: FlexScheme.materialHc,
  2: FlexScheme.blue,
  3: FlexScheme.indigo,
  4: FlexScheme.hippieBlue,
  5: FlexScheme.aquaBlue,
  6: FlexScheme.brandBlue,
  7: FlexScheme.deepBlue,
  8: FlexScheme.sakura,
  9: FlexScheme.mandyRed,
  10: FlexScheme.red,
  11: FlexScheme.redWine,
  12: FlexScheme.purpleBrown,
  13: FlexScheme.green,
  14: FlexScheme.money,
  15: FlexScheme.jungle,
  16: FlexScheme.greyLaw,
  17: FlexScheme.wasabi,
  18: FlexScheme.gold,
  19: FlexScheme.mango,
  20: FlexScheme.amber,
  21: FlexScheme.vesuviusBurn,
  22: FlexScheme.deepPurple,
  23: FlexScheme.ebonyClay,
  24: FlexScheme.barossa,
  25: FlexScheme.shark,
  26: FlexScheme.bigStone,
  27: FlexScheme.damask,
  28: FlexScheme.bahamaBlue,
  29: FlexScheme.mallardGreen,
  30: FlexScheme.espresso,
  31: FlexScheme.outerSpace,
  32: FlexScheme.blueWhale,
  33: FlexScheme.sanJuanBlue,
  34: FlexScheme.rosewood,
  35: FlexScheme.blumineBlue,
  36: FlexScheme.flutterDash,
  37: FlexScheme.materialBaseline,
  38: FlexScheme.verdunHemlock,
  39: FlexScheme.dellGenoa,
  40: FlexScheme.redM3,
  41: FlexScheme.pinkM3,
  42: FlexScheme.purpleM3,
  43: FlexScheme.indigoM3,
  44: FlexScheme.blueM3,
  45: FlexScheme.cyanM3,
  46: FlexScheme.tealM3,
  47: FlexScheme.greenM3,
  48: FlexScheme.limeM3,
  49: FlexScheme.yellowM3,
  50: FlexScheme.orangeM3,
  51: FlexScheme.deepOrangeM3,
  52: FlexScheme.custom,
};
const _ThemethemeEnumValueMap = {
  'light': 0,
  'dark': 1,
};
const _ThemethemeValueEnumMap = {
  0: ThemeType.light,
  1: ThemeType.dark,
};

Id _themeGetId(Theme object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _themeGetLinks(Theme object) {
  return [];
}

void _themeAttach(IsarCollection<dynamic> col, Id id, Theme object) {
  object.id = id;
}

extension ThemeQueryWhereSort on QueryBuilder<Theme, Theme, QWhere> {
  QueryBuilder<Theme, Theme, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ThemeQueryWhere on QueryBuilder<Theme, Theme, QWhereClause> {
  QueryBuilder<Theme, Theme, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Theme, Theme, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Theme, Theme, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Theme, Theme, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Theme, Theme, QAfterWhereClause> idBetween(
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

extension ThemeQueryFilter on QueryBuilder<Theme, Theme, QFilterCondition> {
  QueryBuilder<Theme, Theme, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Theme, Theme, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Theme, Theme, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Theme, Theme, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Theme, Theme, QAfterFilterCondition> schemeEqualTo(
      FlexScheme value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scheme',
        value: value,
      ));
    });
  }

  QueryBuilder<Theme, Theme, QAfterFilterCondition> schemeGreaterThan(
    FlexScheme value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'scheme',
        value: value,
      ));
    });
  }

  QueryBuilder<Theme, Theme, QAfterFilterCondition> schemeLessThan(
    FlexScheme value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'scheme',
        value: value,
      ));
    });
  }

  QueryBuilder<Theme, Theme, QAfterFilterCondition> schemeBetween(
    FlexScheme lower,
    FlexScheme upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'scheme',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Theme, Theme, QAfterFilterCondition> themeEqualTo(
      ThemeType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'theme',
        value: value,
      ));
    });
  }

  QueryBuilder<Theme, Theme, QAfterFilterCondition> themeGreaterThan(
    ThemeType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'theme',
        value: value,
      ));
    });
  }

  QueryBuilder<Theme, Theme, QAfterFilterCondition> themeLessThan(
    ThemeType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'theme',
        value: value,
      ));
    });
  }

  QueryBuilder<Theme, Theme, QAfterFilterCondition> themeBetween(
    ThemeType lower,
    ThemeType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'theme',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ThemeQueryObject on QueryBuilder<Theme, Theme, QFilterCondition> {}

extension ThemeQueryLinks on QueryBuilder<Theme, Theme, QFilterCondition> {}

extension ThemeQuerySortBy on QueryBuilder<Theme, Theme, QSortBy> {
  QueryBuilder<Theme, Theme, QAfterSortBy> sortByScheme() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheme', Sort.asc);
    });
  }

  QueryBuilder<Theme, Theme, QAfterSortBy> sortBySchemeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheme', Sort.desc);
    });
  }

  QueryBuilder<Theme, Theme, QAfterSortBy> sortByTheme() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'theme', Sort.asc);
    });
  }

  QueryBuilder<Theme, Theme, QAfterSortBy> sortByThemeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'theme', Sort.desc);
    });
  }
}

extension ThemeQuerySortThenBy on QueryBuilder<Theme, Theme, QSortThenBy> {
  QueryBuilder<Theme, Theme, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Theme, Theme, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Theme, Theme, QAfterSortBy> thenByScheme() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheme', Sort.asc);
    });
  }

  QueryBuilder<Theme, Theme, QAfterSortBy> thenBySchemeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheme', Sort.desc);
    });
  }

  QueryBuilder<Theme, Theme, QAfterSortBy> thenByTheme() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'theme', Sort.asc);
    });
  }

  QueryBuilder<Theme, Theme, QAfterSortBy> thenByThemeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'theme', Sort.desc);
    });
  }
}

extension ThemeQueryWhereDistinct on QueryBuilder<Theme, Theme, QDistinct> {
  QueryBuilder<Theme, Theme, QDistinct> distinctByScheme() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scheme');
    });
  }

  QueryBuilder<Theme, Theme, QDistinct> distinctByTheme() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'theme');
    });
  }
}

extension ThemeQueryProperty on QueryBuilder<Theme, Theme, QQueryProperty> {
  QueryBuilder<Theme, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Theme, FlexScheme, QQueryOperations> schemeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scheme');
    });
  }

  QueryBuilder<Theme, ThemeType, QQueryOperations> themeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'theme');
    });
  }
}
