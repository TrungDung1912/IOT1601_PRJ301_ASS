<%-- 
    Document   : report
    Created on : Nov 8, 2022, 9:20:53 PM
    Author     : ADMIN
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

    </head>
    <body>
        <div class="container-fluid">
            <div class="row col-md-12" style="border-bottom: 1px solid; padding: 10px;">
                <div class="col-md-6">
                    <h1>FPT University Academic Portal</h1>
                </div>
                <table class="col-md-6">
                    <tbody>
                        <tr>
                            <td style="padding-left: 200px;">
                                FAP mobile app (myFAP) is ready at
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-left: 200px;">
                                <a href="https://apps.apple.com/app/id1527723314">
                                    <img src="https://fap.fpt.edu.vn/images/app-store.svg" style="width: 120px; height: 40px" alt="apple store">
                                </a>
                            </td>
                            <td style="padding-right: 100px;">
                                <a href="https://fap.fpt.edu.vn/images/play-store.svg">
                                    <img src="https://fap.fpt.edu.vn/images/play-store.svg" style="width: 120px; height: 40px" alt="google play">
                                </a>
                            </td>
                        </tr>
                    </tbody>
                </table>    
            </div>

            <div class="col-md-6">

                <div >

                    <table>
                        <tbody>
                            <tr>
                                <td >
                                    <h3>Select a campus/program, term, course ...</h3>
                            </tr>
                        </tbody>
                    </table>

                    <table style="border: 1px solid; width: 100%">
                        <thead>
                            <tr style="background-color: aquamarine">       
                                <th style="border: 1px solid; padding-left: 10px">Campus</th>
                                <th style="border: 1px solid; padding-left: 10px">Term</th>
                                <th style="border: 1px solid; padding-left: 10px">Course</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td style="border: 1px solid; padding-left: 10px;">FU-HL</td>
                                <td style="border: 1px solid; padding-left: 10px;">
                                        <table>
                                            <c:forEach items="${requestScope.groups}" var="g">
                                                <tr>
                                                    <td><a href="report?stdid=${student.id}&gid=${g.id}&subid=${subject.id}">${g.sem}${g.year}</a></td>
                                                </tr>
                                            </c:forEach> 
                                        </table>
                                </td> 
                                <td style="border: 1px solid; padding-left: 10px;">
                                    <table>
                                        <c:forEach items="${requestScope.subjects}" var="sub">
                                            <tr>
                                                <td><a href="report?stdid=${student.id}&gid=${sub.group.id}&subid=${sub.id}">${sub.name}-0${sub.group.id}</a></td>
                                            </tr> 
                                        </c:forEach> 
                                    </table>       
                                </td>
                        </tbody>
                    </table>
                </div>
            </div>                    
            <br>
            <br>
            <div class="col-md-12">
                <h2 style="text-align: center;">Student: ${requestScope.student.name}</h2>
            </div>
            <br>
            <br>
            <div class="col-md-12" style="border: 2px solid">        
                <table style =" width: 100%;">
                    <thead style="background-color: #6B90DA;">
                        <tr>    
                            <th style="border: 1px solid; padding-left: 10px">No.</th>
                            <th style="border: 1px solid; padding-left: 10px">Date</th>
                            <th style="border: 1px solid; padding-left: 10px">Slot</th>
                            <th style="border: 1px solid; padding-left: 10px">Room</th>
                            <th style="border: 1px solid; padding-left: 10px">Lecturer</th>
                            <th style="border: 1px solid; padding-left: 10px">Group Name</th>
                            <th style="border: 1px solid; padding-left: 10px">Attendance Status</th>
                            <th style="border: 1px solid; padding-left: 10px">Lecturer's Comment</th>             
                        </tr>
                    </thead>
                    <%!int count1 = 0;%>
                    <%!int count2 = 0;%>
                    <tbody>
                        <c:forEach items="${requestScope.sessions}" var="ses">
                            <tr>
                                <td style="border: 1px solid; padding-left: 10px">${ses.index}</td>
                                <td style="border: 1px solid; padding-left: 10px">${helper.getDayNameofWeek(ses.date)} ${ses.date}</td>
                                <td style="border: 1px solid; padding-left: 10px">Time Slot ${ses.timeslot.id} - (${ses.timeslot.description})</td>
                                <td style="border: 1px solid; padding-left: 10px">${ses.room.name}</td>
                                <td style="border: 1px solid; padding-left: 10px">${ses.lecturer.name}</td>
                                <td style="border: 1px solid; padding-left: 10px">${ses.group.name}</td>
                                <c:if test="${ses.attanded}">
                                    <c:forEach items="${requestScope.attandances}" var="a" >  
                                        <c:if test="${ses.index eq a.session.index}">
                                           <c:if test="${a.present}">
                                                <td style="border: 1px solid; padding-left: 10px"><b style="color: green;">Present</b></td>           
                                            </c:if>
                                            <c:if test="${!a.present}">
                                                <td style="border: 1px solid; padding-left: 10px"><b style="color: red;">Absent</b></td>           
                                            </c:if>
                                            <td style="border: 1px solid; padding-left: 10px">${a.description}</td> 
                                        </c:if>
                                    </c:forEach> 
                                </c:if>
                                <c:if test="${!ses.attanded}">
                                    <td style="border: 1px solid; padding-left: 10px">Not yet</td> 
                                    <td style="border: 1px solid; padding-left: 10px"></td>
                                </c:if>
                            </c:forEach>
                        </tr>
                    </tbody>
                </table>  
            </div>
        </div>	 <!--K???t th??c container-fluid-->
        <br/>
        <br/>
        <div style="padding:10px; border-top: 1px solid;">
            <strong>More note / Ch?? th??ch th??m:</strong><br/>
            <font style="color: green">(Present):</font>had attended this activity / ???? tham gia ho???t ?????ng n??y<br/>
            <font style="color: red">(Absent):</font> had NOT attended this activity / ???? v???ng m???t bu???i n??y<br/>
            <font style="color: black">(Not yet):</font> had NOT record/ kh??ng th???y b???n ghi n??o
        </div>
        <br/>
        <br/>
        <div class="footer" style="padding:10px; border-top: 1px solid;">
            <strong>M???i g??p ??, th???c m???c xin li??n h???: </strong>
            <p>Ph??ng d???ch v??? sinh vi??n: Email: dichvusinhvien@fe.edu.vn. ??i???n tho???i: (024)7308.13.13</p>
        </div>
    </body>
</html>
