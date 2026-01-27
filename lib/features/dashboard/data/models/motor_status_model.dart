class MotorStatusModel {
  int? id;
  String? sysDate;
  String? deviceId;
  double? logitude;
  double? latitude;
  dynamic locationTime;
  String? motorStatus;
  String? motorOnTime;
  String? motorOffTime;
  double? electricConsumption;
  dynamic electricConsumptionTime;
  double? humidity;
  dynamic humidityTime;
  double? temperature;
  dynamic temperatureTime;
  double? waterFlow;
  dynamic waterFlowTime;
  double? voltage; // ✅ CHANGED FROM int → double
  dynamic vl1;
  dynamic vl2;
  dynamic vl3;
  double? currentValue;
  dynamic il1;
  dynamic il2;
  dynamic il3;
  dynamic frequency;
  dynamic apparentEnergy;
  double? energy;
  double? power;
  double? powerFactor;
  bool? isEarthFaultsAppear;
  bool? isHighElectricUsage;
  bool? isLowElectricUsage;
  int? energyUsageInterval;

  MotorStatusModel({
    this.id,
    this.sysDate,
    this.deviceId,
    this.logitude,
    this.latitude,
    this.locationTime,
    this.motorStatus,
    this.motorOnTime,
    this.motorOffTime,
    this.electricConsumption,
    this.electricConsumptionTime,
    this.humidity,
    this.humidityTime,
    this.temperature,
    this.temperatureTime,
    this.waterFlow,
    this.waterFlowTime,
    this.voltage,
    this.vl1,
    this.vl2,
    this.vl3,
    this.currentValue,
    this.il1,
    this.il2,
    this.il3,
    this.frequency,
    this.apparentEnergy,
    this.energy,
    this.power,
    this.powerFactor,
    this.isEarthFaultsAppear,
    this.isHighElectricUsage,
    this.isLowElectricUsage,
    this.energyUsageInterval,
  });

  MotorStatusModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sysDate = json['sysDate'];
    deviceId = json['deviceId'];

    logitude = (json['logitude'] as num?)?.toDouble();
    latitude = (json['latitude'] as num?)?.toDouble();

    locationTime = json['locationTime'];
    motorStatus = json['motorStatus'];
    motorOnTime = json['motorOnTime'];
    motorOffTime = json['motorOffTime'];

    electricConsumption = (json['electricConsumption'] as num?)?.toDouble();
    electricConsumptionTime = json['electricConsumptionTime'];

    humidity = (json['humidity'] as num?)?.toDouble();
    humidityTime = json['humidityTime'];

    temperature = (json['temperature'] as num?)?.toDouble();
    temperatureTime = json['temperatureTime'];

    waterFlow = (json['waterFlow'] as num?)?.toDouble();
    waterFlowTime = json['waterFlowTime'];

    voltage = (json['voltage'] as num?)?.toDouble(); // ✅ SAFE

    vl1 = json['vl1'];
    vl2 = json['vl2'];
    vl3 = json['vl3'];

    currentValue = (json['currentValue'] as num?)?.toDouble();

    il1 = json['il1'];
    il2 = json['il2'];
    il3 = json['il3'];
    frequency = json['frequency'];
    apparentEnergy = json['apparentEnergy'];

    energy = (json['energy'] as num?)?.toDouble();
    power = (json['power'] as num?)?.toDouble();
    powerFactor = (json['powerFactor'] as num?)?.toDouble();

    isEarthFaultsAppear = json['isEarthFaultsAppear'];
    isHighElectricUsage = json['isHighElectricUsage'];
    isLowElectricUsage = json['isLowElectricUsage'];
    energyUsageInterval = json['energyUsageInterval'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sysDate': sysDate,
      'deviceId': deviceId,
      'logitude': logitude,
      'latitude': latitude,
      'locationTime': locationTime,
      'motorStatus': motorStatus,
      'motorOnTime': motorOnTime,
      'motorOffTime': motorOffTime,
      'electricConsumption': electricConsumption,
      'electricConsumptionTime': electricConsumptionTime,
      'humidity': humidity,
      'humidityTime': humidityTime,
      'temperature': temperature,
      'temperatureTime': temperatureTime,
      'waterFlow': waterFlow,
      'waterFlowTime': waterFlowTime,
      'voltage': voltage,
      'vl1': vl1,
      'vl2': vl2,
      'vl3': vl3,
      'currentValue': currentValue,
      'il1': il1,
      'il2': il2,
      'il3': il3,
      'frequency': frequency,
      'apparentEnergy': apparentEnergy,
      'energy': energy,
      'power': power,
      'powerFactor': powerFactor,
      'isEarthFaultsAppear': isEarthFaultsAppear,
      'isHighElectricUsage': isHighElectricUsage,
      'isLowElectricUsage': isLowElectricUsage,
      'energyUsageInterval': energyUsageInterval,
    };
  }
}
