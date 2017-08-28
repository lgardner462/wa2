<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="{{ url('static', filename='request_account.css') }}" />
</head>

<body>


<!-- ######################################################################################################### -->
<!-- ######################################################################################################### -->
<!-- JAVASCRIPT functions START -->

<script type="text/javascript">
// #########################################################################################################
var defaultColor = "#ffffff"; 
var goodColor = "#66cc66";
var badColor = "#ff6666";

var emailFilter = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
var phoneFilter = /^[(]{0,1}[0-9]{3}[)]{0,1}[-\s\.]{0,1}[0-9]{3}[-\s\.]{0,1}[0-9]{4}$/;
var userNameFilter = /^([a-z_][a-z0-9_]{0,30})$/;

// #########################################################################################################
function checkEmail(affectField) {
	if(typeof(affectField)==='undefined') affectField = true;

	var email = document.getElementById('email');
	var message = document.getElementById('emailMessage');
	
	var testresults = false;

	if (emailFilter.test(email.value)) {
		testresults=true;
		if(affectField) {
			email.style.backgroundColor = goodColor;
			emailMessage.innerHTML = "";
		}
	}
	else if(email.value != "") {
		testresults=false;
		if(affectField) {
			email.style.backgroundColor = badColor;
			emailMessage.style.color = badColor;
			emailMessage.innerHTML = "Invalid email.";
		}
	}
	else {
		testresults = false;
		email.style.backgroundColor = defaultColor;
		emailMessage.innerHTML = "";
	}

	return (testresults);
}

// #########################################################################################################
function checkPhone(affectField) {
	if(typeof(affectField)==='undefined') affectField = true;

	var phone = document.getElementById('phone');
	var message = document.getElementById('phoneMessage');

	var testresults = false;

	if (phoneFilter.test(phone.value)) {
		testresults=true;
		if(affectField) {
			phone.style.backgroundColor = goodColor;
			phoneMessage.innerHTML = "";
		}
	}
	else if(phone.value != "") {
		testresults=false;
		if(affectField) {
			phone.style.backgroundColor = badColor;
			phoneMessage.style.color = badColor;
			phoneMessage.innerHTML = "Invalid phone.";
		}
	}
	else {
		testresults = false;
		phone.style.backgroundColor = defaultColor;
		phoneMessage.innerHTML = "";
	}

	return (testresults);
}

// #########################################################################################################
function checkUserName(affectField) {
	if(typeof(affectField)==='undefined') affectField = true;

	var userName = document.getElementById('username');
	var userNameMessage = document.getElementById('usernameMessage')

	var testresults = false;
	
	if (userNameFilter.test(userName.value)) {
		testresults=true;
		
		if(affectField) {
			userName.style.backgroundColor = goodColor;
			userNameMessage.innerHTML = "";
		}
	}
	else if(userName.value != "") {
		testresults=false;
		if(affectField) {
			userName.style.backgroundColor = badColor;
			userNameMessage.style.color = badColor;
			userNameMessage.innerHTML = "Invalid username.";
		}
	}
	else {
		testresults = false;
		userName.style.backgroundColor = defaultColor;
		userNameMessage.innerHTML = "";
	}

	return (testresults);
}

// #########################################################################################################
function checkPass(affectField) {
	if(typeof(affectField)==='undefined') affectField = true;
	var testresults = false;

	//Store the password field objects into variables
	var pass1 = document.getElementById('pass1');
	var pass2 = document.getElementById('pass2'); 
	var submit = document.getElementById('submit');

	//Store the Confimation Message Object 
	var message = document.getElementById('passwordMessage');
	var submit = document.getElementById('submit');

	//Compare the values in the password field and the confirmation field
	if(pass1.value == pass2.value && pass1.value.length > 4) {
		testresults = true;
		if(affectField) {        
			pass1.style.backgroundColor = goodColor;
			pass2.style.backgroundColor = goodColor;
			message.style.color = goodColor;
			message.innerHTML = "Passphrases match.";

			if(checkEmail(false) && checkPhone(false)) {	
				submit.disabled = false;
			}
			else {
				submit.disabled = true;
			}
		}
	}
	else if(pass1.value == "" && pass2.value == "") {
		testresults = false;
		submit.disabled = true;
		pass1.style.backgroundColor = defaultColor;
		pass2.style.backgroundColor = defaultColor;
		message.innerHTML = "";
	}
	else if(pass1.value.length <= 4) {
		testresults = false;
		submit.disabled = true;
		if(affectField) {	
			pass1.style.backgroundColor = badColor;
			pass2.style.backgroundColor = badColor;
			message.style.color = badColor;
			message.innerHTML = "Passphrase must be greater than four characters.";    
		}
	}
	else {
		testresults = false;
		submit.disabled = true;
		if(affectField) {        
			pass1.style.backgroundColor = badColor;
			pass2.style.backgroundColor = badColor;
			message.style.color = badColor;
			message.innerHTML = "Pasphrases do not match.";
		}
	}

	return (testresults);
}

// #########################################################################################################
function checkFields() {
	var submit = document.getElementById('submit');
	var keyChoice = document.querySelector('input[name = "keyChoice"]:checked').value;

	if(checkEmail(false) && checkPhone(false) && checkUserName(false) && (keyChoice == "upload" || checkPass(false))) {
		submit.disabled = false;
	}
	else {
		submit.disabled = true;
	}
	return;
}


