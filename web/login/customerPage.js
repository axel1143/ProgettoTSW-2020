
// Ottenimento dei dati
function getBooking(codicefiscale,contextPath) {
    $("#showBooking").html("")
    $.ajax({
        type:'POST',
        url:contextPath+'/getInfo',
        data: {
            toget : 'Booking',
            cf : codicefiscale
        },
        success: function(data) {
            let table = document.createElement("TABLE")
            table.className = "table "
            addCol(table, "Check_in")
            addCol(table, "Check_out")
            addCol(table, "Numero")
            addCol(table, "Codice Fiscale")
            addCol(table,"Rimuovi prenotazione")
            document.getElementById("showBooking").appendChild(createBookingTable(data, table,contextPath))
        },
        error: function() {
            $('#showCustomer').html("Impossibile ottenere le prenotazioni")
        }
    })
}
function getCustomers(contextPath) {
    $.ajax({
        type:'POST',
        url:contextPath+'/getInfo',
        data: {
            toget : 'Customers'
        },
        success: function(data) {
            let table = document.getElementById("tableCostumers")
            addCol(table, "Codice Fiscale")
            addCol(table, "Nome")
            addCol(table, "Cognome")
            addCol(table, "Data di Nascita")
            addCol(table, "Email di registrazione")
            addCol(table,"Visualizza prenotazioni")

            createTableCostumer(data,table,contextPath)
        },
        error: function() {
            $('#showCustomer').html("Impossibile ottenere i clienti")
        }
    })

}

//Creazione delle Tabelle
function createBookingTable(data,table,contextPath) {
    let booking = data
    var result = [];
    for (var i in booking){
        result.push(booking[i])
    }
    result.forEach(function (element, index) {
        addBookingRow(table,element,index,booking,contextPath)
    })
    return table
}

function createTableCostumer(data,table,contextPath) {
    let customers = data
    let result = [];

    for (let i in customers){
        result.push(customers[i])
    }
    result.forEach(function (element) {
        addRowCostumer(table,element,contextPath)
    })
    document.getElementById("showCustomer").appendChild(table)
}

//Add Col
function addCol(table,textCol) {
    let col = document.createElement("TH")
    let text = document.createTextNode(textCol)
    col.appendChild(text)
    table.appendChild(col)
}

//Add Row
function addBookingRow(table, elementRow,index,customers,contextPath) {
    let row = document.createElement("TR")

    for (let i in elementRow){
        let td = document.createElement("TD")
        let tdText = document.createTextNode(elementRow[i])
        td.appendChild(tdText)
        row.appendChild(td)
    }
    let tdDelete = document.createElement("TD")
    let button = document.createElement("BUTTON")
    button.className = "btn btn-danger"
    button.onclick = function(){
    $.ajax({
            type:'POST',
            url:contextPath+'/getInfo',
            data: {
                toget : 'Delete',
                cf : customers[index]["codice_fiscale"],
                check_in : new Date(customers[index]["check_in"]).toISOString().slice(0, 19).replace('T', ' '),
                check_out: new Date(customers[index]["check_out"]).toISOString().slice(0, 19).replace('T', ' '),
                numero: customers[index]["numero"]
            },
            success: function() {
                alert("Prenotazione eliminata!")
                getBooking(customers[index]["codice_fiscale"],contextPath)
            },
            error: function(error) {
                console.log(error)
                alert("Impossibile eliminare!")
            }
        })
    }
    let buttonText = document.createTextNode("Cancella")
    button.appendChild(buttonText)
    tdDelete.appendChild(button)
    row.appendChild(tdDelete)
    table.appendChild(row)
}

function addRowCostumer(table, elementRow,contextPath) {
    let row = document.createElement("TR")
    for (let i in elementRow){
        let td = document.createElement("TD")
        let tdText = document.createTextNode(elementRow[i])
        td.appendChild(tdText)
        row.appendChild(td)
    }
    getEmail(elementRow.codicefiscale, contextPath,row)
    let tdBtn = document.createElement("TD")
    let button = document.createElement("BUTTON")
    button.className = "btn btn-warning"
    button.onclick = function(){
        getBooking(elementRow.codicefiscale,contextPath);
    }
    let buttonText = document.createTextNode("Visualizza prenotazioni")
    button.appendChild(buttonText)
    tdBtn.appendChild(button)
    row.appendChild(tdBtn)
    table.appendChild(row)
}

function getEmail(codicefiscale, contextPath, row) {
    let tdEmail = document.createElement("TD")
    $.ajax({
        type:'POST',
        url:contextPath+'/getInfo',
        data: {
            toget : 'email',
            cf : codicefiscale
        },
        success: function(data) {
            tdEmail.appendChild(document.createTextNode(data))
        },
        error: function() {
            tdEmail.appendChild(document.createTextNode("Utente non registrato"))
        }
    })

    row.appendChild(tdEmail)
}