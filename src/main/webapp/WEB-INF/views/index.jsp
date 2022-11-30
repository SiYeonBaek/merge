<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>Travel Tour Reservation System</title>
      <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
      <style>
         img{
            height:250px; 
            width:250px;
         }
         footer{
              position : relative;
              transform : translateY(-100%);
         }
      </style>
   </head>
   <body style="width: 1800px; margin: 0 auto; padding: 0;">
      <!-- Header -->
      <jsp:include page="include/header.jsp"/>
      
      <!-- Main -->
      <div style="width: 1100px; margin: 0 auto; ">
         <div style="width:1100px; height:300px; display: flex">
            <div style="border:1px solid blue; width:50%; float: left">
         
            </div>
            <div style="border:1px solid green; width:50%; float: left">
            </div>   
         </div>
         <div style="width:1100px;border:1px solid red; overflow:hidden;display: inline-block;">
            <div style="border:1px solid green; height: 10%;">
               <span style="font-size: 20px">넉넉한 자유시간, 여행 만족도 UP!</span>
            </div>
         <div style=" display: inline-block; flex-direction: row; flex-wrap: wrap; text-align: center; width: 1100px;">
            <c:forEach var="vo" items="${list }">
               <div style="float: left; width: 25%; margin: auto;">
               <div>
                  <img src="${pageContext.request.contextPath}/resources/img/${vo.pmainimg}" />
               </div>
               <div>${vo.pidx}${vo.pname}</div>
               <div>${vo.pprice }</div>
            </div>
            </c:forEach>
         </div>
      </div>
   </div>
      
   </body>
  	<!-- Footer -->
     <jsp:include page="include/footer.jsp"/>
</html>