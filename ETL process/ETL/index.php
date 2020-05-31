<?php
include "dbConnection.php";
?>
<!DOCTYPE html>
<html>
<head>
	<style>
  .textstyle {

  font-size: 3em;
  text-align: center;
  color: #fff;
  font-weight: 100;
 
  letter-spacing: 3px;
  font-family: "Garamond", serif;
}
.textstyle1 {

  font-size: 1.5em;
  text-align: center;
  color: #fff;
  font-weight: 100;
  letter-spacing: 1px;
  font-family: "Garamond", serif;
  
}
  body{
 background: #606060;

  }
  input[type=submit]{
  background-color: #212121;
  border: 2px solid white;
  border-radius: 8px;
  color: white;
  padding: 16px 32px;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;

}
.card {
  box-shadow: 32px 32px 32px 4px rgba(0, 0, 0, 2);
  max-width: 700px;
  margin: auto;
  text-align: left;
  font-family: "Georgia", serif;;
 border: 6px solid black;
  border-radius: 16px;
}

.title {
  color: grey;
  font-size: 18px;
}

</style>
</head>
<body>
<br>
	<br>
	<div class="card" style="background:#484848;">
		<h2 class="textstyle" style="text-align:center;font-style: italic;">ETL Process for Group_No.-8</h2>
<h2 style="font-family:Garamond, serif;text-align: center;font-size: 2em;font-style: italic;">Choosing The Dimension</h2>

<form method="post" enctype="multipart/form-data" action="db_dimension.php">
  <div class="textstyle1">
  <label for="cars">Choose Dimention To Update:</label>
  <select name="dimension" style="background-color:#212121;color: #fff;  ">
    
    <option value="event">Event</option>
    <option value="event_theme">Event Theme</option>
    <option value="price">Price</option>
    <option value="sponsor">Sponsor</option>
	<option value="season">Season</option>
	<option value="venue">Venue</option>
	<option value="oldvenue">Old Venue</option>

  </select>
  <br>
  <br>
  <br>
  <input type="submit" value="Submit">
  </div>
</form>

</br>
</br>
</body>
</html>
