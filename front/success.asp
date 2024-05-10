<!-- #include file = "ff1.asp" -->
<% 
    Set RS1 = Server.CreateObject("ADODB.Recordset")
    QU1="SELECT a.memb_name,a.username,a.mpwd,a.email,a.mobile_no from entry a where memb_code="&request.querystring("mcode")
    'response.write qu1 &"<br>"
    RS1.OPEN QU1,GCONN
    IF RS1.EOF AND RS1.BOF THEN
    ELSE
        memb_name=RS1("memb_name")
        username=RS1("username")
        mpwd=RS1("mpwd")
        email=RS1("email")
        mobile_no=RS1("mobile_no")
    END IF
    RS1.CLOSE
    

    
    
    If Cdbl(srno) <= 2000 Then
  
    domain = "moneyplant.capital"

       MEesage = "Your valid User ID and Password is given below: User ID : " & USERNAME & "  Password : " & MPWD & "Thanks and regards " & domain & " ."
    
        
    
       url="http://173.45.76.227/send.aspx?username=logicpune&pass=Logic@123&route=trans1&senderid=MNYMNY&numbers="&mobile_no&"&message="&MEesage
       ' response.write url &"</br>"
       Dim DimValue2
        set DimValue2 = Server.CreateObject("Msxml2.XMLHTTP")
        DimValue2.Open "get", url , false
        DimValue2.Send
        REC_AMT = DimValue2.responseText
    
        qu1 = "INSERT INTO sms_dtl VALUES( '"&url&"' , '"&nowCET&"' )"
        GCONN.EXECUTE qu1
    
  End If
    
    
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blossamstar</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/login.css">
	  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
    <script src="https://unpkg.com/feather-icons"></script>
    
<body class="body" style="background: url(images/game-05-400x400.jpg); background-size: cover;">
    

  <form onsubmit="refresh(); return false" action="#" method="POST">
     <img src="images/logo.png" alt="" width="150px;">
    <h3 class="text-center">Registration succesfully !</h3>
    <p class="text-center"><a href="index.asp">Home</a> | <a href="signin.asp">Login</a></p>
    <div class="inputbox">
   
          <table class="table table-bordered border-white text-center text-white">
		    <thead>
            <tr>
                <th>User Id</th>
                <th>Password</th>
            </tr>
			  </thead>
			  <tbody>
            <tr>
              <td class="text-white"><% response.write username %></td>
              <td class="text-white"><% response.write mpwd %></td>
            </tr>
			</tbody>
          </table>
      
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