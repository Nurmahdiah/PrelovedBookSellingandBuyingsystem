<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    <!-- Title Page-->
    <title>Buyer Register</title>

    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
    <!-- Main CSS-->
    <link href="css/main.css" rel="stylesheet" media="all">
    <style>
    
    h2{
    	padding-left: 12px;
    }
    i{
    font-size: 14px;
    }
    #message {
	  display:none;
	  background: white;
	  color: #000;
	  position: relative;
	  padding: 20px;
	  margin-top: 10px;
	}
	
	#message p {
	  padding: 10px 35px;
	  font-size: 12px;
	}
	#emailpatt {
	  display:none;
	  background: white;
	  color: #000;
	  position: relative;
	  padding: 20px;
	  margin-top: 10px;
	}
	
	#emailpatt p {
	  padding: 10px 35px;
	  font-size: 12px;
	}
	#uname {
	  display:none;
	  background: white;
	  color: #000;
	  position: relative;
	  padding: 20px;
	  margin-top: 10px;
	}
	
	#uname p {
	  padding: 10px 35px;
	  font-size: 12px;
	}
    #postcodeid {
	  display:none;
	  background: white;
	  color: #000;
	  position: relative;
	  padding: 20px;
	  margin-top: 10px;
	}
	
	#postcodeid p {
	  padding: 10px 35px;
	  font-size: 12px;
	}	
	/* Add a green text color and a checkmark when the requirements are right */
	.valid {
	  color: green;
	}
	
	.valid:before {
	  position: relative;
	  left: -35px;
	  content: "/";
	}
	
	/* Add a red text color and an "x" when the requirements are wrong */
	.invalid {
	  color: red;
	}
	
	.invalid:before {
	  position: relative;
	  left: -35px;
	  content: "x";
	}
	
    </style>
</head>

