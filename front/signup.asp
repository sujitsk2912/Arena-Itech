
<!--#include file = "ff1.asp" -->
<%

    Set RS1 = Server.CreateObject("ADODB.Recordset")

if len(request.querystring("txtspcode")) > 0 then   
QU1 = "SELECT a.username , a.memb_name from entry a where  a.memb_code='" & request.querystring("txtspcode") & "'"
'response.write qu1 &"<br>"
RS1.OPEN QU1, GCONN
    IF RS1.EOF AND RS1.BOF THEN
ELSE
sponsor = RS1("username")
memb_name = RS1("memb_name")
    END IF
RS1.CLOSE


else
    
QU1 = "SELECT a.username , a.memb_name from entry a where  a.username='" & request.querystring("code") & "'"
'response.write qu1 &"<br>"
RS1.OPEN QU1, GCONN
    IF RS1.EOF AND RS1.BOF THEN
ELSE
sponsor = RS1("username")
memb_name = RS1("memb_name")
    END IF
RS1.CLOSE

rselect = ""
lselect = ""

end if

if request.querystring("place") = "L"  then
lselect = "selected"
    end if
    if request.querystring("place") = "R" then
rselect = "selected"
    end if
    
    
%>



<script>
function getXMLHTTP() { //fuction to return the xml http object
    var xmlhttp=false;  
    try{
      xmlhttp=new XMLHttpRequest();
    }
    catch(e)  {   
      try{      
        xmlhttp= new ActiveXObject("Microsoft.XMLHTTP");
      }
      catch(e){
        try{
        xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
        }
        catch(e1){
          xmlhttp=false;
        }
      }
    }
      
    return xmlhttp;
  }

function check_nobile_no(number){
    var x = number.length
    
 if ( x > 10){
        var y = x - 10
    document.getElementById("Mobile_No").value = number.substr(0, number.length - 1);
 }
}

function no_sponser(){
    var x = document.getElementById("nosponser").checked  
    //console.log(x);
     if ( x == true){
        document.getElementById("txtSpID").value = "Rising";
     }
     else{
        document.getElementById("txtSpID").value = "";
     }
}

function check_pwd(){
    var x = document.getElementById("password").value;
    var y = document.getElementById("cfpassword").value;
    console.log(x);
    console.log(y);
 if ( x == y){
            document.getElementById("passwordmsg").innerHTML = "";
 }else{
            document.getElementById("passwordmsg").innerHTML = "Confirm Password Not Matched";
            
        }
}

