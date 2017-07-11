/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


// Validate password and re enter password fields--%>
function validatePassword(){
    var password = document.getElementById("password");
    var confirm_password = document.getElementById("re-password");
    if(password.value != confirm_password.value) {
      $("#divCheckPasswordMatch").html("Passwords do not match!");
      $("#divCheckPasswordMatch").css("color","red");
    } else {
      $("#divCheckPasswordMatch").html("Passwords match!");
      $("#divCheckPasswordMatch").css("color","green");
    }
}

// Validate email address
function verifyEmail(){
    var status = true;     
    var emailRegEx = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i;
        if (document.signup.p_email.value.search(emailRegEx) == -1) {
             alert("Please enter a valid email address in Primary Email field");                      
             status = false;
        }

        if (document.signup.s_email.value.search(emailRegEx) == -1 && document.signup.s_email.value!="") {
             alert("Please enter a valid email address in Secondary Email field");                   
             status = false;
        }
    return status;
}

