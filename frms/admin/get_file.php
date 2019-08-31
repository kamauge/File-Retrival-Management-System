<?php 
require_once("includes/config.php");
if(!empty($_POST["fileid"])) {
  $fileid=$_POST["fileid"];
 
    $sql ="SELECT FileName,id FROM tblfiles WHERE (ISBNNumber=:fileid)";
$query= $dbh -> prepare($sql);
$query-> bindParam(':fileid', $fileid, PDO::PARAM_STR);
$query-> execute();
$results = $query -> fetchAll(PDO::FETCH_OBJ);
$cnt=1;
if($query -> rowCount() > 0)
{
  foreach ($results as $result) {?>
<option value="<?php echo htmlentities($result->id);?>"><?php echo htmlentities($result->FileName);?></option>
<b>File Name :</b> 
<?php  
echo htmlentities($result->FileName);
 echo "<script>$('#submit').prop('disabled',false);</script>";
}
}
 else{?>
  
<option class="others"> Invalid ISSN Number</option>
<?php
 echo "<script>$('#submit').prop('disabled',true);</script>";
}
}



?>
