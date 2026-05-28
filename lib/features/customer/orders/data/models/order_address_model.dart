class OrderAddressModel {
  OrderAddressModel({
    required this.fullName,
    required this.phone,
    required this.city,
    required this.area,
    required this.street,
    required this.buildingNo,
    required this.floorOrApartment,
    this.notes,
  });

  factory OrderAddressModel.fromJson(Map<String, dynamic> json) {
    return OrderAddressModel(
      fullName: json['fullName'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      city: json['city'] as String? ?? '',
      area: json['area'] as String? ?? '',
      street: json['street'] as String? ?? '',
      buildingNo: json['buildingNo'] as String? ?? '',
      floorOrApartment: json['floorOrApartment'] as String? ?? '',
      notes: json['notes'] as String?,
    );
  }

  final String fullName;
  final String phone;
  final String city;
  final String area;
  final String street;
  final String buildingNo;
  final String floorOrApartment;
  final String? notes;

  Map<String, dynamic> toJson() => {
        'fullName': fullName,
        'phone': phone,
        'city': city,
        'area': area,
        'street': street,
        'buildingNo': buildingNo,
        'floorOrApartment': floorOrApartment,
        'notes': notes,
      };
}
