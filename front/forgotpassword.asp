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
    

  <form onsubmit="refresh(); return false">
     <img src="images/logo.png" alt="" width="150px;">
    <h3 class="text-center">Forgot Password ?</h3>
    <p class="text-center"><a href="index.asp">Home</a> | <a href="signin.asp">Login</a></p>
    <div class="inputbox">
      <label>Username</label>
          <input type="text" class="form-control"  required="required" />
      <p class="msg"></p>
    </div>
    
    <input type="submit" value="Submit" class="submit">
    
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