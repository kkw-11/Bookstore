<%@page import="com.book.member.vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 내꺼 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Members Page</title>

<script type="text/javascript">

function updateMember(id){
	
	$.ajax({
		url: "${path}/MemberSelectOneController",
		type: "post",
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		datatype:"json",
		data: {"id" : id},
		error:function(request,status,error){
	        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
	    },

		success: function(data){
			var wrap = "<form action='${path}/MemberUpdateController' method='post' name='update_form'></form>";
// 			var $form="<form action='${path}/MemberUpdateController' method='post' name='update_form'></form>";
// 			var $form = $('<form></form>');
// 		     $form.attr('action', '${path}/MemberUpdateController');
// 		     $form.attr('method', 'post');
// 		     $form.appendTo("#row_"+data.id);

			var tag =
				"<input type='hidden' name='id' value='"+data.id+"'>"+
			    "<div class='cell_m' id='id'>"+data.id+"</div>"+
			    "<div class='cell_m' id='pwd'><input type='text' name='pwd' value='"+data.pwd+"'></div>"+
			    "<div class='cell_m' id='email'><input type='text' name='email' value='"+data.email+"'></div>"+
			    "<div class='cell_m' id='gender'><input type='radio' id='gender_m' name='gender' value='M'>남"+
			    "<input type='radio' id='gender_f' name='gender' value='F'>여"+
			    "</div>"+
			    "<div class='cell_m' id='pwd'><input type='text' name='phonenum' value='"+data.phonenum+"'></div>"+
			    "<div class='cell_m' id='joindate'>"+data.joindate+"</div>"+
			    "<div class='cell_m' id='joindate'>"+
			    "<a href='#' onclick='updateComplete();'>수정완료</a> / "+
			    "<a href='${path}/MembersSelectAllController'>취소</a>" +
		        "</div>";
		    $(".table_m").wrap(wrap);		    
			$("#row_m_"+data.id).html(tag);	
			
// 			alert("aaa");
// 			$form.html(tag)
			
			if(data.gender=="M"){
				$("#row_m_"+id+" #gender_m").attr('checked',true);
				$("#row_m_"+id+" #gender_f").attr('checked',false);
			}else{
				$("#row_m_"+id+" #gender_m").attr('checked',false);
				$("#row_m_"+id+" #gender_f").attr('checked',true);
				
			}
			
		}
		
	});
}
function updateComplete(){
	document.update_form.submit();
}

function deleteMember(id){
	document.location.href=""
	
}
</script>

</head>
<body>
<%@ include file="head.jsp" %>
<%@ include file="../includes/header.jsp" %>
<section>
  <div class="table_wrapper_m">
  <div class="table_m">
  
<!--   //	ID	VARCHAR2(30 BYTE) -->
<!-- //	PWD	VARCHAR2(30 BYTE) -->
<!-- //	EMAIL	VARCHAR2(50 BYTE) -->
<!-- //	GENDER	CHAR(1 BYTE) -->
<!-- //	JOINDATE	DATE -->
<!-- //	PHONENUM	VARCHAR2(20 BYTE) -->

    <div class="row_m header_m">
      <div class="cell_m">
        ID
      </div>
      <div class="cell_m">
        PWD
      </div>
      <div class="cell_m">
        EMAIL
      </div>
      <div class="cell_m">
        GENDER
      </div>
      <div class="cell_m">
        PHONENUM
      </div>
      <div class="cell_m">
        JOINDATE
      </div>
      <div class="cell_m">
        UPDATA/DELETE
      </div>
    </div>
   <%-- <%
    	ArrayList<MemberVO> mlist = (ArrayList<MemberVO>)request.getAttribute("mlist");
    	for(int i=0; i < mlist.size() ; i++){
    		
    	
    %> --%>
    <jsp:useBean id="member" class="com.book.member.vo.MemberVO"/>
    <c:forEach items="${mlist }" var="mvo">
    <div class="row_m" id="row_m_${mvo.id }">
      <div class="cell_m" id="id">
         ${mvo.id }
      </div>
      <div class="cell_m" id="pwd">
         ${mvo.pwd }
      </div>
      <div class="cell_m" id="email">
         ${mvo.email }
      </div>
      <div class="cell_m" id="gender">
         ${mvo.gender }
      </div>
      <div class="cell_m" id="phonenum">
        ${mvo.phonenum }
      </div>
      <div class="cell_m" id="joindate">
         ${mvo.joindate}
      </div>
      <div class="cell_m" >
      	<c:if test="${mvo.id ne 'admin' }">
         <a href="#" onclick="updateMember('${mvo.id }');">수정</a> / 
         <a href="${path }/MemberDeleteController?id=${mvo.id }">삭제</a>
        </c:if>
      </div>
    </div>
    </c:forEach>
  	</div>
  </div>
 </section>
 		<%@ include file= "../includes/footer.jsp" %>
 
<%--  <%@ include file="../includes/footer.jsp"%> --%>
 
</body>
</html>