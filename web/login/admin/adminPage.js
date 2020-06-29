function getAll(contextPath) {
    getCustomers(contextPath)
}
function showDetails(codiceFiscale,contextPath) {
    $("#showBooking").html("")
    getBooking(codiceFiscale, contextPath)
}

function getBooking(codicefiscale,contextPath) {
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
            addBookingCol(table, "Check_in")
            addBookingCol(table, "Check_out")
            addBookingCol(table, "Numero")
            addBookingCol(table, "Codice Fiscale")
            addBookingCol(table,"Rimuovi prenotazione")
            document.getElementById("showBooking").appendChild(createBookingTable(data, table,contextPath))
        },
        error: function() {
            $('#showCustomer').html("Impossibile ottenere le prenotazioni")
        }
    })
}
function createBookingTable(data,table,contextPath) {
    let customers = data
    var result = [];
    for (var i in customers){
        result.push(customers[i])
    }
    result.forEach(function (element, index) {
        addBookingRow(table,element,index,customers,contextPath)
    })
    return table
}
function addBookingCol(table,textCol) {
    let col = document.createElement("TH")
    let text = document.createTextNode(textCol)
    col.appendChild(text)
    table.appendChild(col)
}

function addBookingRow(table, elementRow,index,customers,contextPath) {
    let row = document.createElement("TR")

    for (let i in elementRow){
        let td = document.createElement("TD")
        let tdText = document.createTextNode(elementRow[i])
        td.appendChild(tdText)
        row.appendChild(td)
    }
    let button = document.createElement("BUTTON")
    button.className = "btn btn-danger"
    button.onclick = function(){
    $.ajax({
            type:'POST',
            url:contextPath+'/removeReservation',
            data: {
                cf : customers[index]["codice_fiscale"],
                check_in : new Date(customers[index]["check_in"]).toISOString().slice(0, 19).replace('T', ' '),
                check_out: new Date(customers[index]["check_out"]).toISOString().slice(0, 19).replace('T', ' '),
                numero: customers[index]["numero"]
            },
            success: function() {
                alert("Prenotazione eliminata!")
                location.reload()
            },
            error: function() {
                alert("Impossibile eliminare!")
            }
        })
    }
    let buttonText = document.createTextNode("Cancella")
    button.appendChild(buttonText)
    row.appendChild(button)
    table.appendChild(row)
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
            addBookingCol(table, "Codice Fiscale")
            addBookingCol(table, "Nome")
            addBookingCol(table, "Cognome")
            addBookingCol(table, "Data di Nascita")
            addBookingCol(table,"Visualizza informazioni")
            createTableCostumer(data,table,contextPath)
        },
        error: function() {
            $('#showCustomer').html("Impossibile ottenere i clienti")
        }
    })

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

function addRowCostumer(table, elementRow,contextPath) {
    let row = document.createElement("TR")
    for (let i in elementRow){
        let td = document.createElement("TD")
        let tdText = document.createTextNode(elementRow[i])
        td.appendChild(tdText)
        row.appendChild(td)
    }
    let td = document.createElement("TD")
    let button = document.createElement("BUTTON")
    button.className = "btn btn-warning"
    button.onclick = function(){
        showDetails(elementRow.codicefiscale,contextPath);
    }
    let buttonText = document.createTextNode("Visualizza dettagli")
    button.appendChild(buttonText)
    td.appendChild(button)
    row.appendChild(td)
    table.appendChild(row)
}