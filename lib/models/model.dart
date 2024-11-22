class Weather_data {
  Location? location;
  Current? current;

  Weather_data({this.location, this.current});

  Weather_data.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    current =
        json['current'] != null ? new Current.fromJson(json['current']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location?.toJson();
    }
    if (this.current != null) {
      data['current'] = this.current?.toJson();
    }
    return data;
  }
}

class Location {
  String? name;
  String? region;
  String ?country;

  Location({this.name, this.region, this.country});

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    region = json['region'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['region'] = this.region;
    data['country'] = this.country;
    return data;
  }
}

class Current {
  Condition? condition;

  Current({this.condition});

  Current.fromJson(Map<String, dynamic> json) {
    condition = json['condition'] != null
        ? new Condition.fromJson(json['condition'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.condition != null) {
      data['condition'] = this.condition?.toJson();
    }
    return data;
  }
}

class Condition {
  String? text;

  Condition({this.text});

  Condition.fromJson(Map<String, dynamic> json) {
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    return data;
  }
}
