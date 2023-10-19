var btn2 = document.getElementById("event_crud");
var form=document.getElementById("event")


function createEvent1() {

    console.log("is in event");

    console.log(btn2);

    document.getElementById(
        "hidden"
    ).innerHTML = ``;
    btn2.innerHTML = `            <button data-modal-hide="defaultModal" type="button" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Close</button>
            <button  id="event_crud" type="submit" class="text-gray-500 bg-white hover:bg-gray-100 focus:ring-4 focus:outline-none focus:ring-blue-300 rounded-lg border border-gray-200 text-sm font-medium px-5 py-2.5 hover:text-gray-900 focus:z-10 dark:bg-gray-700 dark:text-gray-300 dark:border-gray-500 dark:hover:text-white dark:hover:bg-gray-600 dark:focus:ring-gray-600">Save</button>`;
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
   form.action=`updateEvent`;
    btn2.innerHTML = `<button type="button" class="btn bug shadow-sm" data-dismiss="modal">Close</button>
     <button type="submit" name="update" id="update" class="btn high shadow-sm " >Update</button>`;
}


$(document).ready(function () {
    $(".add_item_btn").click(function (e) {
        e.preventDefault();
        $("#show_item").prepend(`
               <div class="flex relative justify-between items-center mx-auto px-8 shadow-md pb-2 pt-2append_item">
                    <div class="mx-1">
                      <label for="quantity" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Number of ticket available</label>
                      <input type="number" id="quantity" name="quantity[]" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" required>
                    </div>
                    <div class="mx-1">
                      <label for="type" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Ticket Type</label>
                      <select id="type" name="type[]" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                          <option value="STANDARD"> Standard </option>
                          <option value="VIP"> VIP </option>
                      </select>
                    </div>
                    <div class="mx-1">
                      <label for="price" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Price</label>
                      <input type="number" id="price" name="price[]" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" required>
                    </div>
                    <div class="flex relative justify-between items-center mx-auto" >
                        <div class="ps-5 pb-3">
                            <button class="mt-10 p-2 bg-danger text-white relative border rounded-md hover:bg-hover2 font-bold text-sm remove_item_btn" type="button"> 
                                <svg width="20px" height="20px" viewBox="0 0 1024 1024" class="icon"  version="1.1" xmlns="http://www.w3.org/2000/svg"><path d="M724.3 198H296.1l54.1-146.6h320z" fill="#FAFCFB" /><path d="M724.3 216.5H296.1c-6.1 0-11.7-3-15.2-7.9-3.5-5-4.3-11.3-2.2-17L332.8 45c2.7-7.3 9.6-12.1 17.4-12.1h320c7.7 0 14.7 4.8 17.4 12.1l54.1 146.6c2.1 5.7 1.3 12-2.2 17-3.5 4.9-9.2 7.9-15.2 7.9z m-401.6-37h375.1L657.3 69.9H363.1l-40.4 109.6z" fill="#0F0F0F" /><path d="M664.3 981.6H339.7c-54.2 0-98.5-43.3-99.6-97.5L223.7 235h572.9l-32.8 651.4c-2.3 53.2-46.1 95.2-99.5 95.2z" fill="#9DC6AF" /><path d="M664.3 995H339.7c-29.7 0-57.8-11.4-79-32.2-21.2-20.8-33.3-48.6-34-78.3L210 221.6h600.7L777.2 887c-2.6 60.5-52.2 108-112.9 108zM237.4 248.3l16 635.5c0.5 22.7 9.7 44 25.9 59.8 16.2 15.9 37.7 24.6 60.4 24.6h324.6c46.3 0 84.2-36.2 86.2-82.5l32.1-637.4H237.4z" fill="#191919" /><path d="M827.1 239.5H193.3c-22.2 0-40.4-18.2-40.4-40.4v-2.2c0-22.2 18.2-40.4 40.4-40.4h633.8c22.2 0 40.4 18.2 40.4 40.4v2.2c0 22.2-18.2 40.4-40.4 40.4z" fill="#D39E33" /><path d="M826 252.9H194.4c-30.3 0-54.9-24.6-54.9-54.9 0-30.3 24.6-54.9 54.9-54.9H826c30.3 0 54.9 24.6 54.9 54.9s-24.7 54.9-54.9 54.9z m-631.6-83.1c-15.5 0-28.2 12.6-28.2 28.2s12.6 28.2 28.2 28.2H826c15.5 0 28.2-12.6 28.2-28.2 0-15.5-12.6-28.2-28.2-28.2H194.4z" fill="#111111" /><path d="M354.6 430.3v369.6" fill="#FAFCFB" /><path d="M354.6 813.3c-7.4 0-13.4-6-13.4-13.4V430.3c0-7.4 6-13.4 13.4-13.4s13.4 6 13.4 13.4v369.6c-0.1 7.4-6 13.4-13.4 13.4z" fill="#0F0F0F" /><path d="M458.3 430.3v369.6" fill="#FAFCFB" /><path d="M458.3 813.3c-7.4 0-13.4-6-13.4-13.4V430.3c0-7.4 6-13.4 13.4-13.4s13.4 6 13.4 13.4v369.6c0 7.4-6 13.4-13.4 13.4z" fill="#0F0F0F" /><path d="M562.1 430.3v369.6" fill="#FAFCFB" /><path d="M562.1 813.3c-7.4 0-13.4-6-13.4-13.4V430.3c0-7.4 6-13.4 13.4-13.4s13.4 6 13.4 13.4v369.6c-0.1 7.4-6.1 13.4-13.4 13.4z" fill="#0F0F0F" /><path d="M665.8 430.3v369.6" fill="#FAFCFB" /><path d="M665.8 813.3c-7.4 0-13.4-6-13.4-13.4V430.3c0-7.4 6-13.4 13.4-13.4s13.4 6 13.4 13.4v369.6c0 7.4-6 13.4-13.4 13.4z" fill="#0F0F0F" />
                                </svg>
                            </button>
                        </div>
                    </div>
               </div>
  `
        );
    });
    $(document).on("click", ".remove_item_btn", function (e) {
        e.preventDefault();
        let row_item = $(this).parent().parent().parent();
        $(row_item).remove();
    });
});
/*
function deleteCat(id) {
    if (confirm("Are you sure you want to Delete?")) {
        window.location.href = "./php/user.php?id=" + id;
    }
} */
