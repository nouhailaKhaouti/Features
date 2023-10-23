
function editComment(id, description) {
    console.log(
        id
    );
    document.getElementById("description").value = description;
    document.getElementById(
        "hiddenComment"
    ).innerHTML = `<input type="hidden" name="id" value="${id}">`;

}