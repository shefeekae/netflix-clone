class Welcome {
  Welcome({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  int? page;
  List<Result?>? results;
  int? totalPages;
  int? totalResults;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        page: json["page"],
        results: json["results"] == null
            ? []
            : List<Result?>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x!.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class Result {
  Result({
    this.backdropPath,
    this.originalName,
    this.overview,
    this.posterPath,
    this.originalTitle,
  });

  String? backdropPath;

  String? originalName;
  String? overview;
  String? posterPath;

  String? originalTitle;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        backdropPath: json["backdrop_path"],
        originalName: json["original_name"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        originalTitle: json["original_title"],
      );

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "original_name": originalName,
        "overview": overview,
        "poster_path": posterPath,
        "original_title": originalTitle,
      };
}

enum MediaType { TV, MOVIE }

final mediaTypeValues =
    EnumValues({"movie": MediaType.MOVIE, "tv": MediaType.TV});

enum OriginalLanguage { EN, ZH, FR, ES }

final originalLanguageValues = EnumValues({
  "en": OriginalLanguage.EN,
  "es": OriginalLanguage.ES,
  "fr": OriginalLanguage.FR,
  "zh": OriginalLanguage.ZH
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
