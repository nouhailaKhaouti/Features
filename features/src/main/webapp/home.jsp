<%@ page import="com.example.eventmanagementapp.Domain.Event" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.eventmanagementapp.Domain.Commentaire" %>
<%@ page import="com.example.eventmanagementapp.Domain.Billet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="./public/navbar.jsp" />
<jsp:include page="./public/EventModal.jsp" />
<%--
<section class="py-10 bg-gray-100">
    <div class="mx-auto grid max-w-6xl  grid-cols-1 gap-6 p-6 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4">
        <%
            List<Event> events = (List<Event>) request.getAttribute("events");
            for (Event event : events) {
        %>
        <article class="rounded-xl bg-white p-3 shadow-lg hover:shadow-xl hover:transform hover:scale-105 duration-300 ">
            <a href="#">
                <div class="relative flex items-end overflow-hidden rounded-xl">
                    <img src="https://images.unsplash.com/photo-1515955656352-a1fa3ffcd111?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80" alt="Hotel Photo" />
                    <div class="flex items-center space-x-1.5 rounded-lg bg-blue-500 px-4 py-1.5 text-white duration-100 hover:bg-blue-600">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="h-4 w-4">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 3h1.386c.51 0 .955.343 1.087.835l.383 1.437M7.5 14.25a3 3 0 00-3 3h15.75m-12.75-3h11.218c1.121-2.3 2.1-4.684 2.924-7.138a60.114 60.114 0 00-16.536-1.84M7.5 14.25L5.106 5.272M6 20.25a.75.75 0 11-1.5 0 .75.75 0 011.5 0zm12.75 0a.75.75 0 11-1.5 0 .75.75 0 011.5 0z" />
                        </svg>

                        <button class="text-sm">Add to cart</button>
                    </div>
                </div>

                <div class="mt-1 p-2">
                    <h2 class="text-slate-700">Adobe Photoshop CC 2022</h2>
                    <p class="mt-1 text-sm text-slate-400">Lisbon, Portugal</p>

                    <div class="mt-3 flex items-end justify-between">
                        <p class="text-lg font-bold text-blue-500">$850</p>

                        <div class="flex items-center space-x-1.5 rounded-lg bg-blue-500 px-4 py-1.5 text-white duration-100 hover:bg-blue-600">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="h-4 w-4">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 3h1.386c.51 0 .955.343 1.087.835l.383 1.437M7.5 14.25a3 3 0 00-3 3h15.75m-12.75-3h11.218c1.121-2.3 2.1-4.684 2.924-7.138a60.114 60.114 0 00-16.536-1.84M7.5 14.25L5.106 5.272M6 20.25a.75.75 0 11-1.5 0 .75.75 0 011.5 0zm12.75 0a.75.75 0 11-1.5 0 .75.75 0 011.5 0z" />
                            </svg>

                            <button class="text-sm">Add to cart</button>
                        </div>
                    </div>
                </div>
            </a>
        </article>
        <%
            }
        %>
    </div>
</section>--%>


