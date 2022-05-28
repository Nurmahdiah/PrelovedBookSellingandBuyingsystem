
<!doctype html>
<html lang="en">
  <head>
  	<title>Login</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900&display=swap" rel="stylesheet">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
	
	<link rel="stylesheet" href="css/styles.css">
	<style>
	body,h1,h2,h3,h4,h5,h6,p,label {font-family: "Raleway", sans-serif}
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
								<h2>Hello Seller! <br> Welcome to Login</h2>
								<p>Don't have an account?</p>
								<a href="sellerRegister.jsp" class="btn btn-white btn-outline-white">Sign Up</a>
							</div>
			      </div>
						<div class="login-wrap p-4 p-lg-5">
			      	<div class="d-flex">
			      		<div class="w-100">
			      			<h3>Sign In to Continue</h3>
			      		</div>
			      	</div>
			      	<div id=emailpatt>
						  <h6>Invalid Email Input Pattern. </h6>
						  <p id="patternemail" class="invalid">A<b> Valid Email Address Required</b></p>
					</div>
					<form action="LoginControllerSeller" method="POST" class="signin-form">
					
			      		<div class="form-group mb-3">
			      			<label class="" for="name">Email Address</label>
			      			<input type="email" id="email" class="form-control" placeholder="Email Address" name="email" required>
			      		</div>
		            <div class="form-group mb-3">
		            	<label class="" for="password">Password</label>
		              <input type="password" id="password" class="form-control" placeholder="Password" name="password" required>
                      <i class="far fa-eye" id="togglePassword" style="margin-left:0px; cursor: pointer;"> Show Password</i>                                
		            </div>
		            <br>
		            <div class="">
		            	<button type="submit" name="button_login" class="form-control btn btn-primary">Sign In</button>
		            </div>
		            <br>
		            <div class="form-group d-md-flex">
									<div class="text-md-right">
										Forget Password ? <a style="text-decoration:underline;" href="sendEmail.jsp"> Reset Password</a>
									</div>
		            </div>
		          </form>
		          <a href="mainPage.jsp"><i class="fa fa-arrow-left"> Back</i></a>
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
  <script>
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
	</body>
</html>

