<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<c:set var="path" value="${pageContext.request.contextPath }"/>
 <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Home One || Witter Multipage Responsive Template</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
        <!-- Place favicon.ico in the root directory -->
        <!-- Google Fonts -->
		<link href='https://fonts.googleapis.com/css?family=Poppins:400,700,600,500,300' rel='stylesheet' type='text/css'>

		<!-- all css here -->
		<!-- bootstrap v3.3.6 css -->
        <link rel="stylesheet" href="${path }/css/bootstrap.min.css">
		<!-- animate css -->
        <link rel="stylesheet" href="${path }/css/animate.css">
		<!-- jquery-ui.min css -->
        <link rel="stylesheet" href="${path }/css/jquery-ui.min.css">
		<!-- meanmenu css -->
        <link rel="stylesheet" href="${path }/css/meanmenu.min.css">
		<!-- Font-Awesome css -->
        <link rel="stylesheet" href="${path }/css/font-awesome.min.css">
		<!-- pe-icon-7-stroke css -->
        <link rel="stylesheet" href="${path }/css/pe-icon-7-stroke.css">
		<!-- Flaticon css -->
        <link rel="stylesheet" href="${path }/css/flaticon.css">
		<!-- venobox css -->
        <link rel="stylesheet" href="${path }/venobox/venobox.css" type="text/css" media="screen" />
		<!-- nivo slider css -->
		<link rel="stylesheet" href="${path }/lib/css/nivo-slider.css" type="text/css" />
		<link rel="stylesheet" href="${path }/lib/css/preview.css" type="text/css" media="screen" />
		<!-- owl.carousel css -->
        <link rel="stylesheet" href="${path }/css/owl.carousel.css">
		<!-- style css -->
		<link rel="stylesheet" href="${path }/style.css">
		<!-- responsive css -->
        <link rel="stylesheet" href="${path }/css/responsive.css">
		<!-- modernizr css -->
        <script src="${path }/js/vendor/modernizr-2.8.3.min.js"></script>


<!--Header Area Start-->
<meta charset="utf-8">
<%
	String id = (String) session.getAttribute("id");
%>
<script type="text/javascript">
	function btnClick(path) {
		document.location.href = path;
	}
</script>
<style>
.header-right li {
	padding: 5px 4px;
}
</style>


<header>
	<div class="header-area">
		<div class="container">
			<div class="row">
				<div class="col-md-2 col-sm-6 col-xs-6">
					<div class="header-logo">
						<a href="${path }/BookController"> <img
							src="${path }/img/logo.PNG" alt="">
						</a>
					</div>
				</div>
				<div class="col-md-1 col-sm-6 visible-sm  col-xs-6">
					<div class="header-right">


						<ul>
							<li><a href="${path }/account.do"><i
									class="flaticon-people"></i></a></li>
							<li><button
									href="<%=request.getContextPath()%>/LogoutController"
									name="submitcreate" id="submitcreate" type="submit"
									class="flaticon-people">LOGOUT</li>
							<li class="shoping-cart"><a href="${path }/cart.do"> <i
									class="flaticon-shop"></i> <span>2</span>
							</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-9 col-sm-12 hidden-xs">
					<div class="mainmenu text-center">
						<nav>
							<ul id="nav">
								<li><a href="${path }/BookController">HOME</a></li>
								<li><a href="${path }/MembersSelectAllController">MEMBERS</a></li>
								<li><a href="${path }/contact.do">CONTACT</a></li>
							</ul>

						</nav>
					</div>
				</div>

				<div class="col-md-1 hidden-sm">
					<div class="header-right">
						<ul>
							<li><a href="${path }/my-account.do"><i
									class="flaticon-people"></i></a>
							<li class="shoping-cart"><a href="${path }/cart.do"> <i
									class="flaticon-shop"></i> <span>2</span>
							</a></li>
							<li>
								<%
									if (id != null) {
								%> <%=id%> 님 환영합니다.<br>
								<button name="submitcreate" id="submitcreate" type="submit"
									class="btn-default"
									onclick="btnClick('<%=request.getContextPath()%>/LogoutController');">
									<span> <i class="fa fa-user left"> LOGOUT</i>
									</span>
								</button> <%
 	} else {
 %> <%--                   <a href="<%=request.getContextPath() %>/LoginController"> --%>
								<button name="submitcreate" id="submitcreate" type="submit"
									class="btn-default"
									onclick="btnClick('<%=request.getContextPath()%>/LoginController');">
									<span> <i class="fa fa-user left"> LOGIN</i>
									</span>
								</button> <!--                   </a> --> <%
 	}
 %>
							</li>
						</ul>



						<%--                   <button href="<%=request.getContextPath() %>/LogoutController" name="submitcreate" --%>
						<!--                      id="submitcreate" type="submit" class="btn-default"> -->
						<!--                      <span> <i class="fa fa-user left"></i> LOGOUT -->
						<!--                      </span> -->

						<!--                   <form active="/LoginController" method="get"> -->

						<!--                   </form> -->


					</div>
				</div>
			</div>
		</div>
	</div>
	<!--Header Area End-->
</header>