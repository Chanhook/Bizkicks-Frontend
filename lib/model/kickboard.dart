class Kickboard {
  final String company_name;
  final double lat;
  final double lng;
  final int battery;
  final String model;
  final String past_picture;

  Kickboard(this.company_name, this.lat, this.lng, this.battery, this.model,
      this.past_picture);
  Kickboard.fromJson(Map<String, dynamic> json)
      : company_name = json['company_name'],
        lat = json['lat'],
        lng = json['lng'],
        battery = json['battery'],
        model = json['model'],
        past_picture = json['past_picture'];

  Map<String, dynamic> toJson() =>
      {
        'company_name' : company_name,
        'lat' :lat,
        'lng' :lng,
        'battery' :battery,
        'model' :model,
        'past_picture':past_picture
      };
  }