function check_pan_no(){
    var x = document.getElementById("pan_no").value;
    var y = /^([a-zA-Z]){5}([0-9]){4}([a-zA-Z]){1}?$/;
    console.log(x);
    console.log(y);
 if ( y.test(x)){
            document.getElementById("pan_nomsg").innerHTML = "";
 }else{
            document.getElementById("pan_nomsg").innerHTML = "Invalid Pan Number";
            
        }
}

    function check_sponsor_id(strURL){
      var req = getXMLHTTP();
    //console.log("1");
      if (req)
      {
        req.onreadystatechange = function() 
        {
          if (req.readyState == 4) 
          {
            if (req.status == 200 ) 
            {           
              flag = 0;
              if ( req.responseText == "")
              {
                document.getElementById("sponsor-error").value  = 'Enter Sponsor ID Not Correct';
                document.getElementById("txtSpID").className = "form-control invalid alert alert-danger rounded-pill p-2";
              }
              else 
              {
                document.getElementById("sponsor-error").value  = req.responseText;
                document.getElementById("txtSpID").className = "form-control alert alert-info rounded-pill p-2";
              }
              //$("#ststus_error").hide();
              //$("#ststus_ok").show();
              // document.getElementById("sp_name").innerHTML=req.responseText; 
              console.log(req.responseText)
            }
            else 
            {
              flag = 1;
              //document.getElementById("ststus_error").style.display = 'block';
              document.getElementById("ststus_ok").style.display = 'none';
              //alert("There was a problem while using XMLHTTP:\n" + req.statusText);
              //console.log(req.responseText);
            }
          }       
        } 
        var dD = new Date();

        var curr_hour = dD.getHours();
        var curr_min = dD.getMinutes();
        var x = document.getElementById("txtSpID").value;
            
        req.open("GET", strURL+'?txtspon_code='+ x + '&time='+curr_min, true);
        req.send(null);
      }

    }

    function check_btc_address(btc_address) {
      var regexp = new RegExp('^[13][a-km-zA-HJ-NP-Z1-9]{25,34}$');
      if (regexp.test(btc_address)) {
        flag = 0;
        $("#BTC").addClass("valid");
        $("#BTC").removeClass("invalid");
        $("#ststus_error4").hide();
        $("#ststus_ok4").show();
      } else {
        flag = 1;
        $("#BTC").addClass("invalid");
        $("#BTC").removeClass("valid");
        $("#ststus_error4").show();
        $("#ststus_ok4").hide();
      }
    }

    function check_user_id(strURL){
      var req = getXMLHTTP();
    //console.log("1");
      if (req)
      {
        req.onreadystatechange = function() 
        {
          if (req.readyState == 4) 
          {
            if (req.status == 200 ) 
            {           
              flag = 0;
              //console.log(req.responseText);
              
              if ( req.responseText == "" && x.length > 4)
              {
                document.getElementById("username-error").innerHTML  = "";
                document.getElementById("username").className = "form-control invalid alert alert-info";
              }
              else 
              {
                document.getElementById("username-error").innerHTML  = 'Enter User ID Already Available in System';
                document.getElementById("username").className = "form-control alert alert-danger";
              }
              //$("#ststus_error").hide();
              //$("#ststus_ok").show();
              // document.getElementById("sp_name").innerHTML=req.responseText; 
              console.log(req.responseText)
            }
            else 
            {
              flag = 1;
              //document.getElementById("ststus_error").style.display = 'block';
              document.getElementById("ststus_ok").style.display = 'none';
              //alert("There was a problem while using XMLHTTP:\n" + req.statusText);
              //console.log(req.responseText);
            }
          }       
        } 
        var dD = new Date();

        var curr_hour = dD.getHours();
        var curr_min = dD.getMinutes();
        var x = document.getElementById("username").value;
            
        req.open("GET", strURL+'?txtspon_code='+ x + '&time='+curr_min, true);
        req.send(null);
      }

    }

    function check_pin(strURL){
      var req = getXMLHTTP();
    console.log("1");
      if (req)
      {
        req.onreadystatechange = function() 
        {
          if (req.readyState == 4) 
          {
            if (req.status == 200 ) 
            {           
              flag = 0;
              console.log(req.responseText);
              
              if ( req.responseText == "" )
              {
                document.getElementById("Pin-error").innerHTML  = 'Enter Invalid Pin ';
                document.getElementById("Pin").className = "form-control invalid alert alert-danger";
              }
              else 
              {
                document.getElementById("Pin-error").innerHTML  = "";
                document.getElementById("PIN_ID").value  = req.responseText;
                document.getElementById("Pin").className = "form-control alert alert-info";
              }
              //$("#ststus_error").hide();
              //$("#ststus_ok").show();
              // document.getElementById("sp_name").innerHTML=req.responseText; 
              console.log(req.responseText)
            }
            else 
            {
              flag = 1;
              //document.getElementById("ststus_error").style.display = 'block';
              document.getElementById("ststus_ok").style.display = 'none';
              //alert("There was a problem while using XMLHTTP:\n" + req.statusText);
              //console.log(req.responseText);
            }
          }       
        } 
        var dD = new Date();

        var curr_hour = dD.getHours();
        var curr_min = dD.getMinutes();
        var x = document.getElementById("Pin").value;
            
        req.open("GET", strURL+'?txtspon_code='+ x + '&time='+curr_min, true);
        req.send(null);
      }

    }

    function check_btc_address(btc_address) {
      var regexp = new RegExp('^[13][a-km-zA-HJ-NP-Z1-9]{25,34}$');
      if (regexp.test(btc_address)) {
        flag = 0;
        $("#BTC").addClass("valid");
        $("#BTC").removeClass("invalid");
        $("#ststus_error4").hide();
        $("#ststus_ok4").show();
      } else {
        flag = 1;
        $("#BTC").addClass("invalid");
        $("#BTC").removeClass("valid");
        $("#ststus_error4").show();
        $("#ststus_ok4").hide();
      }
    }
