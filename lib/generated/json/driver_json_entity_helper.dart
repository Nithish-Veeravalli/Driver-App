import 'package:priority_pulse/driver_json_entity.dart';

driverJsonEntityFromJson(DriverJsonEntity data, Map<String, dynamic> json) {
	if (json['username'] != null) {
		data.username = json['username']?.toString();
	}
	if (json['mobileNo'] != null) {
		data.mobileNo = json['mobileNo']?.toInt();
	}
	return data;
}

Map<String, dynamic> driverJsonEntityToJson(DriverJsonEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['username'] = entity.username;
	data['mobileNo'] = entity.mobileNo;
	return data;
}