<%-- 
    Document   : search
    Created on : Oct 8, 2022, 12:48:19 PM
    Author     : ADMIN
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="search" method="POST">
           Name: <input type="text" name="name" value="${param.name}"/> <br/>
           From: <input type="number" name="from" style="width: 40px" value="${param.from}"/>
           To: <input type="number" name="to" style="width: 40px" value="${param.to}"/><br/>
           <input type="submit" value="Search"/>
        </form>  
        <c:if test="${requestScope.students ne null}">
            <table border="1px" > 
                <tr> 
                    <td>Id</td>
                    <td>Member</td>
                    <td>Surname</td>
                    <td>Middlename</td>
                    <td>Givenname</td>
                </tr>
                <c:forEach items="${requestScope.students}" var="s">
                  <tr>
                    <td>${s.stid}</td>
                    <td>${s.stmember}</td>
                    <td>${s.stsurname}</td>
                    <td>${s.stmiddlename}</td>
                    <td>${s.stgivenname}</td>
                </tr>  
                </c:forEach>
            </table>
        </c:if>
    </body>
</html>