</script>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blossamstar</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/login.css">
</head>
    <script src="https://unpkg.com/feather-icons"></script>
    
<body class="body" style="background: url(images/game-05-400x400.jpg); background-size: cover;">
    

    <form onsubmit="refresh(); return false" action="submitreg.asp" method="post">
	  <img src="images/logo.png" alt="" width="150px;">
        <h3 class="text-center">REGISTER</h3>
        <p class="text-center"><a href="index.asp">Home</a> | <a href="signin.asp">Login</a></p>
        <div class="inputbox">
            <label>Sponsor Id</label>
             <% if len(sponsor) > 0 then %> 
              <input type="text" name="sp_name" id="txtSpID" class="form-control " onKeyUp="check_sponsor_id('getsponsor.asp')" onChange="check_sponsor_id('getsponsor.asp')" onBlur="check_sponsor_id('getsponsor.asp')" onclick="check_sponsor_id('getsponsor.asp')" value="<% response.write sponsor %>" required />
              <% else %> 
              <input type="text" name="sp_name" id="txtSpID" class="form-control "  onKeyUp="check_sponsor_id('getsponsor.asp')" onChange="check_sponsor_id('getsponsor.asp')" onBlur="check_sponsor_id('getsponsor.asp')" onclick="check_sponsor_id('getsponsor.asp')" value="<% response.write sponsor %>" required />
             <% end if %>
            <p class="msg"></p>
        </div>
		<div class="inputbox">
            <label>Sponsor Name</label>
             <input class="form-control " type="text" name="sponsor-error" id="sponsor-error" value="<% response.write memb_name %>" readonly>
            <p class="msg"></p>
        </div>

        <div class="inputbox">
            <label>username</label>
              <input class="form-control " type="text" id="name" name="FIRST_NAME" required data-error="Please enter User Name" required />
            <p class="msg"></p>
        </div>
		<div class="inputbox">
            <label>Email</label>
              <input type="email" id="email" name="email" class="form-control "  required data-error="Please enter your Email" required />
            <p class="msg"></p>
        </div>
      
        <div class="inputbox">
            <label>Mobile Number</label>
          <input type="text"  class="form-control form-login " required data-error="Please enter your Mobile Number" name="Mobile_No" id="Mobile_No" required />
            <p class="msg"></p>
        </div> 
		<div class="inputbox">
            <label>Select Position</label>
         <select name="Place" id="" class="form-control">
                      <option value="" disabled selected></option>
                      <option value="L"<% response.write lselect %>>Left</option>
                      <option value="R"<% response.write rselect %>>Right</option>
                    </select>
            <p class="msg"></p>
        </div>

        <div class="inputbox">
            <label>Password</label>
              <input type="password" class="form-control " name="password" id="password"  required data-error="Please enter your Password" required />
            <p class="msg"></p>
        </div> <div class="inputbox">
            <label>Re-Password</label>
           <input type="password" name="cfpassword" id="cfpassword" class="form-control " value="" onBlur="check_pwd(this.value)" onclick="check_pwd(this.value)" onKeyUp="check_pwd(this.value)" onChange="check_pwd(this.value)" required />
            <p class="msg"></p>
        </div>

        
      
        <input type="submit" value="Register" class="submit">
      
        <div class="helpBox">
            <div class="checkBox">
              <label for="rem">Already User?</label>
            </div>
            
            <a href="signin.asp">Login Here.</a>
        </div>
    </form>



    <script>
      //form submit


let email = document.querySelector('.email');
let psd = document.querySelector('.password');
let check = document.querySelector('#rem');
let msg = document.querySelectorAll('.msg');


const refresh = () =>{
  
  if(email.value == ""){
    msg[0].innerText = "Please enter a valid email address or phone number.";
  }if(psd.value == ""){
    msg[1].innerText = "Your password must contain between 4 and 60 characters.";
  }else{
        msg[0].innerText = "";
        msg[1].innerText = "";
        alert('Sign-in succesfully');
  }
  
  email.value = "";
  psd.value = "";
  check.checked = "";
 
}

    </script>
</body>
</html>