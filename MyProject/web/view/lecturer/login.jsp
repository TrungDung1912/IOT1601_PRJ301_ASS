<%-- 
    Document   : login
    Created on : Oct 24, 2022, 1:31:46 PM
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
        <div class="container-fluid" style="padding-left: 30px">
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
            <br/>
            <br/>
            <div class="row col-md-12" style="border: 1px solid">
                <div class="col-md-6">
                    <h4>News</h4>
                    <ul>
                        <li><a href="https://fap.fpt.edu.vn/CmsFAP/NewsDetail.aspx?id=22688">04/11/22 08:58 : V/v: Mở lớp Bis Block 5 học kỳ Fall 2022</a></li>
                        <li><a href="https://fap.fpt.edu.vn/CmsFAP/NewsDetail.aspx?id=22687">03/11/22 22:38 : Thông báo lịch thi lần 1 và lịch thi lần 2 các môn BDP302b, BDP303b học kỳ Fall 2022.</a></li>
                        <li><a href="https://fap.fpt.edu.vn/CmsFAP/NewsDetail.aspx?id=22665">01/11/22 22:15 : Thông báo điểm thi kết thúc học phần lần 2 các môn MLN111, JPD116, JPD316, JPD336, CQT201b học kỳ Fall 2022</a></li>
                        <li><a href="https://fap.fpt.edu.vn/CmsFAP/NewsDetail.aspx?id=22663">01/11/22 16:14 : HƯỚNG DẪN SINH VIÊN LÀM ĐƠN XIN CHUYỂN NGÀNH, CHUYỂN CƠ SỞ KỲ SPRING 2023.</a></li>
                        <li><a href="https://fap.fpt.edu.vn/CmsFAP/NewsDetail.aspx?id=22626">30/10/22 17:13 : Thông báo điểm thi kết thúc học phần lần 2 môn TRS501, TRS601 part 1 học kỳ Fall 2022</a></li>
                        <li><a href="https://fap.fpt.edu.vn/CmsFAP/NewsDetail.aspx?id=22618">29/10/22 06:50 : Thông báo lịch thi thực hành, lịch thi lần 1 và lịch thi lần 2 các môn học ở HK Fall 2022.</a></li>       
                    </ul>        
                </div>
                <div class="col-md-6" style="border: 1px solid">
                    <p style="background-color: orange; color: white; padding: 10px;"> Giảng viên Đại học FPT </p>
                    <br/>
                    <form action="login" method="POST">                  
                        <p style="padding-left: 100px">Username : <input type="text" name="username"/> </p> <br/>                 
                        <p style="padding-left: 100px">Password : <input type="password" name="password" /> </p>  <br/>   
                        <p style="padding-left: 150px"><input  type="submit" value="Login" /></p> 
                    </form>
                </div>
            </div>
        </div>
        <br/>
        <br/>
        <div class="footer" style="padding:10px; border-top: 1px solid;">
            <p style="padding-left: 500px">
                @Powered by
                <a href="https://daihoc.fpt.edu.vn/" style="font-size: 15px">FPT University</a>|
                <a href="https://cmshn.fpt.edu.vn/" style="font-size: 15px">CMS</a>|
                <a href="http://libol.fpt.edu.vn/" style="font-size: 15px">Library</a>|
                <a href="https://beecost.vn/fpt-books.html" style="font-size: 15px">Book</a>
            </p>
        </div>
    </body>
</html>
