import 'package:priority_pulse/directions_json_entity.dart';

directionsJsonEntityFromJson(DirectionsJsonEntity data, Map<String, dynamic> json) {
	if (json['geocoded_waypoints'] != null) {
		data.geocodedWaypoints = new List<DirectionsJsonGeocodedWaypoint>();
		(json['geocoded_waypoints'] as List).forEach((v) {
			data.geocodedWaypoints.add(new DirectionsJsonGeocodedWaypoint().fromJson(v));
		});
	}
	if (json['routes'] != null) {
		data.routes = new List<DirectionsJsonRoute>();
		(json['routes'] as List).forEach((v) {
			data.routes.add(new DirectionsJsonRoute().fromJson(v));
		});
	}
	if (json['status'] != null) {
		data.status = json['status']?.toString();
	}
	return data;
}

Map<String, dynamic> directionsJsonEntityToJson(DirectionsJsonEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.geocodedWaypoints != null) {
		data['geocoded_waypoints'] =  entity.geocodedWaypoints.map((v) => v.toJson()).toList();
	}
	if (entity.routes != null) {
		data['routes'] =  entity.routes.map((v) => v.toJson()).toList();
	}
	data['status'] = entity.status;
	return data;
}

directionsJsonGeocodedWaypointFromJson(DirectionsJsonGeocodedWaypoint data, Map<String, dynamic> json) {
	if (json['geocoder_status'] != null) {
		data.geocoderStatus = json['geocoder_status']?.toString();
	}
	if (json['place_id'] != null) {
		data.placeId = json['place_id']?.toString();
	}
	if (json['types'] != null) {
		data.types = json['types']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	return data;
}

Map<String, dynamic> directionsJsonGeocodedWaypointToJson(DirectionsJsonGeocodedWaypoint entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['geocoder_status'] = entity.geocoderStatus;
	data['place_id'] = entity.placeId;
	data['types'] = entity.types;
	return data;
}

directionsJsonRouteFromJson(DirectionsJsonRoute data, Map<String, dynamic> json) {
	if (json['bounds'] != null) {
		data.bounds = new DirectionsJsonRoutesBounds().fromJson(json['bounds']);
	}
	if (json['copyrights'] != null) {
		data.copyrights = json['copyrights']?.toString();
	}
	if (json['legs'] != null) {
		data.legs = new List<DirectionsJsonRoutesLeg>();
		(json['legs'] as List).forEach((v) {
			data.legs.add(new DirectionsJsonRoutesLeg().fromJson(v));
		});
	}
	if (json['overview_polyline'] != null) {
		data.overviewPolyline = new DirectionsJsonRoutesOverviewPolyline().fromJson(json['overview_polyline']);
	}
	if (json['summary'] != null) {
		data.summary = json['summary']?.toString();
	}
	if (json['warnings'] != null) {
		data.warnings = new List<dynamic>();
		data.warnings.addAll(json['warnings']);
	}
	if (json['waypoint_order'] != null) {
		data.waypointOrder = new List<dynamic>();
		data.waypointOrder.addAll(json['waypoint_order']);
	}
	return data;
}

Map<String, dynamic> directionsJsonRouteToJson(DirectionsJsonRoute entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.bounds != null) {
		data['bounds'] = entity.bounds.toJson();
	}
	data['copyrights'] = entity.copyrights;
	if (entity.legs != null) {
		data['legs'] =  entity.legs.map((v) => v.toJson()).toList();
	}
	if (entity.overviewPolyline != null) {
		data['overview_polyline'] = entity.overviewPolyline.toJson();
	}
	data['summary'] = entity.summary;
	if (entity.warnings != null) {
		data['warnings'] =  [];
	}
	if (entity.waypointOrder != null) {
		data['waypoint_order'] =  [];
	}
	return data;
}

