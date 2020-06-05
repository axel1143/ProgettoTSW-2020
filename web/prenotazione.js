/*function control()
{
    let err=false;
    if(document.getElementById("inputCodiceFiscale").innerText === ("") || document.getElementById("inputCodiceFiscale").innerText.length<16){
        document.getElementById("inputCodiceFiscale").style.borderColor="red";
        err=true;
    }
    if(document.getElementById("inputNome").innerText === (""))
    {
        document.getElementById("inputNome").style.borderColor="red";
        err=true;
    }
    if(document.getElementById("inputCognome").innerText === (""))
    {
        document.getElementById("inputCognome").style.borderColor="red";
        err=true;
    }
    if(document.getElementById("inputData").innerText === (""))
    {
        document.getElementById("inputData").style.borderColor="red";
        err=true;
    }
    if (document.getElementById("inputCodiceFiscale").innerText === (""))
    {
        document.getElementById("inputCodiceFiscale").style.borderColor = "red";
        err = true;
    }
    if (document.getElementById("inputCodiceFiscale").innerText === (""))
    {
        document.getElementById("inputCodiceFiscale").style.borderColor = "red";
        err = true;
    }


    if(document.getElementById("registerCheck").checked === true) {


        if (document.getElementById("inputEmail").innerText === ("")) {
            document.getElementById("inputEmail").style.borderColor = "red";
            err = true;
        }

        if (document.getElementById("exampleInputPassword1").innerText === ("")) {
            document.getElementById("exampleInputPassword1").style.borderColor = "red";
            err = true;
        }
    }
    return !err;
}*/
function control() {
    let err = true;
    if (controlCF() === false) err = false
    if (controlNames("nome") === false) err = false
    if (controlNames("cognome") === false) err = false
    if (controlDate("inputIn") === false) err = false
    if (controlDate("inputOut") === false) err = false
    if (controlBirth() ===false) err = false
    if(document.getElementById("registerCheck").checked){
        if(controlEmail() === false) err = false
        if(controlPassword() === false) err = false
    }
    return err
}
function controlPassword() {
    let password = document.getElementById("inputPassword")
        if(password.value === "" || password.value.length < 10){
            password.style.borderColor = "red"
            return false
        }
        password.style.borderColor = "green"
        return true
}
function controlEmail() {
        let email = document.getElementById("inputEmail")
        let regCheck = /^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/
        if(email.value.match(regCheck)){
            email.style.borderColor = "green"
            return true
        }
        else{
            email.style.borderColor = "red"
            return false
        }
}
function controlBirth() {
    let birth = document.getElementById("inputData")
    let regCheck = /\d{4}-\d{2}-\d{2}/
    if(birth.value.match(regCheck)){
        birth.style.borderColor = "green"
        return true
    }
    else {
        birth.style.borderColor = "red"
        return false
    }

}
function controlDate(inputdate) {
    let date = document.getElementById(inputdate)
    let regCheck = /\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}/
    if(date.value.match(regCheck)){
        date.style.borderColor = "green"
        return true
    }
    else {
        date.style.borderColor ="red"
        return false
    }
}
function controlNames(tocheck) {
    let name = document.forms["register"][tocheck];
    if(name.value === "" || name.value.length > 20){
        name.style.borderColor= "red";
        return false
    }
    else {
        name.style.borderColor="green"
        return true;
    }

}
function controlCF() {
    let cf = document.forms["register"]["codicefiscale"];
    let patternEmail = /^[A-Z]{6}\d{2}[A-Z]\d{2}[A-Z]\d{3}[A-Z]$/i;
    if( cf.value=== "" || cf.value.size < 16 || !cf.value.match(patternEmail)){
        cf.style.borderColor = "red";
        return false
    }
    else {
        cf.style.borderColor = "green";
        return true
    }
}
function showRegister() {
    let registerPar = document.getElementById("registerForm")
    if(registerPar.className === "hidden") {
        registerPar.className = "show"
       $("#registerForm").slideDown();
    }
    else if(registerPar.className ==="show"){
        registerPar.className ="hidden"
        $("#registerForm").slideUp()
    }
}