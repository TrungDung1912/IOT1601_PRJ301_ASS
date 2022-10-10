<%-- 
    Document   : search
    Created on : Oct 8, 2022, 12:48:19 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="find" method="POST">
           Name: <input type="text" name="name" value="${param.name}"/> <br/>
           From: <input type="number" name="from" style="width: 40px" value="${param.from}"/>
           To: <input type="number" name="to" style="width: 40px" value="${param.to}"/><br/>
           <input type="submit" value="Search"/>
        </form>    
        <c:if test="${requestScope.students ne null}">
            <table border="1px"> 
                <tr> 
                    <td>Id</td>
                    <td>Name</td>
                </tr>
                <c:forEach items="${requestScope.students}" var="s">
                  <tr>
                    <td>${s.id}</td>
                    <td>${s.name}</td>
                </tr>  
                </c:forEach>
            </table>
        </c:if>
    </body>
</html>
