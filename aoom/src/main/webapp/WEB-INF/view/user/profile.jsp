<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
	
	<jsp:include page="/WEB-INF/view/layout/navbarSub.jsp"></jsp:include>
		
	<div style="width: 1200px;margin: 0 auto; ">
		<h1>프로필</h1>	
		<div style="display: flex;">
			<div style="width: 30%; height:200px; background: gray; ">
			
				<div>
					후기개수:${host.cnt}
					가입기간:
					<c:choose>
					    <c:when test="${subPeriod.year == 0}">
					        <c:choose>
					            <c:when test="${subPeriod.month != 0}">
					                ${subPeriod.month}월
					            </c:when>
					            <c:otherwise>
					                신규 고객입니다!
					            </c:otherwise>
					        </c:choose>
					    </c:when>
					    <c:when test="${subPeriod.year != 0}">
					        ${subPeriod.year}년
					        <c:choose>
					            <c:when test="${subPeriod.leftMonth != 0}">
					                ${subPeriod.leftMonth}월
					            </c:when>
					        </c:choose>
					    </c:when>
					</c:choose>
					 
				</div>
			
			</div>
			<div style="width: 70%; background: green; display: flex;flex-wrap: wrap;">
			<c:forEach var="p" items="${profile}">
				<div style="width: 50%;  background: green;">
					${p.codeName} : ${p.content} 
				</div>
			</c:forEach>
			</div>
		</div>	
		<div style="width:50%; background-color: green;">
		test
		</div>
		
	</div>
	
	
</body>
</html>