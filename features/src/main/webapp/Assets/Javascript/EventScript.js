var btn2 = document.getElementById("event_crud");
var form=document.getElementById("event")
var mini =document.querySelector(".mini-form")
    function createEvent1() {

    console.log("is in event");
    console.log(btn2);
    document.getElementById(
        "hidden"
    ).innerHTML = ``;
    document.getElementById("action").value="create";
    mini.classList.remove("d-none");
    btn2.innerHTML = `
            <button  id="event_crud" type="submit" class="btn btn-warning">Save</button>`;
    }

    function editEvent(id, name,description,date,lieu,hour,category) {
        console.log(
            id +
            "  " +
            name
        );
        document.getElementById("name").value = name;
        document.getElementById("description").value = description;
        document.getElementById("lieu").value = lieu;
        document.getElementById("date").value = date;
        document.getElementById("hour").value = hour;
        document.getElementById("category").value = category;
        document.getElementById(
            "hidden"
        ).innerHTML = `<input type="hidden" name="id" value="${id}">`;
        mini.classList.add("d-none");
        document.getElementById("action").value="update";
        btn2.innerHTML = `<button  id="event_crud" type="submit" class="btn btn-warning">Update</button>`;

    }


    $(document).ready(function() {
        $(document).on("click", ".add_item_btn", function (e) {
            if ($("#show_item")[0].childElementCount < 2) {
                appendFormTicket();
            } else {
                e.preventDefault()
            }
        });

        $(document).on("click", ".remove_item_btn", function (e) {
            e.preventDefault()
            if ($("#show_item")[0].childElementCount === 1) {
                $(".remove_item_btn").prop("disabled", true)
            } else {
                $(".remove_item_btn").each(function () {
                    $(this).prop("disabled", false)
                })
                let row_item = $(this).parent();
                $(row_item).remove();
            }
        });

        function appendFormTicket() {
            let newFormTickets = $(` 
                    <div class="mb-3 border border-2 rounded p-3 append_item">
                        <div class="mb-3">
                            <label for="quantity" class="form-label">Number of ticket available</label>
                            <input type="number" id="quantity" name="quantity[]" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label for="type" class="form-label">Ticket Type</label>
                            <select id="type" name="type[]" class="form-select">
                                <option value="STANDARD">Standard</option>
                                <option value="VIP">VIP</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="price" class="form-label">Price</label>
                            <input type="number" id="price" name="price[]" class="form-control">
                        </div>
                        <button type="button" class="btn bg-transparent mt-4 remove_item_btn">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0,0,256,256" width="20px" height="20px"><g fill="#fdb752" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-size="none" style="mix-blend-mode: normal"><g transform="scale(5.33333,5.33333)"><path d="M20.5,4c-0.49034,-0.00628 -0.95279,0.22749 -1.23848,0.62606c-0.28569,0.39856 -0.35854,0.9116 -0.19511,1.37394h-4.42578c-1.844,0 -3.55417,0.91622 -4.57617,2.44922l-2.36719,3.55078h-0.19727c-0.54095,-0.00765 -1.04412,0.27656 -1.31683,0.74381c-0.27271,0.46725 -0.27271,1.04514 0,1.51238c0.27271,0.46725 0.77588,0.75146 1.31683,0.74381h33c0.54095,0.00765 1.04412,-0.27656 1.31683,-0.74381c0.27271,-0.46725 0.27271,-1.04514 0,-1.51238c-0.27271,-0.46725 -0.77588,-0.75146 -1.31683,-0.74381h-0.19727l-2.36719,-3.55078c-1.022,-1.533 -2.73317,-2.44922 -4.57617,-2.44922h-4.42578c0.16343,-0.46234 0.09058,-0.97538 -0.19511,-1.37394c-0.28569,-0.39856 -0.74814,-0.63234 -1.23848,-0.62606zM8.97266,18l2.15234,20.08594c0.3,2.802 2.65075,4.91406 5.46875,4.91406h14.8125c2.817,0 5.16775,-2.11206 5.46875,-4.91406l2.15234,-20.08594z"></path></g></g>
                            </svg>
                        </button>
                    </div>
                    `)
            $("#show_item").append(newFormTickets)
        }
    })
    function deleteEvent(id) {
        if (confirm("Are you sure you want to Delete?")) {
            window.location.href = "/EventManagementApp_war_exploded/event?id=" + id;
        }
    }