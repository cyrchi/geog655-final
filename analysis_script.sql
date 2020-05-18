


-- analysis

-- At what time of day is there the most/least frequent bus service?
-- number of bus trips per arrival time, in descending order
SELECT stop_times.arrival_time, count(stop_times.trip_id) FROM stop_times
INNER JOIN trips ON stop_times.trip_id = trips.trip_id
INNER JOIN routes ON trips.route_id = routes.route_id
WHERE routes.route_type = 3
GROUP BY arrival_time
ORDER BY count(stop_times.trip_id) DESC
LIMIT 10;



-- top 8 arrival times are between 7am and 8:15am

-- number of bus trips per arrival time, in ascending order
SELECT stop_times.arrival_time, count(stop_times.trip_id) FROM stop_times
INNER JOIN trips ON stop_times.trip_id = trips.trip_id
INNER JOIN routes ON trips.route_id = routes.route_id
WHERE routes.route_type = 3
GROUP BY arrival_time
ORDER BY count(stop_times.trip_id) ASC
LIMIT 10;
-- top 8 arrival times are after 3am

--What are the top 5 most/least frequent bus stops at that time of day?
-- most frequent bus stops at the highest frequency time of the day
SELECT stops.stop_id, stops.stop_name, count(stop_times.arrival_time) as buses_arriving FROM stops
INNER JOIN stop_times ON stops.stop_id=stop_times.stop_id
INNER JOIN trips ON stop_times.trip_id = trips.trip_id
INNER JOIN routes ON trips.route_id = routes.route_id
WHERE routes.route_type = 3 AND (stop_times.arrival_time BETWEEN '07:00:00' AND '08:15:00')
GROUP BY stops.stop_id
ORDER BY count(stop_times.arrival_time) DESC
LIMIT 10;

-- least frequent bus stops at the highest frequency time of the day
SELECT stops.stop_id, stops.stop_name, count(stop_times.arrival_time) as buses_arriving FROM stops
INNER JOIN stop_times ON stops.stop_id=stop_times.stop_id
INNER JOIN trips ON stop_times.trip_id = trips.trip_id
INNER JOIN routes ON trips.route_id = routes.route_id
WHERE routes.route_type = 3 AND (stop_times.arrival_time BETWEEN '07:00:00' AND '08:15:00')
GROUP BY stops.stop_id
ORDER BY count(stop_times.arrival_time) ASC
LIMIT 10;

-- most frequent bus stops at the lowest frequency time of the day
SELECT stops.stop_id, stops.stop_name, count(stop_times.arrival_time) as buses_arriving FROM stops
INNER JOIN stop_times ON stops.stop_id=stop_times.stop_id
INNER JOIN trips ON stop_times.trip_id = trips.trip_id
INNER JOIN routes ON trips.route_id = routes.route_id
WHERE routes.route_type = 3 AND (stop_times.arrival_time > '27:00:00') -- after 3am of the same service day
GROUP BY stops.stop_id
ORDER BY count(stop_times.arrival_time) DESC
LIMIT 10;

-- least frequent bus stops at the lowest frequency time of the day
SELECT stops.stop_id, stops.stop_name, count(stop_times.arrival_time) as buses_arriving FROM stops
INNER JOIN stop_times ON stops.stop_id=stop_times.stop_id
INNER JOIN trips ON stop_times.trip_id = trips.trip_id
INNER JOIN routes ON trips.route_id = routes.route_id
WHERE routes.route_type = 3 AND (stop_times.arrival_time > '27:00:00') -- after 3am of the same service day
GROUP BY stops.stop_id
ORDER BY count(stop_times.arrival_time) ASC
LIMIT 10;

-- What jurisdictions do these bus lines serve?
-- unable to query for all three jurisdiction tables simultaneously, and MD doesn't work at all. I tried to union them and
-- that was taking forever.

-- jurisdication of the most frequent bus stops at the most frequent time of the day
SELECT stops.stop_id, stops.stop_name, dc_wards.name FROM stops, dc_wards
WHERE 
(stops.stop_id = '781' OR
stops.stop_id = '26703' OR
stops.stop_id = '5501' OR
stops.stop_id = '7921' OR
stops.stop_id = '7729' OR
stops.stop_id = '26407' OR
stops.stop_id = '4538' OR
stops.stop_id = '26428' OR
stops.stop_id = '26723' OR
stops.stop_id = '7908'
)
AND
ST_Intersects(dc_wards.geom, stops.stop_geom)
ORDER BY dc_wards.name asc
;

-- jurisdiction of the least frequent bus stops at the most frequent time of the day
SELECT stops.stop_id, stops.stop_name, va_counties.name  FROM stops, va_counties
WHERE 
(stops.stop_id = '13568' OR
stops.stop_id = '16090' OR
stops.stop_id = '29868' OR
stops.stop_id = '8489' OR
stops.stop_id = '27934' OR
stops.stop_id = '10273' OR
stops.stop_id = '27910' OR
stops.stop_id = '40127' OR
stops.stop_id = '11343' OR
stops.stop_id = '27888'
)
AND
ST_Intersects(va_counties.geom, stops.stop_geom);

-- jurisdication of the most frequent bus stops at the least frequent time of the day
SELECT stops.stop_id, stops.stop_name, dc_wards.name FROM stops, dc_wards
WHERE 
(stops.stop_id = '781' OR
stops.stop_id = '27643' OR
stops.stop_id = '26698' OR
stops.stop_id = '7729' OR
stops.stop_id = '26720' OR
stops.stop_id = '26704' OR
stops.stop_id = '26733' OR
stops.stop_id = '26786' OR
stops.stop_id = '26756' OR
stops.stop_id = '4998'
)
AND
ST_Intersects(dc_wards.geom, stops.stop_geom)
ORDER BY dc_wards.name asc
;

-- jurisdiction of the least frequent bus stops at the least frequent time of the day

SELECT stops.stop_id, stops.stop_name, dc_wards.name FROM stops, dc_wards
WHERE 
(stops.stop_id = '5564' OR
stops.stop_id = '28280' OR
stops.stop_id = '28234' OR
stops.stop_id = '9165' OR
stops.stop_id = '28256' OR
stops.stop_id = '2703' OR
stops.stop_id = '4110' OR
stops.stop_id = '4488' OR
stops.stop_id = '29714' OR
stops.stop_id = '28250'
)
AND
ST_Intersects(dc_wards.geom, stops.stop_geom)
ORDER BY dc_wards.name asc
;