directionsJsonRoutesBoundsFromJson(DirectionsJsonRoutesBounds data, Map<String, dynamic> json) {
	if (json['northeast'] != null) {
		data.northeast = new DirectionsJsonRoutesBoundsNortheast().fromJson(json['northeast']);
	}
	if (json['southwest'] != null) {
		data.southwest = new DirectionsJsonRoutesBoundsSouthwest().fromJson(json['southwest']);
	}
	return data;
}

Map<String, dynamic> directionsJsonRoutesBoundsToJson(DirectionsJsonRoutesBounds entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.northeast != null) {
		data['northeast'] = entity.northeast.toJson();
	}
	if (entity.southwest != null) {
		data['southwest'] = entity.southwest.toJson();
	}
	return data;
}

directionsJsonRoutesBoundsNortheastFromJson(DirectionsJsonRoutesBoundsNortheast data, Map<String, dynamic> json) {
	if (json['lat'] != null) {
		data.lat = json['lat']?.toDouble();
	}
	if (json['lng'] != null) {
		data.lng = json['lng']?.toDouble();
	}
	return data;
}

Map<String, dynamic> directionsJsonRoutesBoundsNortheastToJson(DirectionsJsonRoutesBoundsNortheast entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['lat'] = entity.lat;
	data['lng'] = entity.lng;
	return data;
}

directionsJsonRoutesBoundsSouthwestFromJson(DirectionsJsonRoutesBoundsSouthwest data, Map<String, dynamic> json) {
	if (json['lat'] != null) {
		data.lat = json['lat']?.toDouble();
	}
	if (json['lng'] != null) {
		data.lng = json['lng']?.toDouble();
	}
	return data;
}

Map<String, dynamic> directionsJsonRoutesBoundsSouthwestToJson(DirectionsJsonRoutesBoundsSouthwest entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['lat'] = entity.lat;
	data['lng'] = entity.lng;
	return data;
}

directionsJsonRoutesLegFromJson(DirectionsJsonRoutesLeg data, Map<String, dynamic> json) {
	if (json['distance'] != null) {
		data.distance = new DirectionsJsonRoutesLegsDistance().fromJson(json['distance']);
	}
	if (json['duration'] != null) {
		data.duration = new DirectionsJsonRoutesLegsDuration().fromJson(json['duration']);
	}
	if (json['end_address'] != null) {
		data.endAddress = json['end_address']?.toString();
	}
	if (json['end_location'] != null) {
		data.endLocation = new DirectionsJsonRoutesLegsEndLocation().fromJson(json['end_location']);
	}
	if (json['start_address'] != null) {
		data.startAddress = json['start_address']?.toString();
	}
	if (json['start_location'] != null) {
		data.startLocation = new DirectionsJsonRoutesLegsStartLocation().fromJson(json['start_location']);
	}
	if (json['steps'] != null) {
		data.steps = new List<DirectionsJsonRoutesLegsStep>();
		(json['steps'] as List).forEach((v) {
			data.steps.add(new DirectionsJsonRoutesLegsStep().fromJson(v));
		});
	}
	if (json['traffic_speed_entry'] != null) {
		data.trafficSpeedEntry = new List<dynamic>();
		data.trafficSpeedEntry.addAll(json['traffic_speed_entry']);
	}
	if (json['via_waypoint'] != null) {
		data.viaWaypoint = new List<dynamic>();
		data.viaWaypoint.addAll(json['via_waypoint']);
	}
	return data;
}

Map<String, dynamic> directionsJsonRoutesLegToJson(DirectionsJsonRoutesLeg entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.distance != null) {
		data['distance'] = entity.distance.toJson();
	}
	if (entity.duration != null) {
		data['duration'] = entity.duration.toJson();
	}
	data['end_address'] = entity.endAddress;
	if (entity.endLocation != null) {
		data['end_location'] = entity.endLocation.toJson();
	}
	data['start_address'] = entity.startAddress;
	if (entity.startLocation != null) {
		data['start_location'] = entity.startLocation.toJson();
	}
	if (entity.steps != null) {
		data['steps'] =  entity.steps.map((v) => v.toJson()).toList();
	}
	if (entity.trafficSpeedEntry != null) {
		data['traffic_speed_entry'] =  [];
	}
	if (entity.viaWaypoint != null) {
		data['via_waypoint'] =  [];
	}
	return data;
}

