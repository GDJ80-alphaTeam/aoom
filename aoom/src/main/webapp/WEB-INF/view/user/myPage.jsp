<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
	<div style="width: 1200px;margin: 0 auto ; text-align: center">
		<h1>마이페이지</h1>
		<div style="width: 100%;height: 300px;background-color: green;" onclick="window.location.href='/user/profile?userId=${sessionScope.userInfo.userId}'">
			
				프로필
			
		</div>
		<div style="width: 100%;height: 300px;" onclick="window.location.href='/user/userInfo'">
			<a> 
				개인정보
			</a>
		</div>
		<div style="width: 100%;height: 300px;">
			<a>
				결제및 대금수령
			</a>
		</div>
		
	</div>
</body>
</html>