<div class="flex relative justify-between flex-wrap mx-5">
    <%
        List<Event> events = (List<Event>) request.getAttribute("events");
        for (Event event : events) {
    %>
    <div class="p-5 max-w-sm rounded overflow-hidden shadow-lg">
        <img class="w-full" src="./Assets/Images/card-top.jpg" alt="Sunset in the mountains">
        <div class="px-6 py-4">
            <div class="font-bold text-xl mb-2"><%=event.getName()%></div>
            <p class="text-gray-700 text-base">
                <%=event.getDescription()%>
            </p>
        </div>
        <div class="px-6 pt-4 pb-2">
            <span class="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-gray-700 mr-2 mb-2">Created by <%=event.getUser().getUsername()%></span>
            <button class="inline-block bg-cl1-200 rounded-full px-3 py-1 text-sm font-semibold text-white-700 mr-2 mb-2" data-modal-toggle="defaultModal"  onclick="editEvent(`<%=event.getId()%>`,`<%=event.getName()%>`,`<%=event.getDescription()%>`,`<%=event.getDate()%>`,`<%=event.getLieu()%>`,`<%=event.getHour()%>`,`<%=event.getCategory().getId()%>`)">Update</button>
            <button class="inline-block bg-cl2-200 rounded-full px-3 py-1 text-sm font-semibold text-white-700 mr-2 mb-2" onclick="deleteEvent(`<%=event.getId()%>`)">Delete</button>
            <button data-modal-target="extralarge-modal-<%=event.getId()%>" data-modal-toggle="extralarge-modal-<%=event.getId()%>" class="inline-block bg-cl2-200 rounded-full px-3 py-1 text-sm font-semibold text-white-700 mr-2 mb-2" >View</button>
        </div>
    </div>
    <div id="extralarge-modal-<%=event.getId()%>" tabindex="-1" class="fixed top-0 left-0 right-0 z-50 hidden w-full p-4 overflow-x-hidden overflow-y-auto md:inset-0 h-[calc(100%-1rem)] max-h-full">
        <div class="relative w-full max-w-7xl max-h-full">
            <!-- Modal content -->
            <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
                <!-- Modal header -->
                <div class="flex items-center justify-between p-5 border-b rounded-t dark:border-gray-600">
                    <h3 class="text-xl font-medium text-gray-900 dark:text-white">
                        <%=event.getName()%>
                    </h3>
                    <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ml-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white" data-modal-hide="extralarge-modal">
                        <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"></path>
                        </svg>
                        <span class="sr-only">Close modal</span>
                    </button>
                </div>
                <!-- Modal body -->
                <div class="p-6 space-y-6">
                  <%--event section--%>
                      <section class="bg-white dark:bg-gray-900">
                          <div class="grid max-w-screen-xl px-4 py-8 mx-auto lg:gap-8 xl:gap-0 lg:py-16 lg:grid-cols-12">
                              <div class="hidden lg:mt-0 lg:col-span-5 lg:flex rounded-lg">
                                  <img src="./Assets/Images/card-top.jpg" alt="mockup" class="rounded-lg w-full">
                                  <p class="max-w-2xl mb-6 font-light text-gray-500 lg:mb-8 md:text-lg lg:text-xl dark:text-gray-400"><%=event.getDescription()%></p>
                                  <p class="max-w-2xl mb-6 font-light text-gray-500 lg:mb-8 md:text-lg lg:text-xl dark:text-gray-400">Be ready to join us <span class="inline-block bg-cl1 px-3 py-1 text-sm font-semibold text-gray-700 mr-2 mb-2"><%=event.getLieu()%></span> <span class="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-gray-700 mr-2 mb-2"> <%=event.getDate()%> at <%=event.getHour()%> </span> </p>
                              </div>
                              <div class="mr-auto place-self-center lg:col-span-7">
                                  <form class="w-full max-w-sm" action="${pageContext.request.contextPath}/ticket">
                                      <div class="flex items-center border-b border-teal-500 py-2">

                                          <select class="appearance-none bg-transparent border-none w-full text-gray-700 mr-3 py-1 px-2 leading-tight focus:outline-none"  aria-label="Full name">
                                              <% for(Billet billet: event.getBillets()){ %>
                                              <option value="<%=billet.getId()%>"><%=billet.getBilletType()%> <span class="text-gray font-bold"><%=billet.getPrix()%></span></span></option>
                                              <%}%>
                                          </select>
                                          <input type="hidden" name="action" value="create" >
                                          <button class="flex-shrink-0 bg-teal-500 hover:bg-teal-700 border-teal-500 hover:border-teal-700 text-sm border-4 text-white py-1 px-2 rounded" type="button">
                                              buy now
                                          </button>
                                      </div>
                                  </form>
                              </div>
                          </div>
                      </section>
                    <%--Commente section--%>
                    <section class="bg-white dark:bg-gray-900 py-8 lg:py-16 antialiased">
                        <div class="max-w-2xl mx-auto px-4">
                            <div class="flex justify-between items-center mb-6">
                                <h2 class="text-lg lg:text-2xl font-bold text-gray-900 dark:text-white">Discussion (20)</h2>
                            </div>
                            <form class="mb-6" action="/Comment">
                                <div class="py-2 px-4 mb-4 bg-white rounded-lg rounded-t-lg border border-gray-200 dark:bg-gray-800 dark:border-gray-700">
                                    <label for="comment" class="sr-only">Your comment</label>
                                    <textarea id="comment" rows="6"
                                              class="px-0 w-full text-sm text-gray-900 border-0 focus:ring-0 focus:outline-none dark:text-white dark:placeholder-gray-400 dark:bg-gray-800"
                                              placeholder="Write a comment..." required></textarea>
                                </div>
                                <input type="hidden" name="action" value="create" >
                                <button type="submit"
                                        class="inline-flex items-center py-2.5 px-4 text-xs font-medium text-center text-white bg-primary-700 rounded-lg focus:ring-4 focus:ring-primary-200 dark:focus:ring-primary-900 hover:bg-primary-800">
                                    Post comment
                                </button>
                            </form>
                            <% for(Commentaire commentaire:event.getCommentaires()){ %>
                            <article class="p-6 mb-3 ml-6 lg:ml-12 text-base bg-white rounded-lg dark:bg-gray-900">
                                <footer class="flex justify-between items-center mb-2">
                                    <div class="flex items-center">
                                        <p class="inline-flex items-center mr-3 text-sm text-gray-900 dark:text-white font-semibold"><img
                                                class="mr-2 w-6 h-6 rounded-full"
                                                src="https://flowbite.com/docs/images/people/profile-picture-5.jpg"
                                                alt="Jese Leos"><%=commentaire.getUser().getUsername()%></p>
                                        <p class="text-sm text-gray-600 dark:text-gray-400"><time><%=commentaire.getDateDeCreation()%></time></p>
                                        <p class="text-sm text-gray-600 dark:text-gray-400"><%=commentaire.getEvaluation()%></p>
                                    </div>
                                    <button id="dropdownComment2Button" data-dropdown-toggle="dropdownComment2"
                                            class="inline-flex items-center p-2 text-sm font-medium text-center text-gray-500 dark:text-gray-40 bg-white rounded-lg hover:bg-gray-100 focus:ring-4 focus:outline-none focus:ring-gray-50 dark:bg-gray-900 dark:hover:bg-gray-700 dark:focus:ring-gray-600"
                                            type="button">
                                        <svg class="w-4 h-4" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 16 3">
                                            <path d="M2 0a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3Zm6.041 0a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM14 0a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3Z"></path>
                                        </svg>
                                        <span class="sr-only">Comment settings</span>
                                    </button>
                                    <!-- Dropdown menu -->
                                    <div id="dropdownComment2"
                                         class="hidden z-10 w-36 bg-white rounded divide-y divide-gray-100 shadow dark:bg-gray-700 dark:divide-gray-600">
                                        <ul class="py-1 text-sm text-gray-700 dark:text-gray-200"
                                            aria-labelledby="dropdownMenuIconHorizontalButton">
                                            <li>
                                                <button
                                                   class="block py-2 px-4 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Edit</button>
                                            </li>
                                            <li>
                                                <button
                                                   class="block py-2 px-4 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Remove</button>
                                            </li>
                                        </ul>
                                    </div>
                                </footer>
                                <p class="text-gray-500 dark:text-gray-400"><%=commentaire.getText()%></p>
                                <div class="flex items-center mt-4 space-x-4">
                                    <button type="button"
                                            class="flex items-center text-sm text-gray-500 hover:underline dark:text-gray-400 font-medium">
                                        <svg class="mr-1.5 w-3.5 h-3.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 18">
                                            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 5h5M5 8h2m6-3h2m-5 3h6m2-7H2a1 1 0 0 0-1 1v9a1 1 0 0 0 1 1h3v5l5-5h8a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1Z"></path>
                                        </svg>
                                        Reply
                                    </button>
                                </div>
                            </article>
                            <%
                                }
                            %>
                        </div>

                    </section>
                </div>
            </div>
        </div>
    </div>
    <%
        }
    %>
</div>



<jsp:include page="./public/footer.jsp" />
