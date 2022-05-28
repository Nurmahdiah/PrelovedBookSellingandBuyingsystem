<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  
  	<title>Reset Password</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900&display=swap" rel="stylesheet">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	            <meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" ></script>
  
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
								<h2>Seller Reset Password</h2>
												<div class="text-center">
            

                </div>
								<p>Password recovery</p>
								<h6 id="result"></h6>
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
			      		<div class="form-group mb-3">
			      			<label for="email">Email Address</label>
			      			<input type="email" name="email" id="email" class="form-control" placeholder="Email Address" >
			      		</div>
			      		<input type="hidden" id="message" name="message" value="Hello Seller ! Your are receiving this message because you choose to reset your Password on the Preloved Book Shop Platform. Go on to this link to reset your password.  http://localhost:8080/PrelovedBookOnline/sellerforgetPassword.jsp  Thank You.">
			      		
		            <div>
		            	<button type="submit" name="reset" onclick="callJqueryAjax()" class="form-control btn btn-primary">Reset Password</button>
		            </div>
		            <br><br>
		          <a href="sellerLogin.jsp"><i class="fa fa-arrow-left"> Back</i></a>
		        </div>
		      </div>
				</div>
			</div>
		</div>
	</section>
                    <script>
                        function callJqueryAjax() {
                            var subject = $('#subject').val();
                            var email = $('#email').val();
                            var message = $('#message').val();
                            $.ajax({
                                url: 'EmailSendingServlet',
                                method: 'POST',
                                data: {subject: subject, email: email, message: message},
                                success: function (resultText) {
                                    $('#result').html(resultText);
                                },
                                error: function (jqXHR, exception) {
                                    console.log('Error occured!!');
                                }
                            });
                        }
                        <%
                       
                        %>
                    </script>
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
	</body>
</html>

