class Language {
  String englishName;
  String localName;
  String flag;
  bool checked;

  Language({this.englishName, this.localName, this.flag, this.checked});
}

class LanguagesList {
  List<Language> _languages;

  LanguagesList() {
    this._languages = [
      new Language(
        englishName: "English",
        localName: "English",
        flag: "img/united-states-of-america.png",
        checked: true,
      ),
      new Language(
        englishName: "Hindi",
        localName: "हिन्दी",
        flag: "img/Flag_India.jpg",
        checked: false,
      ),
    ];
  }

  List<Language> get languages => _languages;
}
