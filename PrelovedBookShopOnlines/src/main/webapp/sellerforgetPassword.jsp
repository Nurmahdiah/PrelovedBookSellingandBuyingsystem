
<!doctype html>
<html lang="en">
  <head>
  	<title>Forget Password</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	
	<link rel="stylesheet" href="css/styles.css">
	<style>
	body,h1,h2,h3,h4,h5,h6,p,label {font-family: "Raleway", sans-serif}
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
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-12 col-lg-10">
					<div class="wrap d-md-flex">
						<div class="text-wrap p-4 p-lg-5 text-center d-flex align-items-center order-md-last">
							<div class="text w-100">
								<h2>Seller Reset Password</h2>
								<p>Password recovery</p>
							</div>
			      </div>
						<div class="login-wrap p-4 p-lg-5">
			      	<div class="d-flex">
			      		<div class="w-100">
			      			<h3>Complete Password Reset</h3>
			      		</div>
			      	</div>
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
					<form action="ForgetPasswordSeller" class="signin-form" id="form" name="form" method="post">
			      		<div class="form-group mb-3">
			      			<label class="" for="email">Email Address</label>
			      			<input type="email" name="email" id="email" class="form-control" placeholder="Email Address" required>
			      		</div>
		            <div class="form-group mb-3">
		            	<label class="" for="password">Password</label>
		              <input type="password" name="password" id="password" class="form-control" placeholder="Password" required>
		              <i class="far fa-eye" id="togglePassword" style="margin-left:0px; cursor: pointer;"> Show Password</i>                                          
		            </div>
		            <div class="form-group mb-3">
		            	<label class="" for="confirm_password">Confirm Password</label>
		              <input type="password" name="confirm_password" id="confirm_password" class="form-control" placeholder="Confirm Password" required>
		              <i class="far fa-eye" id="togglePasswords" style="margin-left:0px; cursor: pointer;"> Show Password</i>                                  
		            </div>
		            <div class="">
		            	<button type="submit" name="reset" class="form-control btn btn-primary">Reset Password</button>
		            </div>
		            <br><br>
		          </form>
		          <a href="sellerLogin.jsp"><i class="fa fa-arrow-left"> Back</i></a>
		        </div>
		      </div>
				</div>
			</div>
		</div>
	</section>

	<script src="js/jquery.min.js"></script>
  <script src="js/popper.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/main.js"></script>
  <script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<style>
    #form label{float:left; width:140px;}
    #error_msg{color:red; font-weight:bold;}
 </style>

 <script>
    $(document).ready(function(){
        var $submitBtn = $("#form input[type='submit']");
        var $passwordBox = $("#password");
        var $confirmBox = $("#confirm_password");
        var $errorMsg =  $('<span id="error_msg">Passwords do not match.</span>');

        // This is incase the user hits refresh - some browsers will maintain the disabled state of the button.
        $submitBtn.removeAttr("disabled");

        function checkMatchingPasswords(){
            if($confirmBox.val() != "" && $passwordBox.val != ""){
                if( $confirmBox.val() != $passwordBox.val() ){
                    $submitBtn.attr("disabled", "disabled");
                    $errorMsg.insertAfter($confirmBox);
                }
            }
        }

        function resetPasswordError(){
            $submitBtn.removeAttr("disabled");
            var $errorCont = $("#error_msg");
            if($errorCont.length > 0){
                $errorCont.remove();
            }  
        }


        $("#confirm_password, #password")
             .on("keydown", function(e){
                /* only check when the tab or enter keys are pressed
                 * to prevent the method from being called needlessly  */
                if(e.keyCode == 13 || e.keyCode == 9) {
                    checkMatchingPasswords();
                }
             })
             .on("blur", function(){                    
                // also check when the element looses focus (clicks somewhere else)
                checkMatchingPasswords();
            })
            .on("focus", function(){
                // reset the error message when they go to make a change
                resetPasswordError();
            })

    });
  </script>
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
	<script>
	const togglePasswords = document.querySelector('#togglePasswords');
	  const passwords = document.querySelector('#confirm_password');
	 
	  togglePasswords.addEventListener('click', function (e) {
	    // toggle the type attribute
	    const types = passwords.getAttribute('type') === 'password' ? 'text' : 'password';
	    passwords.setAttribute('type', types);
	    // toggle the eye slash icon
	    this.classList.toggle('fa-eye-slash');
	});
	</script>
	</body>
</html>