directionsJsonRoutesLegsDistanceFromJson(DirectionsJsonRoutesLegsDistance data, Map<String, dynamic> json) {
	if (json['text'] != null) {
		data.text = json['text']?.toString();
	}
	if (json['value'] != null) {
		data.value = json['value']?.toInt();
	}
	return data;
}

Map<String, dynamic> directionsJsonRoutesLegsDistanceToJson(DirectionsJsonRoutesLegsDistance entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['text'] = entity.text;
	data['value'] = entity.value;
	return data;
}

directionsJsonRoutesLegsDurationFromJson(DirectionsJsonRoutesLegsDuration data, Map<String, dynamic> json) {
	if (json['text'] != null) {
		data.text = json['text']?.toString();
	}
	if (json['value'] != null) {
		data.value = json['value']?.toInt();
	}
	return data;
}

Map<String, dynamic> directionsJsonRoutesLegsDurationToJson(DirectionsJsonRoutesLegsDuration entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['text'] = entity.text;
	data['value'] = entity.value;
	return data;
}

directionsJsonRoutesLegsEndLocationFromJson(DirectionsJsonRoutesLegsEndLocation data, Map<String, dynamic> json) {
	if (json['lat'] != null) {
		data.lat = json['lat']?.toDouble();
	}
	if (json['lng'] != null) {
		data.lng = json['lng']?.toDouble();
	}
	return data;
}

Map<String, dynamic> directionsJsonRoutesLegsEndLocationToJson(DirectionsJsonRoutesLegsEndLocation entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['lat'] = entity.lat;
	data['lng'] = entity.lng;
	return data;
}

directionsJsonRoutesLegsStartLocationFromJson(DirectionsJsonRoutesLegsStartLocation data, Map<String, dynamic> json) {
	if (json['lat'] != null) {
		data.lat = json['lat']?.toDouble();
	}
	if (json['lng'] != null) {
		data.lng = json['lng']?.toDouble();
	}
	return data;
}

Map<String, dynamic> directionsJsonRoutesLegsStartLocationToJson(DirectionsJsonRoutesLegsStartLocation entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['lat'] = entity.lat;
	data['lng'] = entity.lng;
	return data;
}

directionsJsonRoutesLegsStepFromJson(DirectionsJsonRoutesLegsStep data, Map<String, dynamic> json) {
	if (json['distance'] != null) {
		data.distance = new DirectionsJsonRoutesLegsStepsDistance().fromJson(json['distance']);
	}
	if (json['duration'] != null) {
		data.duration = new DirectionsJsonRoutesLegsStepsDuration().fromJson(json['duration']);
	}
	if (json['end_location'] != null) {
		data.endLocation = new DirectionsJsonRoutesLegsStepsEndLocation().fromJson(json['end_location']);
	}
	if (json['html_instructions'] != null) {
		data.htmlInstructions = json['html_instructions']?.toString();
	}
	if (json['polyline'] != null) {
		data.polyline = new DirectionsJsonRoutesLegsStepsPolyline().fromJson(json['polyline']);
	}
	if (json['start_location'] != null) {
		data.startLocation = new DirectionsJsonRoutesLegsStepsStartLocation().fromJson(json['start_location']);
	}
	if (json['travel_mode'] != null) {
		data.travelMode = json['travel_mode']?.toString();
	}
	if (json['maneuver'] != null) {
		data.maneuver = json['maneuver']?.toString();
	}
	return data;
}

