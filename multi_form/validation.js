var validateForm = function(elemClass, messageClass, messageErr) {
     this.elemClass = elemClass;
     this.messageClass  = messageClass;
     this.messageErr = messageErr;
}

validateForm.prototype.checkEmail = function() {
    var regexpr = /^([0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$/;
    var emailResult = regexpr.test(this.elemClass.value);
    if(!emailResult){
        this.messageClass.innerHTML = this.messageErr;
        return false;
    }
    else {
        this.messageClass.innerHTML = "";
        return true;
    }
};

validateForm.prototype.checkEmpty = function() {
    if (this.elemClass.value == null || this.elemClass.value == "") {
        this.messageClass.innerHTML = this.messageErr;
        return true;
    }
    else {
        this.messageClass.innerHTML = "";
        return false;
    }
};

validateForm.prototype.isNumber = function() {
    if (isNaN(this.elemClass.value)) {
        this.messageClass.innerHTML = this.messageErr;
        return true;
    }
    else {
        this.messageClass.innerHTML = "";
        return false;
    }
};

validateForm.prototype.isChar = function() {
    if (!isNaN(this.elemClass.value)) {
        this.messageClass.innerHTML = this.messageErr;
        return true;
    }
    else {
        this.messageClass.innerHTML = "";
        return false;
    }
};

validateForm.prototype.maxLen = function(m) {
    this.max = m;
    if (this.elemClass.value.length >= this.max && this.elemClass.value.length <= this.max) {
        this.messageClass.innerHTML = "";
        return true;
    } else {
        this.messageClass.innerHTML = this.messageErr;
        return false;
    }
};


function validateForms() { 
    var noError = true;

    var name = document.getElementsByClassName('name');
    var name_error = document.getElementsByClassName('name_error');
    for (var i=0; i< name.length; i++) {
        var validatorName = new validateForm(name[i], name_error[i], '');
        validatorName.messageErr = "Name field is required.";
        if(!validatorName.checkEmpty()) {
            validatorName.messageErr = "Invalid name.";
            if(!validatorName.isChar()) {
                noError = false;
            }
        }
        else {
            noError = false;
        }
    }

    
    var email = document.getElementsByClassName('email');   
    var email_error = document.getElementsByClassName('email_error');
    for (var i=0; i< email.length; i++) {
        var validatorEmail = new validateForm(email[i], email_error[i],'');
        validatorEmail.messageErr = "Email field is required.";
        if(!validatorEmail.checkEmpty()) {
            validatorEmail.messageErr = "Invalid email.";
            if(validatorEmail.checkEmail()) {
                noError = false;
            }
        }
        else {
            noError = false;
        }
    }

    var phone = document.getElementsByClassName('phone');
    var phone_error = document.getElementsByClassName('phone_error');
    for (var i=0; i< phone.length; i++) {
        var validatorContact = new validateForm(phone[i], phone_error[i], '');
        validatorContact.messageErr = "Phone Number field is required.";
        if(!validatorContact.checkEmpty()) {
            validatorContact.messageErr = "Invalid number.";
            if(!validatorContact.isNumber()) {
                validatorContact.messageErr = "Length must less than 10 charaters.";
                if(!validatorContact.maxLen(10)) {
                    noError = false;
                }    
            }
        }
        else {
            noError = false;
        }
    }
}

function contactFormSubmit() {
    var forms = document.getElementsByTagName('form');
    forms.submitContactForm.submit();
}
