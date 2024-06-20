var selectedRow = null;

// Show Alerts
function showAlert(message, className) {
    const div = document.createElement("div");
    div.className = 'alert alert-' + className;

    div.appendChild(document.createTextNode(message));
    const container = document.querySelector(".container");
    const main = document.querySelector(".main");
    container.insertBefore(div, main);

    setTimeout(() => div.remove(), 3000);
}

// Clear All Fields
function clearFields() {
    document.querySelector("#recordName").value = "";
}

// Add data
document.querySelector("#record-form").addEventListener("submit", (e) => {
    e.preventDefault();

    // Get Form Values
    const recordName = document.querySelector("#recordName").value;

    // Validate
    if (recordName === "") {
        showAlert("Please fill in all fields", "danger");
    } else {
        if (selectedRow === null) {
            const list = document.querySelector("#record-list");
            const row = document.createElement("tr");

            row.innerHTML = `
                <td>${recordName}</td>
                <td>
                    <a href="#" class="btn btn-warning btn-sm edit">Edit</a>
                    <a href="#" class="btn btn-danger btn-sm delete">Delete</a>
                `;
            list.appendChild(row);
            showAlert("Record Added", "success");
        } else {
            selectedRow.children[0].textContent = recordName;
            showAlert("Record Info Edited", "info");
        }
        clearFields();
    }
});

// Edit and Delete Data
document.querySelector("#record-list").addEventListener("click", (e) => {
    const target = e.target;
    const row = target.parentElement.parentElement;

    if (target.classList.contains("edit")) {
        selectedRow = row;
        document.querySelector("#recordName").value = selectedRow.children[0].textContent;
    } else if (target.classList.contains("delete")) {
        row.remove();
        showAlert("Record Data Deleted", "danger");
    }
});
