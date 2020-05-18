<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">

    <title>GEOG655 Final Project</title>
    <link rel="stylesheet" type="text/css" href="client.css">

</head>

<body>

    <h1>GEOG655 Final Project</h1>
    <p>
        This website lets you query Generalized Transit Feed Specification (GTFS) data
        from the Washington Metropolitan Area Transit Authority (WMATA). The data are from March 
        1, 2020 and contained in a PostGIS-enabled PostgreSQL database.
    </p>

    <p>
        In order to query the data, you must use proper SQL syntax. When you you are 
        querying for string elements, use single quotation marks around the string.
    </p>

    <form action="client.php" method="get">
        <label for="sql_query">Type your query:  </label>
        <input type="text" id="query" name="sql_query" placeholder="SELECT * FROM agency">
        <input type="submit" id="submit" value="Submit Query">
    </form>

    <h2>Query Results: </h2>

    <div id="results">
    <?php
    // make a connection to the postGIS database
    $conn=pg_pconnect("host=localhost port=5432 dbname=geog655_final user=postgres password=62ccQ89SUnGY");
    if(!$conn) {
        echo "An error occurred.\n";
        exit;
    }

    // Query #1
    // get the sql statement from the form input
    if(isset($_GET["sql_query"])) {

        $sql_query = $_GET["sql_query"];

    } else {
        $sql_query = "select * from agency";
    }

    // query the database
    $result = pg_query($conn, $sql_query);

    if(!$result) {
        echo "An error occurred.\n";
        exit;
    }
    // display query result
    while($row = pg_fetch_row($result)) {
        
        $string_row = implode(", ", $row); // turn the elements in the array into a comma-separated list
        echo "$string_row<br />\n";
    }

    ?>
    <div>

</body>

</html>