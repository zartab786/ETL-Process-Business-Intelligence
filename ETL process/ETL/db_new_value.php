<?php
include "dbConnection.php";
$table = $_POST['table'];
$nid = $_POST['nid'];
$attr = $_POST['attr'];
$type = $_POST['type'];
$value= $_POST['new_value'];

if($type=="type_1")
{
$update = "UPDATE $table SET $attr = '$value' WHERE nid = '$nid' and Update_Flag='Y'";
if(mysqli_query($con,$update))
		{
			
			header("location:Confirmed.php");
			echo 'The Table has been updated';
		}
		else{
			echo "Error";
}
}
else if($type=="type_2")
{
	if($table=="event")
	{
		$old_sid=0;
		$new_sid=0;
		$query1 = "select event_sid from event WHERE nid = '$nid' and Update_Flag='Y'";
		$result1 = mysqli_query($con,$query1);
		if($result1)
		{
			while($row = mysqli_fetch_array($result1))
			{
				$old_sid=$row['event_sid'];
			}
			echo "$old_sid";
			$query2="insert into event (nid,Event_id,Event_name,Update_Flag)
			select nid,Event_id,Event_name,Update_Flag from event where event_sid = '$old_sid'";
			$result2 = mysqli_query($con,$query2);
			$query3="UPDATE event SET Update_Flag = 'N' WHERE event_sid = '$old_sid'";
			$result3 = mysqli_query($con,$query3);
			$query4 = "select event_sid from event WHERE nid = '$nid' and Update_Flag='Y'";
			$result4 = mysqli_query($con,$query4);
			if($result4)
			{
			while($row = mysqli_fetch_array($result4))
			{
				$new_sid=$row['event_sid'];
			}
			$query5="UPDATE event SET Update_Flag = 'N' WHERE event_sid = '$old_sid'";
			$result5 = mysqli_query($con,$query5);
			}
			$query6="UPDATE $table SET $attr = '$value' WHERE event_sid = '$new_sid'";
			$result6 = mysqli_query($con,$query6);
			
			$query7 = "select Fact_name from fact_dimension WHERE Dimension_name = '$table'";
			$result7 = mysqli_query($con,$query7);
			if($result7)
			{
			while($row = mysqli_fetch_array($result7))
			{
				$fact=$row['Fact_name'];
				echo $fact;
				$query8="UPDATE $fact SET event_sid = '$new_sid' WHERE event_sid = '$old_sid'";
				$result8 = mysqli_query($con,$query8);
			}
			}
			
			
			
		}
		else
	{
		echo "old id";
	}
	header("location:Confirmed.php");
		
	}
	
	//===================================================================================2nd table:===================================================================================
	
	else if($table=="event_theme")
	{
		$old_sid=0;
		$new_sid=0;
		$query1 = "select Sid from event_theme WHERE nid = '$nid' and Update_Flag='Y'";
		$result1 = mysqli_query($con,$query1);
		if($result1)
		{
			while($row = mysqli_fetch_array($result1))
			{
				$old_sid=$row['Sid'];
			}
			echo "$old_sid";
			$query2="insert into event_theme (nid,Title,invitation,Stage_design,Update_Flag)
			select nid,Title,invitation,Stage_design,Update_Flag from event_theme where Sid = '$old_sid'";
			$result2 = mysqli_query($con,$query2);
			$query3="UPDATE event_theme SET Update_Flag = 'N' WHERE Sid = '$old_sid'";
			$result3 = mysqli_query($con,$query3);
			$query4 = "select Sid from event_theme WHERE nid = '$nid' and Update_Flag='Y'";
			$result4 = mysqli_query($con,$query4);
			if($result4)
			{
			while($row = mysqli_fetch_array($result4))
			{
				$new_sid=$row['Sid'];
			}
			$query5="UPDATE event_theme SET Update_Flag = 'N' WHERE Sid = '$old_sid'";
			$result5 = mysqli_query($con,$query5);
			}
			$query6="UPDATE $table SET $attr = '$value' WHERE Sid = '$new_sid'";
			$result6 = mysqli_query($con,$query6);
			
			$query7 = "select Fact_name from fact_dimension WHERE Dimension_name = '$table'";
			$result7 = mysqli_query($con,$query7);
			if($result7)
			{
			while($row = mysqli_fetch_array($result7))
			{
				$fact=$row['Fact_name'];
				echo $fact;
				$query8="UPDATE $fact SET event_theme_sid = '$new_sid' WHERE event_theme_sid = '$old_sid'";
				$result8 = mysqli_query($con,$query8);
			}
			}
			
			
			
		}
		else
	{
		echo "old id";
	}
	header("location:Confirmed.php");
		
	}
	
	//==============================================3rd====================================================================
	
	else if($table=="price")
	{
		$old_sid=0;
		$new_sid=0;
		$query1 = "select Sid from price WHERE nid = '$nid' and Update_Flag='Y'";
		$result1 = mysqli_query($con,$query1);
		if($result1)
		{
			while($row = mysqli_fetch_array($result1))
			{
				$old_sid=$row['Sid'];
			}
			echo "$old_sid";
			$query2="insert into price (nid,cost_price,tax,Update_Flag)
			select nid,cost_price,tax,Update_Flag from price where Sid = '$old_sid'";
			$result2 = mysqli_query($con,$query2);
			$query3="UPDATE price SET Update_Flag = 'N' WHERE Sid = '$old_sid'";
			$result3 = mysqli_query($con,$query3);
			$query4 = "select Sid from price WHERE nid = '$nid' and Update_Flag='Y'";
			$result4 = mysqli_query($con,$query4);
			if($result4)
			{
			while($row = mysqli_fetch_array($result4))
			{
				$new_sid=$row['Sid'];
			}
			$query5="UPDATE price SET Update_Flag = 'N' WHERE Sid = '$old_sid'";
			$result5 = mysqli_query($con,$query5);
			}
			$query6="UPDATE $table SET $attr = '$value' WHERE Sid = '$new_sid'";
			$result6 = mysqli_query($con,$query6);
			
			$query7 = "select Fact_name from fact_dimension WHERE Dimension_name = '$table'";
			$result7 = mysqli_query($con,$query7);
			if($result7)
			{
			while($row = mysqli_fetch_array($result7))
			{
				$fact=$row['Fact_name'];
				echo $fact;
				$query8="UPDATE $fact SET price_sid = '$new_sid' WHERE price_sid = '$old_sid'";
				$result8 = mysqli_query($con,$query8);
			}
			}
			
			
			
		}
		else
	{
		echo "old id";
	}
	header("location:Confirmed.php");
		
	}
	//======================================================================4th=================================================================
	
	else if($table=="sponsor")
	{
		$old_sid=0;
		$new_sid=0;
		$query1 = "select Sid from sponsor WHERE nid = '$nid' and Update_Flag='Y'";
		$result1 = mysqli_query($con,$query1);
		if($result1)
		{
			while($row = mysqli_fetch_array($result1))
			{
				$old_sid=$row['Sid'];
			}
			echo "$old_sid";
			$query2="insert into sponsor (nid,sponsor_id,sponsor_name,contact_person,Update_Flag)
			select nid,sponsor_id,sponsor_name,contact_person,Update_Flag from sponsor where Sid = '$old_sid'";
			$result2 = mysqli_query($con,$query2);
			$query3="UPDATE sponsor SET Update_Flag = 'N' WHERE Sid = '$old_sid'";
			$result3 = mysqli_query($con,$query3);
			$query4 = "select Sid from sponsor WHERE nid = '$nid' and Update_Flag='Y'";
			$result4 = mysqli_query($con,$query4);
			if($result4)
			{
			while($row = mysqli_fetch_array($result4))
			{
				$new_sid=$row['Sid'];
			}
			$query5="UPDATE sponsor SET Update_Flag = 'N' WHERE Sid = '$old_sid'";
			$result5 = mysqli_query($con,$query5);
			}
			$query6="UPDATE $table SET $attr = '$value' WHERE Sid = '$new_sid'";
			$result6 = mysqli_query($con,$query6);
			
			$query7 = "select Fact_name from fact_dimension WHERE Dimension_name = '$table'";
			$result7 = mysqli_query($con,$query7);
			if($result7)
			{
			while($row = mysqli_fetch_array($result7))
			{
				$fact=$row['Fact_name'];
				echo $fact;
				$query8="UPDATE $fact SET sponsor_sid = '$new_sid' WHERE sponsor_sid = '$old_sid'";
				$result8 = mysqli_query($con,$query8);
			}
			}
			
			
			
		}
		else
	{
		echo "old id";
	}
	header("location:Confirmed.php");
		
	}
	
	//============================================================================5th=========================================================
	
	else if($table=="season")
	{
		$old_sid=0;
		$new_sid=0;
		$query1 = "select Sid from season WHERE nid = '$nid' and Update_Flag='Y'";
		$result1 = mysqli_query($con,$query1);
		if($result1)
		{
			while($row = mysqli_fetch_array($result1))
			{
				$old_sid=$row['Sid'];
			}
			echo "$old_sid";
			$query2="insert into season (nid,Season_name,season_duration,Update_Flag)
			select nid,Season_name,season_duration,Update_Flag from season where Sid = '$old_sid'";
			$result2 = mysqli_query($con,$query2);
			$query3="UPDATE season SET Update_Flag = 'N' WHERE Sid = '$old_sid'";
			$result3 = mysqli_query($con,$query3);
			$query4 = "select Sid from season WHERE nid = '$nid' and Update_Flag='Y'";
			$result4 = mysqli_query($con,$query4);
			if($result4)
			{
			while($row = mysqli_fetch_array($result4))
			{
				$new_sid=$row['Sid'];
			}
			$query5="UPDATE season SET Update_Flag = 'N' WHERE Sid = '$old_sid'";
			$result5 = mysqli_query($con,$query5);
			}
			$query6="UPDATE $table SET $attr = '$value' WHERE Sid = '$new_sid'";
			$result6 = mysqli_query($con,$query6);
			
			$query7 = "select Fact_name from fact_dimension WHERE Dimension_name = '$table'";
			$result7 = mysqli_query($con,$query7);
			if($result7)
			{
			while($row = mysqli_fetch_array($result7))
			{
				$fact=$row['Fact_name'];
				echo $fact;
				$query8="UPDATE $fact SET season_sid = '$new_sid' WHERE season_sid = '$old_sid'";
				$result8 = mysqli_query($con,$query8);
			}
			}
			
			
			
		}
		else
	{
		echo "old id";
	}
	header("location:Confirmed.php");
		
	}
	//========================================================================6th=====================================================================
	
	else if($table=="venue")
	{
		$old_sid=0;
		$new_sid=0;
		$query1 = "select Sid from event_theme WHERE nid = '$nid' and Update_Flag='Y'";
		$result1 = mysqli_query($con,$query1);
		if($result1)
		{
			while($row = mysqli_fetch_array($result1))
			{
				$old_sid=$row['Sid'];
			}
			echo "$old_sid";
			$query2="insert into venue (nid,Name,Location,Capacity,Update_Flag)
			select nid,Name,Location,Capacity,Update_Flag from venue where Sid = '$old_sid'";
			$result2 = mysqli_query($con,$query2);
			$query3="UPDATE venue SET Update_Flag = 'N' WHERE Sid = '$old_sid'";
			$result3 = mysqli_query($con,$query3);
			$query4 = "select Sid from venue WHERE nid = '$nid' and Update_Flag='Y'";
			$result4 = mysqli_query($con,$query4);
			if($result4)
			{
			while($row = mysqli_fetch_array($result4))
			{
				$new_sid=$row['Sid'];
			}
			$query5="UPDATE venue SET Update_Flag = 'N' WHERE Sid = '$old_sid'";
			$result5 = mysqli_query($con,$query5);
			}
			$query6="UPDATE $table SET $attr = '$value' WHERE Sid = '$new_sid'";
			$result6 = mysqli_query($con,$query6);
			
			$query7 = "select Fact_name from fact_dimension WHERE Dimension_name = '$table'";
			$result7 = mysqli_query($con,$query7);
			if($result7)
			{
			while($row = mysqli_fetch_array($result7))
			{
				$fact=$row['Fact_name'];
				echo $fact;
				$query8="UPDATE $fact SET venue_sid = '$new_sid' WHERE venue_sid = '$old_sid'";
				$result8 = mysqli_query($con,$query8);
			}
			}
			
			
			
		}
		else
	{
		echo "old id";
	}
	header("location:Confirmed.php");
		
	}
	//==========================================================================================7th==========================================================================
	
	else if($table=="oldvenue")
	{
		$old_sid=0;
		$new_sid=0;
		$query1 = "select Sid from oldvenue WHERE nid = '$nid' and Update_Flag='Y'";
		$result1 = mysqli_query($con,$query1);
		if($result1)
		{
			while($row = mysqli_fetch_array($result1))
			{
				$old_sid=$row['Sid'];
			}
			echo "$old_sid";
			$query2="insert into oldvenue (nid,Name,Location,Capacity,Update_Flag)
			select nid,Name,Location,Capacity,Update_Flag from oldvenue where Sid = '$old_sid'";
			$result2 = mysqli_query($con,$query2);
			$query3="UPDATE oldvenue SET Update_Flag = 'N' WHERE Sid = '$old_sid'";
			$result3 = mysqli_query($con,$query3);
			$query4 = "select Sid from oldvenue WHERE nid = '$nid' and Update_Flag='Y'";
			$result4 = mysqli_query($con,$query4);
			if($result4)
			{
			while($row = mysqli_fetch_array($result4))
			{
				$new_sid=$row['Sid'];
			}
			$query5="UPDATE oldvenue SET Update_Flag = 'N' WHERE Sid = '$old_sid'";
			$result5 = mysqli_query($con,$query5);
			}
			$query6="UPDATE $table SET $attr = '$value' WHERE Sid = '$new_sid'";
			$result6 = mysqli_query($con,$query6);
			
			$query7 = "select Fact_name from fact_dimension WHERE Dimension_name = '$table'";
			$result7 = mysqli_query($con,$query7);
			if($result7)
			{
			while($row = mysqli_fetch_array($result7))
			{
				$fact=$row['Fact_name'];
				echo $fact;
				$query8="UPDATE $fact SET oldvenue_sid = '$new_sid' WHERE oldvenue_sid = '$old_sid'";
				$result8 = mysqli_query($con,$query8);
			}
			}
			
			
			
		}
		else
	{
		echo "old id";
	}
	header("location:Confirmed.php");
		
	}
	
}

?>