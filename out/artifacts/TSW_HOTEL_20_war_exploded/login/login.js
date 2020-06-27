function controlEmail() {
    let errMail = $('#emailError')
    let email = $("#inputEmail")
    let regCheck = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
    if(!email.val().match(regCheck)){
        email.css("border-color", "red")
        errMail.css("color","red")
        errMail.html("Inserisci un indirizzo email valido")
        errMail.fadeIn()
        return false
    }
    else{
        email.css("border-color", "green")
        errMail.fadeOut()
        return true
    }
}
function controlPassword() {
    let errPass = $('#passwordError')
    let password = $("#inputPassword")
    if(password.val() === "" || password.val().length < 10){

        password.css("border-color", "red")
        errPass.css("color", "red")
        errPass.html("Inserisci una password con almeno 10 caratteri!")
        errPass.fadeIn()
        return false
    }

    else {
        password.css("border-color", "green")
        errPass.fadeOut()
        return true

    }

}

function checkLogin() {
    let err = true
    err = controlEmail();
    err = controlPassword()
    return err
}
