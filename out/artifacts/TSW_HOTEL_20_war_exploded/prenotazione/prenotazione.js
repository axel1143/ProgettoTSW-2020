function control() {
    let responsePar = $('div#Response')
    let err = true;
    if (responsePar.html() !== "Camera disponibile!") {
        err = false
        responsePar.css("color", "red")
        responsePar.html("Data di prenotazione non controllata!")
    }
    if (controlCF() === false) err = false
    if (controlNames("nome") === false) err = false
    if (controlNames("cognome") === false) err = false
    if (controlAge() === false) err = false
    if(document.getElementById("registerCheck").checked){
        if(controlEmail() === false) err = false
        if(controlPassword() === false) err = false
    }
    return err
}
function controlPassword() {
    let errPass = $('#passwordError')
    errPass.html('')
    let password = $("#inputPassword")
        if(password.val() === "" || password.val().length < 10){
            password.css("border-color", "red")
            errPass.css("color", "red")
            errPass.html("Inserisci una password con almeno 10 caratteri!")
            return false
        }
        password.css("border-color", "green")
        return true
}
function controlEmail() {
        let errMail = $('#emailError')
        errMail.html('');
        let email = $("#inputEmail")
        let regCheck =/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
        if(!email.val().match(regCheck)){
            email.css("border-color", "red")
            errMail.css("color","red")
            errMail.html("Inserisci una email in un formato valido!")
            return false
        }
        else{
            email.css("border-color", "green")
            return true
        }
}
function controlNames(tocheck) {
    if(tocheck === "nome"){
        var nameErr = $('#nomeError')
        nameErr.html("")
    }
    if(tocheck === "cognome") {
        var cognomeErr = $('#cognomeError')
        cognomeErr.html('')
    }
    let name = document.forms["register"][tocheck];
    if(name.value === "" || name.value.length > 20){
        name.style.borderColor= "red";
        if(tocheck === "nome") {
            nameErr.css("color","red")
            nameErr.html("Inserisci un nome valido!")
        }
        if(tocheck === "cognome") {
            cognomeErr.css("color","red")
            cognomeErr.html("Inserisci un nome valido!")
        }
        return false
    }
    else {
        name.style.borderColor="green"
        return true;
    }

}
function controlCF() {
    let cfErr = $('#cfError')
    cfErr.html('')
    let cf = document.forms["register"]["codicefiscale"];
    let patternEmail = /^[A-Z]{6}\d{2}[A-Z]\d{2}[A-Z]\d{3}[A-Z]$/i;
    if( cf.value=== "" || cf.value.size < 16 || !cf.value.match(patternEmail)){
        cf.style.borderColor = "red";
        cfErr.css("color","red")
        cfErr.html("Inserisci un codice fiscale in un formato valido!")
        return false
    }
    else {
        cf.style.borderColor = "green";
        return true
    }
}

function controlAge()
{
    let dataErr = $('#dataError')
    dataErr.html('')
    let data = document.forms["register"]["nascita"];
    let dataNow= new Date();
    let dataNasc = new Date(data.value);
    let age= (dataNow - dataNasc)/31536000000;
    console.log(age)
    if (age < 18)
    {
        data.style.borderColor = "red";
        dataErr.css("color", "red");
        dataErr.html("Bisogna avere più di 18 anni per prenotare una camera ")
        return false;
    }
    else
    {
        data.style.borderColor = "green";
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
    let date  = $('#inputCheck').val()
    let responsePar = $('div#Response')
    responsePar.html("")
    let check_in =date.slice(0,10)
    let check_out =date.slice(13,23)
    $.ajax({
        type:'POST',
        url:'../checkBooked',
        data: {
            checkin : bookedDateMaker(check_in,true),
            checkout: bookedDateMaker(check_out,true),
            tipocamera: $('#inputCamera').val(),
        },
        success: function() {
            responsePar.html("Camera disponibile!")
            responsePar.css("color" , "green")
        },
        error: function(xhr,status,error) {
            if(xhr.status === 300){
                responsePar.html("Camera non disponibile, prova un'altra data!")
                responsePar.css("color", "red")
            }
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
