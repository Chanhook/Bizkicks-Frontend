class Kickboard {
  final int id;
  final String company_name;
  final double lat;
  final double lng;
  final int battery;
  final String model;
  final String pastPicture;

  Kickboard(this.id,this.company_name, this.lat, this.lng, this.battery, this.model,
      this.pastPicture);
  Kickboard.fromJson(Map<String, dynamic> json)
      : id=json['id'],
        company_name = json['company_name'],
        lat = json['lat'],
        lng = json['lng'],
        battery = json['battery'],
        model = json['model'],
        pastPicture = json['pastPicture'];

  Map<String, dynamic> toJson() =>
      {
        'id':id,
        'company_name' : company_name,
        'lat' :lat,
        'lng' :lng,
        'battery' :battery,
        'model' :model,
        'pastPicture':pastPicture
      };
  }


