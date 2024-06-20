// Data for the table
var friends = [
    {
        user_name: 'John',
        region_name: 'North',
        soil_type: 'Loam',
        crop_name: 'Wheat',
        sowing_month: 'January',
        harvesting_month: 'June',
        yield: '500 kg',
        cultivation_cost: '$200',
        market_value: '$300'
    },
    {
        user_name: 'Alice',
        region_name: 'South',
        soil_type: 'Clay',
        crop_name: 'Corn',
        sowing_month: 'March',
        harvesting_month: 'August',
        yield: '700 kg',
        cultivation_cost: '$250',
        market_value: '$400'
    },
    {
        user_name: 'Bob',
        region_name: 'East',
        soil_type: 'Sandy',
        crop_name: 'Rice',
        sowing_month: 'February',
        harvesting_month: 'July',
        yield: '600 kg',
        cultivation_cost: '$220',
        market_value: '$350'
    }
];

// Function to generate table rows
function generateTable() {
    var tableBody = document.getElementById("tableBody");
    var html = "";
    for (var i = 0; i < friends.length; i++) {
        html += "<tr>";
        html += "<td>" + friends[i].user_name + "</td>";
        html += "<td>" + friends[i].region_name + "</td>";
        html += "<td>" + friends[i].soil_type + "</td>";
        html += "<td>" + friends[i].crop_name + "</td>";
        html += "<td>" + friends[i].sowing_month + "</td>";
        html += "<td>" + friends[i].harvesting_month + "</td>";
        html += "<td>" + friends[i].yield + "</td>";
        html += "<td>" + friends[i].cultivation_cost + "</td>";
        html += "<td>" + friends[i].market_value + "</td>";
        html += "</tr>";
    }
    tableBody.innerHTML = html;
}

// Call the function to generate the table
generateTable();