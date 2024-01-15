class Anime {
  int? id;
  String? name;
  String? russian;
  ImageAnime? image;
  String? url;
  String? kind;
  String? score;
  String? status;
  int? volumes;
  int? chapters;
  String? airedOn;
  String? releasedOn;

  Anime({
    this.id,
    this.name,
    this.russian,
    this.image,
    this.url,
    this.kind,
    this.score,
    this.status,
    this.volumes,
    this.chapters,
    this.airedOn,
    this.releasedOn,
  });

  factory Anime.fromJson(dynamic json) {
    if (json == null) {
      return Anime();
    }

    return Anime(
      id: json["id"],
      name: json["name"],
      russian: json["russian"],
      url: json["url"],
      image: json['image'] != null ? ImageAnime.fromJson(json['image']) : null,
      kind: json["kind"],
      score: json["score"],
      status: json["status"],
      volumes: json["volumes"],
      chapters: json["chapters"],
      airedOn: json["airedOn"],
      releasedOn: json["releasedOn"],
    );
  }
}

class ImageAnime {
  String? original;
  String? preview;
  String? x96;
  String? x48;

  ImageAnime({
    this.original,
    this.preview,
    this.x96,
    this.x48,
  });

  factory ImageAnime.fromJson(dynamic json) {
    if (json == null) {
      return ImageAnime();
    }

    return ImageAnime(
      original: json['original'],
      preview: json['preview'],
      x96: json['x96'],
      x48: json['x48'],
    );
  }
}
