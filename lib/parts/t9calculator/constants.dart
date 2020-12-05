class Constants {
  static final Constants _singleton = Constants._internal();
  Constants._internal();
  factory Constants() {
    return _singleton;
  }

  static final List<String> cavalryResearchTitles = [
    'Cavalry Recruitment',
    'Squirehood',
    'Warpath',
    'Plain Skirmish',
    'Ebony Barding',
    'Empire Defender'
  ];
  static final List<String> archerResearchTitles = [
    'Archer Recruitment',
    'Archer Conscription',
    'Hunt',
    'Arrow Hail',
    'Poisoned Arrow-Head',
    'Tier 9 Archers'
  ];
  static final List<String> footmanResearchTitles = [
    'Footman Mobilization',
    'Footman Conscription',
    'Royal Shield',
    'Claymore',
    'Chain Armor',
    'Empire Defender'
  ];
}
