<?php
include "dbConnection.php";
$dimension = $_POST['dimension'];
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
<h2 style="font-family:Garamond, serif;text-align: center;font-size: 2em;font-style: italic;">Choosing The Attribute from Dimension</h2>

<form method="post" enctype="multipart/form-data" action="db_new_value.php">
  <div class="textstyle1">
<select name="nid" style="background-color:#212121;color: #fff;  "> 
 <option value="" disabled selected hidden>Select Dimension Entry id to be updated</option>
<?php
$query="SELECT nid from $dimension";
$result=mysqli_query($con,$query);
if($result)
{
while($row=mysqli_fetch_array($result))
{
$fname=$row['nid'];
echo "<option>".$fname."<br></option>";
}
}
?>  
</p></select></div>
<div class="textstyle1">
<select name="attr" style="background-color:#212121;color: #fff;  "> 
 <option value="" disabled selected hidden>Select Attribute to be updated  </option>
<?php
$sql = "SHOW COLUMNS FROM $dimension";
$result1 = mysqli_query($con,$sql);
if($result1)
{
while($row = mysqli_fetch_array($result1))
{

$fname=$row['Field'];
if($fname!='Update_Flag')
{
echo "<option>".$fname."<br></option>";
}
}
}

?>  
</p></select></div>
<div class="textstyle1">
<select name="type" style="background-color:#212121;color: #fff;  "> 
 <option value="" disabled selected hidden>Select Change Type </option>
 <option value="type_1">Type 1</option>
 <option value="type_2">Type 2</option>
    
</p></select>
<br>
<br>
<label for="fname">Enter Updated Value: </label>
<br>
<br>
  <input type="text" id="new_value" name="new_value" >
  <br>
  <br>

<input name ="table" value=<?php echo $dimension?> type="hidden"/>

<input type="submit" value="Submit">
</div>
</form>
</br>
</br>
</body>
</html>
