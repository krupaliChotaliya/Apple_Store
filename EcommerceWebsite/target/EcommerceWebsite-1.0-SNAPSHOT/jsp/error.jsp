<%@page import="java.lang.Exception"%>
<%@page isErrorPage="true" %>
<%@page isELIgnored="false" %>
<!doctype html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
    </head>
    <body>
      
        <main class="grid min-h-full place-items-center bg-white px-6 py-24 sm:py-32 lg:px-8">
            <div class="text-center">
                <p class="text-base font-semibold text-indigo-600">404</p>
                <h1 class="mt-4 text-3xl font-bold tracking-tight text-gray-900 sm:text-5xl">Page not Found</h1>
                <p class="mt-6 text-base leading-7 text-gray-600">Sorry, we could not find the page you are looking for.</p>
                <div class="mt-10 flex items-center justify-center gap-x-6">
                    <a href="${pageContext.request.contextPath}/jsp/home.jsp" class="rounded-md bg-indigo-600 px-3.5 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Go back home</a>
                    <a href="#" class="text-sm font-semibold text-gray-900">Contact support <span aria-hidden="true">&rarr;</span></a>
                </div>
            </div>
        </main>

        <%
            System.out.println("[error.jsp]" + exception);
        %>
    </body>
</html>
