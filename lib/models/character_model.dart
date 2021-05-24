class CharacterModel {
  int id;
  String name;
  String species;
  String gender;
  String house;
  String dateOfBirth;
  String yearOfBirth;
  String ancestry;
  String eyeColour;
  String hairColour;
  Wand wand;
  String patronus;
  int hogwartsStudent;
  int hogwartsStaff;
  String actor;
  int alive;
  String image;
  int favorite;

  CharacterModel(
      {this.id,
      this.name,
      this.species,
      this.gender,
      this.house,
      this.dateOfBirth,
      this.yearOfBirth,
      this.ancestry,
      this.eyeColour,
      this.hairColour,
      this.wand,
      this.patronus,
      this.hogwartsStudent,
      this.hogwartsStaff,
      this.actor,
      this.alive,
      this.image,
      this.favorite});

  CharacterModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    species = json['species'];
    gender = json['gender'];
    house = json['house'];
    dateOfBirth = json['dateOfBirth'].toString();
    yearOfBirth = json['yearOfBirth'].toString();
    ancestry = json['ancestry'];
    eyeColour = json['eyeColour'];
    hairColour = json['hairColour'];
    wand = json['wand'] != null ? new Wand.fromJson(json['wand']) : null;
    patronus = json['patronus'];
    hogwartsStudent = json['hogwartsStudent'] ? 1 : 0;
    hogwartsStaff = json['hogwartsStaff'] ? 1 : 0;
    actor = json['actor'];
    alive = json['alive'] ? 1 : 0;
    image = json['image'].toString().replaceAll('http', 'https');
    favorite = 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['species'] = this.species;
    data['gender'] = this.gender;
    data['house'] = this.house;
    data['dateOfBirth'] = this.dateOfBirth;
    data['yearOfBirth'] = this.yearOfBirth;
    data['ancestry'] = this.ancestry;
    data['eyeColour'] = this.eyeColour;
    data['hairColour'] = this.hairColour;
    if (this.wand != null) {
      data['wand'] = this.wand.toJson();
    }
    data['patronus'] = this.patronus;
    data['hogwartsStudent'] = this.hogwartsStudent;
    data['hogwartsStaff'] = this.hogwartsStaff;
    data['actor'] = this.actor;
    data['alive'] = this.alive;
    data['image'] = this.image;
    return data;
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
    'id' : id,
    'name' : name,
    'species' : species,
    'gender' : gender,
    'house' : house,
    'dateOfBirth' : dateOfBirth,
    'yearOfBirth' : yearOfBirth,
    'ancestry' : ancestry,
    'eyeColour' : eyeColour,
    'hairColour' : hairColour,
    // if (this.wand !: null) {
    //   wand,
    // },
    'patronus' : patronus,
    'hogwartsStudent' : hogwartsStudent,
    'hogwartsStaff' : hogwartsStaff,
    'actor' : actor,
    'alive' : alive,
    'image' : image,
    'favorite' : favorite,
    };
    

    return map;
  }

  factory CharacterModel.fromMap(Map<String, dynamic> data) {
    return CharacterModel(
        id: data['id'],
        name: data['name'],
        species: data['species'],
        gender: data['gender'],
        house: data['house'],
        dateOfBirth: data['dateOfBirth'],
        yearOfBirth: data['yearOfBirth'],
        ancestry: data['ancestry'],
        eyeColour: data['eyeColour'],
        hairColour: data['hairColour'],
        // if (this.wand != null) {
        //   data['wand'],
        // },
        patronus: data['patronus'],
        hogwartsStudent: data['hogwartsStudent'],
        hogwartsStaff: data['hogwartsStaff'],
        actor: data['actor'],
        alive: data['alive'],
        image: data['image'],
        favorite: data['favorite']);
  }
}

class Wand {
  String wood;
  String core;
  var length;

  Wand({this.wood, this.core, this.length});

  Wand.fromJson(Map<String, dynamic> json) {
    wood = json['wood'];
    core = json['core'];
    length = json['length'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wood'] = this.wood;
    data['core'] = this.core;
    data['length'] = this.length;
    return data;
  }
}
