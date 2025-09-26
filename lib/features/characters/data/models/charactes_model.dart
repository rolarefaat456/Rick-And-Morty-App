class CharactersModel {
  late String name, species, image, statusDeadOrAlife, gender, created;
  late int id;
  Origin? origin;
  Origin? location;
  late List<dynamic> episode;

  CharactersModel.fromJson(
    Map<String, dynamic> json,
  ) // keda b3ml mn el model ela json w adytha asm json
  {
    // kedad b3t ll back json
    id = json['id'];
    name = json['name'];
    species = json['species'];
    image = json['image'];
    statusDeadOrAlife = json['status'];
    gender = json['gender'];
    created = json['created'];
    // location = json['location'];
    // origin = json['origin'];
    origin = json['origin'] != null ? Origin.fromJson(json['origin']) : null;
    location = json['location'] != null ? Origin.fromJson(json['location']) : null;
    episode = json['episode'].cast<String>();
  }

  

  
}


//! da mn moke3 asmo JSON To Dart
// class CharactesModel {
//   Info? info;
//   List<Results>? results;

//   CharactesModel({this.info, this.results});

//   CharactesModel.fromJson(Map<String, dynamic> json) {
//     info = json['info'] != null ? Info.fromJson(json['info']) : null;
//     if (json['results'] != null) {
//       results = <Results>[];
//       json['results'].forEach((v) {
//         results!.add Results.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data =  Map<String, dynamic>();
//     if (info != null) {
//       data['info'] = info!.toJson();
//     }
//     if (this.results != null) {
//       data['results'] = this.results!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Info {
//   int? count;
//   int? pages;
//   String? next;
//   Null prev;

//   Info({this.count, this.pages, this.next, this.prev});

//   Info.fromJson(Map<String, dynamic> json) {
//     count = json['count'];
//     pages = json['pages'];
//     next = json['next'];
//     prev = json['prev'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['count'] = count;
//     data['pages'] = pages;
//     data['next'] = next;
//     data['prev'] = prev;
//     return data;
//   }
// }

// class Results {
//   int? id;
//   String? name;
//   String? status;
//   String? species;
//   String? type;
//   String? gender;
//   Origin? origin;
//   Origin? location;
//   String? image;
//   List<String>? episode;
//   String? url;
//   String? created;

//   Results(
//       {this.id,
//       this.name,
//       this.status,
//       this.species,
//       this.type,
//       this.gender,
//       this.origin,
//       this.location,
//       this.image,
//       this.episode,
//       this.url,
//       this.created});

//   Results.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     status = json['status'];
//     species = json['species'];
//     type = json['type'];
//     gender = json['gender'];
//     origin =
//         json['origin'] != null ? Origin.fromJson(json['origin']) : null;
//     location =
//         json['location'] != null ? Origin.fromJson(json['location']) : null;
//     image = json['image'];
//     episode = json['episode'].cast<String>();
//     url = json['url'];
//     created = json['created'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['status'] = this.status;
//     data['species'] = this.species;
//     data['type'] = this.type;
//     data['gender'] = this.gender;
//     if (this.origin != null) {
//       data['origin'] = this.origin!.toJson();
//     }
//     if (this.location != null) {
//       data['location'] = this.location!.toJson();
//     }
//     data['image'] = this.image;
//     data['episode'] = this.episode;
//     data['url'] = this.url;
//     data['created'] = this.created;
//     return data;
//   }
// }

class Origin {
  String? name;
  String? url;

  Origin({this.name, this.url});

  Origin.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}