Map<String, dynamic> directionsJsonRoutesLegsStepToJson(DirectionsJsonRoutesLegsStep entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.distance != null) {
		data['distance'] = entity.distance.toJson();
	}
	if (entity.duration != null) {
		data['duration'] = entity.duration.toJson();
	}
	if (entity.endLocation != null) {
		data['end_location'] = entity.endLocation.toJson();
	}
	data['html_instructions'] = entity.htmlInstructions;
	if (entity.polyline != null) {
		data['polyline'] = entity.polyline.toJson();
	}
	if (entity.startLocation != null) {
		data['start_location'] = entity.startLocation.toJson();
	}
	data['travel_mode'] = entity.travelMode;
	data['maneuver'] = entity.maneuver;
	return data;
}

directionsJsonRoutesLegsStepsDistanceFromJson(DirectionsJsonRoutesLegsStepsDistance data, Map<String, dynamic> json) {
	if (json['text'] != null) {
		data.text = json['text']?.toString();
	}
	if (json['value'] != null) {
		data.value = json['value']?.toInt();
	}
	return data;
}

Map<String, dynamic> directionsJsonRoutesLegsStepsDistanceToJson(DirectionsJsonRoutesLegsStepsDistance entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['text'] = entity.text;
	data['value'] = entity.value;
	return data;
}

directionsJsonRoutesLegsStepsDurationFromJson(DirectionsJsonRoutesLegsStepsDuration data, Map<String, dynamic> json) {
	if (json['text'] != null) {
		data.text = json['text']?.toString();
	}
	if (json['value'] != null) {
		data.value = json['value']?.toInt();
	}
	return data;
}

Map<String, dynamic> directionsJsonRoutesLegsStepsDurationToJson(DirectionsJsonRoutesLegsStepsDuration entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['text'] = entity.text;
	data['value'] = entity.value;
	return data;
}

directionsJsonRoutesLegsStepsEndLocationFromJson(DirectionsJsonRoutesLegsStepsEndLocation data, Map<String, dynamic> json) {
	if (json['lat'] != null) {
		data.lat = json['lat']?.toDouble();
	}
	if (json['lng'] != null) {
		data.lng = json['lng']?.toDouble();
	}
	return data;
}

Map<String, dynamic> directionsJsonRoutesLegsStepsEndLocationToJson(DirectionsJsonRoutesLegsStepsEndLocation entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['lat'] = entity.lat;
	data['lng'] = entity.lng;
	return data;
}

directionsJsonRoutesLegsStepsPolylineFromJson(DirectionsJsonRoutesLegsStepsPolyline data, Map<String, dynamic> json) {
	if (json['points'] != null) {
		data.points = json['points']?.toString();
	}
	return data;
}

Map<String, dynamic> directionsJsonRoutesLegsStepsPolylineToJson(DirectionsJsonRoutesLegsStepsPolyline entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['points'] = entity.points;
	return data;
}

directionsJsonRoutesLegsStepsStartLocationFromJson(DirectionsJsonRoutesLegsStepsStartLocation data, Map<String, dynamic> json) {
	if (json['lat'] != null) {
		data.lat = json['lat']?.toDouble();
	}
	if (json['lng'] != null) {
		data.lng = json['lng']?.toDouble();
	}
	return data;
}

Map<String, dynamic> directionsJsonRoutesLegsStepsStartLocationToJson(DirectionsJsonRoutesLegsStepsStartLocation entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['lat'] = entity.lat;
	data['lng'] = entity.lng;
	return data;
}

directionsJsonRoutesOverviewPolylineFromJson(DirectionsJsonRoutesOverviewPolyline data, Map<String, dynamic> json) {
	if (json['points'] != null) {
		data.points = json['points']?.toString();
	}
	return data;
}

Map<String, dynamic> directionsJsonRoutesOverviewPolylineToJson(DirectionsJsonRoutesOverviewPolyline entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['points'] = entity.points;
	return data;
}