// #########################################################################################################
function uploadButton() { 
	var pass1 = document.getElementById('pass1');
	var pass2 = document.getElementById('pass2');
	var message = document.getElementById('passwordMessage');

	document.getElementById('keyButton').disabled = false;
	document.getElementById('keyButton').required = true;

	pass1.disabled = true;
	pass2.disabled = true;

	pass1.style.backgroundColor = defaultColor;
	pass2.style.backgroundColor = defaultColor;

	message.innerHTML = "";
}

// #########################################################################################################
function generateButton() {
	document.getElementById('pass1').disabled = false;
	document.getElementById('pass2').disabled = false;
	document.getElementById('keyButton').disabled = true;
	document.getElementById('keyButton').required = false;

	checkPass();
}

</script>

<!-- JAVASCRIPT functions END -->	
<!-- ######################################################################################################### -->
<!-- ######################################################################################################### -->


















<!-- ######################################################################################################### -->
<!-- ######################################################################################################### -->
<!-- HTML START -->

<form action="/request_account" method="post" enctype="multipart/form-data" id="form">
<div class="container">
	<h1>Request Account</h1>
	<!-- ######################################################################################################### -->
	<div class="fields">
    <fieldset class="col-md-6">
      <fieldset>
<legend> About You </legend>
    	<!-- ############################################# -->
      <label for="name">Name and Affiliation(s):</label><br>
      <input type = "text" name = "name" placeholder="First and Last Name" id = "name" required/>
      <input type = "text" name = "nameAffiliation" placeholder="Your organization" id = "nameAffiliation" required/>
      <br><br>
      <!-- ############################################# -->
      <label for="sponsor">Sponsor Name and Affiliation(s):</label><br>
      <input type = "text" name = "sponsor" placeholder="eg. Your PI" id = "sponsor" required/>
      <input type = "text" name = "sponsorAffiliation" placeholder="eg. PI department" id = "sponsorAffiliation" required/>
      <br><br>
      <!-- ############################################# -->
      <label for="email">Email: (Please use your institution's email)</label><br>
      <input type = "text" name = "email" id = "email" onchange = "checkEmail(); checkFields()"/>
      <span id="emailMessage" class="confirmMessage"></span>
      <br><br>
      <!-- ############################################# -->
      <label for="phone">Phone:</label><br>
      <input type = "text" name = "phone" id = "phone" onchange = "checkPhone(); checkFields()"/>
      <span id="phoneMessage" class="confirmMessage"></span>
      <br><br>
      <!-- ############################################# -->
      <label for="group">Group:</label><br>
      <select name = "group">
        % dropdownList=groupsList
        % if "mit_psfc" in dropdownList:
        % dropdownList.remove("mit_psfc") 
        % end
        % for group in dropdownList:
        
        <option value={{group}}>{{group}}</option>
        % end
      </select>
      <br><br>
      <!-- ############################################# -->
      <label for="projectDescription">Short sentence about project:</label><br>
      <input type = "text" name = "projectDescription" id = "projectDescription" size = "40" required/>
      <br><br>
</fieldset>
      <!-- ############################################# -->		
      <div class="passwordOption">
        <fieldset>
          <legend>
            <input type="radio" Style="display:none"name = "keyChoice" id = "keyChoice" value = "generate" onclick = "generateButton(); checkFields()" checked /> Your Account
          </legend>
      <label for = "username">Username: (Please use your institution's username)</label>
      <br>
      <input type = "text" name = "username" id = "username" onkeyup = "checkUserName(); checkFields()" required/>
      <span id="usernameMessage" class="confirmMessage"></span>
<br>
          <label for="pass1">Passphrase:</label>
          <br>
          <input type="password" name="pass1" id="pass1" onkeyup = "checkPass()"/>
          <br>
          <label for="pass2">Confirm Passphrase:</label>
          <br>
          <input type="password" name="pass2" id="pass2" onkeyup = "checkPass()"/>
          <span id="passwordMessage" class="confirmMessage"></span>
<br><br>
<font color="red">All cluster logins are done via SSH keys, there are no passwords! Please note that this is only the passphrase for your SSH key and if  you misplace either the SSH key or the passphrase for it you will be unable to login to the cluster until this is resolved.</font>
<br>
        </fieldset>
          <fieldset hidden>
        <legend>
          <input type="radio" name = "keyChoice" id = "keyChoice" value = "upload" onclick = "uploadButton(); checkFields()"/> Upload <b>Public</b> Key
        </legend>
        <font color="red">Only use this option if you have a SSH key that you know and love.</font><br><br>
        <input type="file" name="key" id = "keyButton" disabled required/>
        <br>
        <font color="red"><u>Usually has .pub file extension</u> (ex. "id_rsa.pub")</font>
          </fieldset>
      </div>
      <!-- ############################################# -->
      <br><br>
      <!-- ############################################# -->
      <input type = "submit" value = "Submit" id = "submit" disabled/><br>
    </fieldset>
  </div>
	<br><br>












	<!-- ######################################################################################################### -->
	<!-- ######################################################################################################### -->

  <div class="instructions">
    <div class="col-md-6">
      <div class="tabs">
        <li>
          <input type="radio" id="tab-windows" name="tabs" checked>
          <label for="tab-windows">-- Approval Process --</label>
          <div id="tab-content-windows" class="tab-content animated fadeIn">
                <ul>
	The account approval process is a human process. This process usually takes between two and four school days but may take longer. You will not be able to login with these keys until the account approval and creation process is finished. Once this is finished you will receive a welcome email and you should then be able to login to the cluster.

                </ul>
            </ol> 

          <!-- div contents -->
        </li>
        <!-- linux tab -->
      <!-- div tabs -->
</form>
</body>
</html>











