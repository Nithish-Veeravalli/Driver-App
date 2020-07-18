import 'package:priority_pulse/generated/json/base/json_convert_content.dart';
import 'package:priority_pulse/generated/json/base/json_filed.dart';

class DirectionsJsonEntity with JsonConvert<DirectionsJsonEntity> {
	@JSONField(name: "geocoded_waypoints")
	List<DirectionsJsonGeocodedWaypoint> geocodedWaypoints;
	List<DirectionsJsonRoute> routes;
	String status;
}

class DirectionsJsonGeocodedWaypoint with JsonConvert<DirectionsJsonGeocodedWaypoint> {
	@JSONField(name: "geocoder_status")
	String geocoderStatus;
	@JSONField(name: "place_id")
	String placeId;
	List<String> types;
}

class DirectionsJsonRoute with JsonConvert<DirectionsJsonRoute> {
	DirectionsJsonRoutesBounds bounds;
	String copyrights;
	List<DirectionsJsonRoutesLeg> legs;
	@JSONField(name: "overview_polyline")
	DirectionsJsonRoutesOverviewPolyline overviewPolyline;
	String summary;
	List<dynamic> warnings;
	@JSONField(name: "waypoint_order")
	List<dynamic> waypointOrder;
}

class DirectionsJsonRoutesBounds with JsonConvert<DirectionsJsonRoutesBounds> {
	DirectionsJsonRoutesBoundsNortheast northeast;
	DirectionsJsonRoutesBoundsSouthwest southwest;
}

class DirectionsJsonRoutesBoundsNortheast with JsonConvert<DirectionsJsonRoutesBoundsNortheast> {
	double lat;
	double lng;
}

class DirectionsJsonRoutesBoundsSouthwest with JsonConvert<DirectionsJsonRoutesBoundsSouthwest> {
	double lat;
	double lng;
}

class DirectionsJsonRoutesLeg with JsonConvert<DirectionsJsonRoutesLeg> {
	DirectionsJsonRoutesLegsDistance distance;
	DirectionsJsonRoutesLegsDuration duration;
	@JSONField(name: "end_address")
	String endAddress;
	@JSONField(name: "end_location")
	DirectionsJsonRoutesLegsEndLocation endLocation;
	@JSONField(name: "start_address")
	String startAddress;
	@JSONField(name: "start_location")
	DirectionsJsonRoutesLegsStartLocation startLocation;
	List<DirectionsJsonRoutesLegsStep> steps;
	@JSONField(name: "traffic_speed_entry")
	List<dynamic> trafficSpeedEntry;
	@JSONField(name: "via_waypoint")
	List<dynamic> viaWaypoint;
}

class DirectionsJsonRoutesLegsDistance with JsonConvert<DirectionsJsonRoutesLegsDistance> {
	String text;
	int value;
}

class DirectionsJsonRoutesLegsDuration with JsonConvert<DirectionsJsonRoutesLegsDuration> {
	String text;
	int value;
}

class DirectionsJsonRoutesLegsEndLocation with JsonConvert<DirectionsJsonRoutesLegsEndLocation> {
	double lat;
	double lng;
}

class DirectionsJsonRoutesLegsStartLocation with JsonConvert<DirectionsJsonRoutesLegsStartLocation> {
	double lat;
	double lng;
}

class DirectionsJsonRoutesLegsStep with JsonConvert<DirectionsJsonRoutesLegsStep> {
	DirectionsJsonRoutesLegsStepsDistance distance;
	DirectionsJsonRoutesLegsStepsDuration duration;
	@JSONField(name: "end_location")
	DirectionsJsonRoutesLegsStepsEndLocation endLocation;
	@JSONField(name: "html_instructions")
	String htmlInstructions;
	DirectionsJsonRoutesLegsStepsPolyline polyline;
	@JSONField(name: "start_location")
	DirectionsJsonRoutesLegsStepsStartLocation startLocation;
	@JSONField(name: "travel_mode")
	String travelMode;
	String maneuver;
}

class DirectionsJsonRoutesLegsStepsDistance with JsonConvert<DirectionsJsonRoutesLegsStepsDistance> {
	String text;
	int value;
}

class DirectionsJsonRoutesLegsStepsDuration with JsonConvert<DirectionsJsonRoutesLegsStepsDuration> {
	String text;
	int value;
}

class DirectionsJsonRoutesLegsStepsEndLocation with JsonConvert<DirectionsJsonRoutesLegsStepsEndLocation> {
	double lat;
	double lng;
}

class DirectionsJsonRoutesLegsStepsPolyline with JsonConvert<DirectionsJsonRoutesLegsStepsPolyline> {
	String points;
}

class DirectionsJsonRoutesLegsStepsStartLocation with JsonConvert<DirectionsJsonRoutesLegsStepsStartLocation> {
	double lat;
	double lng;
}

class DirectionsJsonRoutesOverviewPolyline with JsonConvert<DirectionsJsonRoutesOverviewPolyline> {
	String points;
}
