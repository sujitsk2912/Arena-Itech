<% 

id = request.querystring("id")
pwd = request.querystring("pwd")

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
</head>
    <script src="https://unpkg.com/feather-icons"></script>
    
<body class="body" style="background: url(images/game-05-400x400.jpg); background-size: cover;">
    

    <form onsubmit="refresh(); return false" method="POST" action="checkuser.asp">

	    <img src="images/logo.png" alt="" width="150px;" class="text-center">
	
        <h3>LOGIN</h3>
		 <% if len(request.querystring("msgtext")) > 2 then %>
                <div class="form-group">
                  <center style="color:red;"><% response.write request.querystring("msgtext")%></center>
                </div>
              <% end if %>
        <p class="text-center"><a href="index.asp">Home</a> | <a href="signup.asp">Register</a></p>
        <div class="inputbox">
            <label>User Name</label>
           <input type="text" id="user" name="user" class="form-control"   value="<% response.write id  %>" required>
            <p class="msg"></p>
        </div>
      
      
        <div class="inputbox">
            <label>Password</label>
          <input type="password" id="pwd" name="pwd" class="form-control"   required data-error="Please enter your password" value="<% response.write pwd  %>" required>
            <p class="msg"></p>
        </div>

        <div class="helpBox">
            <div class="checkBox">
              <input type="checkbox" id="rem">
              <label for="rem">Remember me</label>
            </div>

            <div class=" text-right">
                <a href="forgotpassword.asp">Forgot Pasword?</a>
            </div>
        </div>
      
       <input type="submit" value="Login" class="submit"> 
      
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