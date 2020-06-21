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
    if ($('div#Response').html() !== "Camera disponibile!") err = false // Controllo JS che non si puo' vedere proprio (Se la prenotazione non é valida non va avanti)
    if (controlCF() === false) err = false
    if (controlNames("nome") === false) err = false
    if (controlNames("cognome") === false) err = false
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

function check(){
    let check_in =$('#inputCheck').val().slice(0,10)
    let check_out =$('#inputCheck').val().slice(13,23)
    $.ajax({
        type:'POST',
        url:'./checkBooked',
        data: {
            checkin : bookedDateMaker(check_in,true),
            checkout: bookedDateMaker(check_out,true),
            tipocamera: $('#inputCamera').val(),
        },
        success: function() {
            $('div#Response').html("Camera disponibile!")
        },
        error: function(xhr,status,error) {
            if(xhr.status === 300) $('div#Response').html("Camera non disponibile, prova un'altra data!")
            else alert("Errore generico")
        }
    })
}
function bookedDateMaker(date,booked) { // Booleano usato per riutilizzare la stessa funzione nel caso si tratti di una data di prenotazione o di nascita
    let day = date.slice(3,5)
    let month = date.slice(0,2)
    let year = date.slice(6,10)
    if(booked) return year + "-" + month + "-" + day + " 10:00:00"
    else return year + "-" + month + "-" + day
}
