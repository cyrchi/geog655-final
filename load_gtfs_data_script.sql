-- load data script
-- complete
COPY calendar_dates(service_id,date,exception_type)
	FROM 'C:\Users\Public\gtfs\calendar_dates.txt' DELIMITER ',' CSV HEADER;
-- complete
COPY stop_times(trip_id,arrival_time,departure_time,stop_id,stop_sequence,
	pickup_type,drop_off_type,shape_dist_traveled) FROM 'C:\Users\Public\gtfs\stop_times.txt' DELIMITER ','
	CSV HEADER;
-- complete
COPY trips(route_id,service_id,trip_id,trip_headsign,direction_id,block_id,shape_id, scheduled_trip_id)
	FROM 'C:\Users\Public\gtfs\trips.txt' DELIMITER ',' CSV HEADER;
-- complete
COPY agency(agency_id,agency_name,agency_url,agency_timezone,agency_lang,agency_phone)
	FROM 'C:\Users\Public\gtfs\agency.txt' DELIMITER ',' CSV HEADER;
-- complete
COPY routes(route_id, agency_id,route_short_name,route_long_name,route_type,route_url,route_color) 
    FROM 'C:\Users\Public\gtfs\routes.txt' DELIMITER ','
	CSV HEADER;
-- complete
COPY shapes(shape_id,shape_pt_lat,shape_pt_lon,shape_pt_sequence,shape_dist_traveled)
	FROM 'C:\Users\Public\gtfs\shapes.txt' DELIMITER ',' CSV HEADER;
-- complete
COPY stops(stop_id,stop_code,stop_name,stop_desc,stop_lat,stop_lon,zone_id) 
    FROM 'C:\Users\Public\gtfs\stops.txt' DELIMITER ','
	CSV HEADER;