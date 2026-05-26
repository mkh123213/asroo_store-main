// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_address_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShippingAddressModelAdapter extends TypeAdapter<ShippingAddressModel> {
  @override
  final int typeId = 3;

  @override
  ShippingAddressModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShippingAddressModel(
      fullName: fields[0] as String,
      phoneNumber: fields[1] as String,
      city: fields[2] as String,
      area: fields[3] as String,
      street: fields[4] as String,
      buildingNo: fields[5] as String,
      floor: fields[6] as String,
      addressNotes: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ShippingAddressModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.fullName)
      ..writeByte(1)
      ..write(obj.phoneNumber)
      ..writeByte(2)
      ..write(obj.city)
      ..writeByte(3)
      ..write(obj.area)
      ..writeByte(4)
      ..write(obj.street)
      ..writeByte(5)
      ..write(obj.buildingNo)
      ..writeByte(6)
      ..write(obj.floor)
      ..writeByte(7)
      ..write(obj.addressNotes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShippingAddressModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
