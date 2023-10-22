<%@ page import="com.example.eventmanagementapp.Domain.Event" %><%--
  Created by IntelliJ IDEA.
  User: Youcode
  Date: 21/10/2023
  Time: 11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/public/navbar.jsp"/>
<% Event event= (Event) request.getAttribute("event");%>
<%--Event display --%>
<section class="bg-white dark:bg-gray-900">
  <div class="grid max-w-screen-xl px-4 py-8 mx-auto lg:gap-8 xl:gap-0 lg:py-16 lg:grid-cols-12">
    <div class="hidden lg:mt-0 lg:col-span-5 lg:flex rounded-lg">
      <img src="./Assets/Images/card-top.jpg" alt="mockup" class="rounded-lg w-full">
    </div>
    <div class="mr-auto place-self-center lg:col-span-7">
      <h1 class="max-w-2xl mb-4 text-4xl font-extrabold tracking-tight leading-none md:text-5xl xl:text-6xl dark:text-white"><%=event.getName()%></h1>
      <p class="max-w-2xl mb-6 font-light text-gray-500 lg:mb-8 md:text-lg lg:text-xl dark:text-gray-400"><%=event.getDescription()%></p>
      <p class="max-w-2xl mb-6 font-light text-gray-500 lg:mb-8 md:text-lg lg:text-xl dark:text-gray-400">Be ready to join us <span class="inline-block bg-cl1 px-3 py-1 text-sm font-semibold text-gray-700 mr-2 mb-2"><%=event.getLieu()%></span> <span class="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-gray-700 mr-2 mb-2"> <%=event.getDate()%> at <%=event.getHour()%> </span> </p>
      <a href="#" class="inline-flex items-center justify-center px-5 py-3 mr-3 text-base font-medium text-center text-white rounded-lg bg-primary-700 hover:bg-primary-800 focus:ring-4 focus:ring-primary-300 dark:focus:ring-primary-900">
        <button class="inline-block bg-cl1-200 rounded-full px-3 py-1 text-sm font-semibold text-white-700 mr-2 mb-2" data-modal-toggle="defaultModal"  onclick="editEvent(`<%=event.getId()%>`,`<%=event.getName()%>`,`<%=event.getDescription()%>`,`<%=event.getDate()%>`,`<%=event.getLieu()%>`,`<%=event.getHour()%>`,`<%=event.getCategory().getId()%>`)">Update</button>
        <button class="inline-block bg-cl2-200 rounded-full px-3 py-1 text-sm font-semibold text-white-700 mr-2 mb-2" onclick="deleteEvent(`<%=event.getId()%>`)">Delete</button>
        <svg class="w-5 h-5 ml-2 -mr-1" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
      </a>
    </div>
  </div>
</section>




<%--Commente section--%>


<section class="bg-white dark:bg-gray-900 py-8 lg:py-16 antialiased">
  <div class="max-w-2xl mx-auto px-4">
    <div class="flex justify-between items-center mb-6">
      <h2 class="text-lg lg:text-2xl font-bold text-gray-900 dark:text-white">Discussion (20)</h2>
    </div>
    <form class="mb-6" action="${pageContext.request.contextPath}/Comment">
      <div class="py-2 px-4 mb-4 bg-white rounded-lg rounded-t-lg border border-gray-200 dark:bg-gray-800 dark:border-gray-700">
        <label for="comment" class="sr-only">Your comment</label>
        <textarea id="comment" rows="6"
                  class="px-0 w-full text-sm text-gray-900 border-0 focus:ring-0 focus:outline-none dark:text-white dark:placeholder-gray-400 dark:bg-gray-800"
                  placeholder="Write a comment..." required></textarea>
      </div>
      <button type="submit"
              class="inline-flex items-center py-2.5 px-4 text-xs font-medium text-center text-white bg-primary-700 rounded-lg focus:ring-4 focus:ring-primary-200 dark:focus:ring-primary-900 hover:bg-primary-800">
        Post comment
      </button>
    </form>
    <article class="p-6 mb-3 ml-6 lg:ml-12 text-base bg-white rounded-lg dark:bg-gray-900">
      <footer class="flex justify-between items-center mb-2">
        <div class="flex items-center">
          <p class="inline-flex items-center mr-3 text-sm text-gray-900 dark:text-white font-semibold"><img
                  class="mr-2 w-6 h-6 rounded-full"
                  src="https://flowbite.com/docs/images/people/profile-picture-5.jpg"
                  alt="Jese Leos">Jese Leos</p>
          <p class="text-sm text-gray-600 dark:text-gray-400"><time pubdate datetime="2022-02-12"
                                                                    title="February 12th, 2022">Feb. 12, 2022</time></p>
        </div>
        <button id="dropdownComment2Button" data-dropdown-toggle="dropdownComment2"
                class="inline-flex items-center p-2 text-sm font-medium text-center text-gray-500 dark:text-gray-40 bg-white rounded-lg hover:bg-gray-100 focus:ring-4 focus:outline-none focus:ring-gray-50 dark:bg-gray-900 dark:hover:bg-gray-700 dark:focus:ring-gray-600"
                type="button">
          <svg class="w-4 h-4" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 16 3">
            <path d="M2 0a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3Zm6.041 0a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM14 0a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3Z"/>
          </svg>
          <span class="sr-only">Comment settings</span>
        </button>
        <!-- Dropdown menu -->
        <div id="dropdownComment2"
             class="hidden z-10 w-36 bg-white rounded divide-y divide-gray-100 shadow dark:bg-gray-700 dark:divide-gray-600">
          <ul class="py-1 text-sm text-gray-700 dark:text-gray-200"
              aria-labelledby="dropdownMenuIconHorizontalButton">
            <li>
              <a href="#"
                 class="block py-2 px-4 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Edit</a>
            </li>
            <li>
              <a href="#"
                 class="block py-2 px-4 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Remove</a>
            </li>
            <li>
              <a href="#"
                 class="block py-2 px-4 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Report</a>
            </li>
          </ul>
        </div>
      </footer>
      <p class="text-gray-500 dark:text-gray-400">Much appreciated! Glad you liked it ☺️</p>
      <div class="flex items-center mt-4 space-x-4">
        <button type="button"
                class="flex items-center text-sm text-gray-500 hover:underline dark:text-gray-400 font-medium">
          <svg class="mr-1.5 w-3.5 h-3.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 18">
            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 5h5M5 8h2m6-3h2m-5 3h6m2-7H2a1 1 0 0 0-1 1v9a1 1 0 0 0 1 1h3v5l5-5h8a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1Z"/>
          </svg>
          Reply
        </button>
      </div>
    </article>
  </div>
</section>

<jsp:include page="/public/footer.jsp"/>

</body>
</html>
