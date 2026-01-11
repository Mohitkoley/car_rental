class CarModel {
  final String id;
  final String brand;
  final String model;
  final String imageUrl;
  final double pricePerDay;
  final String transmission;
  final String fuelType;
  final String description;
  final int seats;
  final String range;
  final String topSpeed;
  final String enginePower;
  final String driveType;
  final bool isAvailable;

  CarModel({
    required this.id,
    required this.brand,
    required this.model,
    required this.imageUrl,
    required this.pricePerDay,
    required this.transmission,
    required this.fuelType,
    required this.description,
    required this.seats,
    this.range = '500km',
    this.topSpeed = '200km/h',
    this.enginePower = '300Hp',
    this.driveType = 'AWD',
    this.isAvailable = true,
  });
  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['id'],
      brand: json['brand'],
      model: json['model'],
      imageUrl: json['imageUrl'],
      pricePerDay: json['pricePerDay'],
      transmission: json['transmission'],
      fuelType: json['fuelType'],
      description: json['description'],
      seats: json['seats'],
      range: json['range'] ?? '500km',
      topSpeed: json['topSpeed'] ?? '200km/h',
      enginePower: json['enginePower'] ?? '300Hp',
      driveType: json['driveType'] ?? 'AWD',
      isAvailable: json['isAvailable'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'brand': brand,
      'model': model,
      'imageUrl': imageUrl,
      'pricePerDay': pricePerDay,
      'transmission': transmission,
      'fuelType': fuelType,
      'description': description,
      'seats': seats,
      'range': range,
      'topSpeed': topSpeed,
      'enginePower': enginePower,
      'driveType': driveType,
      'isAvailable': isAvailable,
    };
  }
}
