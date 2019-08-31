
<?php
session_start();
error_reporting(0);
include('includes/config.php');
if(strlen($_SESSION['alogin'])==0)
    {   
header('location:index.php');
}
else{ 

if(isset($_POST['issue']))
{
$userid=strtoupper($_POST['userid']);
$fileid=$_POST['filedetails'];
$sql="INSERT INTO tblissuedfilesdetails(UserID,FileId) VALUES(:userid,:fileid)";
$query = $dbh->prepare($sql);
$query->bindParam(':userid',$userid,PDO::PARAM_STR);
$query->bindParam(':fileid',$fileid,PDO::PARAM_STR);
$query->execute();
$lastInsertId = $dbh->lastInsertId();
if($lastInsertId)
{
$_SESSION['msg']="file issued successfully";
header('location:manage-issued-files.php');
}
else 
{
$_SESSION['error']="Something went wrong. Please try again";
header('location:manage-issued-files.php');
}

}
?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>File Retrival Management System  | Issue a new file</title>
    <!-- BOOTSTRAP CORE STYLE  -->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONT AWESOME STYLE  -->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLE  -->
    <link href="assets/css/style.css" rel="stylesheet" />
    <!-- GOOGLE FONT -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
<script>
// function for get user name
function getuser() {
$("#loaderIcon").show();
jQuery.ajax({
url: "get_user.php",
data:'userid='+$("#userid").val(),
type: "POST",
success:function(data){
$("#get_user_name").html(data);
$("#loaderIcon").hide();
},
error:function (){}
});
}

//function for file details
function getfile() {
$("#loaderIcon").show();
jQuery.ajax({
url: "get_file.php",
data:'fileid='+$("#fileid").val(),
type: "POST",
success:function(data){
$("#get_file_name").html(data);
$("#loaderIcon").hide();
},
error:function (){}
});
}

</script> 
<style type="text/css">
  .others{
    color:red;
}

</style>


</head>
<body>
      <!------MENU SECTION START-->
<?php include('includes/header.php');?>
<!-- MENU SECTION END-->
    <div class="content-wra
    <div class="content-wrapper">
         <div class="container">
        <div class="row pad-botm">
            <div class="col-md-12">
                <h4 class="header-line">Issue a New file</h4>
                
                            </div>

</div>
<div class="row">
<div class="col-md-10 col-sm-6 col-xs-12 col-md-offset-1"">
<div class="panel panel-info">
<div class="panel-heading">
Issue a New file
</div>
<div class="panel-body">
<form role="form" method="post">

<div class="form-group">
<label>User Id<span style="color:red;">*</span></label>
<input class="form-control" type="text" name="userid" id="userid" onBlur="getuser()" autocomplete="off"  required />
</div>

<div class="form-group">
<span id="get_user_name" style="font-size:16px;"></span> 
</div>



<div class="form-group">
<label>ISSN Number or file Title<span style="color:red;">*</span></label>
<input class="form-control" type="text" name="booikid" id="fileid" onBlur="getfile()"  required="required" />
</div>

 <div class="form-group">

  <select  class="form-control" name="filedetails" id="get_file_name" readonly>
   
 </select>
 </div>
<button type="submit" name="issue" id="submit" class="btn btn-info">Issue file </button>

                                    </form>
                            </div>
                        </div>
                            </div>

        </div>
   
    </div>
    </div>
     <!-- CONTENT-WRAPPER SECTION END-->
  <?php include('includes/footer.php');?>
      <!-- FOOTER SECTION END-->
    <!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
    <!-- CORE JQUERY  -->
    <script src="assets/js/jquery-1.10.2.js"></script>
    <!-- BOOTSTRAP SCRIPTS  -->
    <script src="assets/js/bootstrap.js"></script>
      <!-- CUSTOM SCRIPTS  -->
    <script src="assets/js/custom.js"></script>

</body>
</html>
<?php } ?>