<body>
    <div class="page-wrapper bg-dark p-t-100 p-b-50">
        <div class="wrapper wrapper--w900">
            <div class="card card-6">
                <div class="card-heading">
                    <h2 class="title">Account Registration</h2>
                </div>
                <div class="card-body">
                <h2>Personal Information</h2><hr>
                <div id=emailpatt>
						  <h6>Invalid Email Input Pattern. </h6>
						  <p id="patternemail" class="invalid">A<b> Valid Email Address Required</b></p>
					</div>
                <div id="message">
					  <h6>Password must contain the following:</h6>
					  <p id="letter" class="invalid">A <b>lowercase</b> letter</p>
					  <p id="capital" class="invalid">A <b>capital (uppercase)</b> letter</p>
					  <p id="number" class="invalid">A <b>number</b></p>
					  <p id="length" class="invalid">Minimum <b>8 characters</b></p>
				</div>
                    <form name="register" action="RegisterBuyer" method="post">
                        <div class="form-row">
                            <div class="name">First Name</div>
                            <div class="value">
                                <input class="input--style-6" type="text" name="firstname" placeholder="ex:aqilah">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">Last Name</div>
                            <div class="value">
                                <input class="input--style-6" type="text" name="lastname" placeholder="ex:saleh">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">Email address</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-6" type="email" name="email" id="email" placeholder="ex:example@gmail.com">
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">Username</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-6" type="text" name="username" id="username" placeholder="ex: Aqilah Sal" title="Must contain minimum 7 characters">
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">Password</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-6" type="password" name="password" id="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters">
                                    <i class="far fa-eye" id="togglePassword" style="margin-left:0px; cursor: pointer;"> Show Password</i>                                
                                </div>
                           </div>
                        </div>
                        <div class="form-row">
                            <div class="name">Telephone Number</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-6" type="text" name="phoneno" placeholder="ex:019-9999999">
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">Street</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-6" type="text" name="street" placeholder="ex:Lorong 15, Kampung Baru">
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">City</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-6" type="text" name="city" placeholder="ex:Ipoh">
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">Postcode</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-6" type="text" name="postcode" id="postcode" placeholder="ex: 30000" onkeypress='javascript: return isNumber(event)'>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">State</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-6" type="text" name="state" placeholder="ex:Perak">
                                </div>
                            </div>
                        </div>
                                                <br>    
                 <div class="card-footer">
                    <button class="btn btn--radius-2 btn--blue-2" name="button_register" type="submit">Register</button>
                    <a href="buyerLogin.jsp"><button type="button" class="btn btn--radius-2 btn--blue-2">Cancel</button></a>
                </div>             
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Jquery JS-->
    <script src="vendor/jquery/jquery.min.js"></script>
	<script>
	 function isNumber(evt) {
	        var iKeyCode = (evt.which) ? evt.which : evt.keyCode
	        if (iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57))
	            return false;

	        return true;
	    }
	
	</script>

    <!-- Main JS-->
    <script src="js/global.js"></script>
    
   <script>
   
   var myInput = document.getElementById("password");
   var letter = document.getElementById("letter");
   var capital = document.getElementById("capital");
   var number = document.getElementById("number");
   var length = document.getElementById("length");
   

   // When the user clicks on the password field, show the message box
   myInput.onfocus = function() {
     document.getElementById("message").style.display = "block";
   }

   // When the user clicks outside of the password field, hide the message box
   myInput.onblur = function() {
     document.getElementById("message").style.display = "none";
   }

   
   // When the user starts to type something inside the password field
   myInput.onkeyup = function() {
     // Validate lowercase letters
     var lowerCaseLetters = /[a-z]/g;
     if(myInput.value.match(lowerCaseLetters)) { 
       letter.classList.remove("invalid");
       letter.classList.add("valid");
     } else {
       letter.classList.remove("valid");
       letter.classList.add("invalid");
   }

     // Validate capital letters
     var upperCaseLetters = /[A-Z]/g;
     if(myInput.value.match(upperCaseLetters)) { 
       capital.classList.remove("invalid");
       capital.classList.add("valid");
     } else {
       capital.classList.remove("valid");
       capital.classList.add("invalid");
     }

     // Validate numbers
     var numbers = /[0-9]/g;
     if(myInput.value.match(numbers)) { 
       number.classList.remove("invalid");
       number.classList.add("valid");
     } else {
       number.classList.remove("valid");
       number.classList.add("invalid");
     }

     // Validate length
     if(myInput.value.length >= 8) {
       length.classList.remove("invalid");
       length.classList.add("valid");
     } else {
       length.classList.remove("valid");
       length.classList.add("invalid");
     }
   }
   
   var pc = document.getElementById("postcode");
   var numberss = document.getElementById("post");
   var lengthss = document.getElementById("lg");
   pc.onfocus = function() {
	     document.getElementById("postcodeid").style.display = "block";
	   }

	   // When the user clicks outside of the password field, hide the message box
  pc.onblur = function() {
	     document.getElementById("postcodeid").style.display = "none";
	   }
  pc.onkeyup = function() {
	  
	  var numbers = /[0-9]/g;
	     if(pc.value.match(numbers)) { 
	       numberss.classList.remove("invalid");
	       numberss.classList.add("valid");
	     } else {
	       numberss.classList.remove("valid");
	       numberss.classList.add("invalid");
	     }
	     
	  // Validate length
	     if(pc.value.length == 5) {
	       lengthss.classList.remove("invalid");
	       lengthss.classList.add("valid");
	     } else {
	       lengthss.classList.remove("valid");
	       lengthss.classList.add("invalid");
	     }
  }
  
  var nama = document.getElementById("username");
  var leng = document.getElementById("lngth");
  
  nama.onfocus = function() {
	     document.getElementById("uname").style.display = "block";
	   }

	   // When the user clicks outside of the password field, hide the message box
  nama.onblur = function() {
	     document.getElementById("uname").style.display = "none";
	   }
  nama.onkeyup = function() {
	     
	  // Validate length
	     if(nama.value.length >= 7) {
	       leng.classList.remove("invalid");
	       leng.classList.add("valid");
	     } else {
	       leng.classList.remove("valid");
	       leng.classList.add("invalid");
	     }
 }
  
  var emailInput = document.getElementById("email");
  var patternEmail = document.getElementById("patternemail");
  
  emailInput.onfocus = function() {
	     document.getElementById("emailpatt").style.display = "block";
	   }

	   // When the user clicks outside of the password field, hide the message box
  emailInput.onblur = function() {
	     document.getElementById("emailpatt").style.display = "none";
	   }
  emailInput.onkeyup = function() {
	     
	  //validate email
	 var emailVali = "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$";
     if(emailInput.value.match(emailVali)) { 
    	 patternEmail.classList.remove("invalid");
    	 patternEmail.classList.add("valid");
     } else {
    	 patternEmail.classList.remove("valid");
    	 patternEmail.classList.add("invalid");
     }
 }
     
   </script>
   	<script>
	const togglePassword = document.querySelector('#togglePassword');
	  const password = document.querySelector('#password');
	 
	  togglePassword.addEventListener('click', function (e) {
	    // toggle the type attribute
	    const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
	    password.setAttribute('type', type);
	    // toggle the eye slash icon
	    this.classList.toggle('fa-eye-slash');
	});
	</script>

</body><!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>
<!-- end document-->