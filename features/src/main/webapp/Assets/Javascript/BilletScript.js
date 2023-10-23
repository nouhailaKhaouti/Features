var btn2 = document.getElementById("billet-crud");
var form=document.getElementById("billet")
function createBillet1(event) {

    console.log("is in event");
    console.log(btn2);
    document.getElementById(
        "hidden"
    ).innerHTML = ``;
    document.getElementById("action").value="create";
    document.getElementById("event").value=event;
    btn2.innerHTML = `
            <button type="submit" id="billet-crud" class="btn btn-warning">Save</button>`;
}

function editBillet(id, price,quantity,type) {
    console.log(
        id
    );
    document.getElementById("price").value = price;
    document.getElementById("quantity").value = quantity;
    document.getElementById("type").value = type;
    document.getElementById(
        "hidden"
    ).innerHTML = `<input type="hidden" name="id" value="${id}">`;
    document.getElementById("action").value="update";
    btn2.innerHTML = `
     <button type="submit" id="billet-crud" class="btn btn-warning " >Update</button>`;
}