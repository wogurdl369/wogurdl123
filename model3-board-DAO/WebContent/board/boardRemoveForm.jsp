<%@	page	language="java"	contentType="text/html;	charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>BOARD REMOVE FORM</title>
</head>
<body>
<%
if(request.getParameter("boardNo") == null) {
	response.sendRedirect(request.getContextPath()+"/board/boardList.jsp");
} else {
%>
	<form	action="<%=request.getContextPath()%>/board/boardRemoveAction.jsp"
method="post">
	<input	name="boardNo"	value="<%=request.getParameter("boardNo")%>"
type="hidden"/>
	<div>��й�ȣȮ�� :</div>
	<div><input name="boardPw" type="password"></div>
	<div>
		<input type="submit" value="����"/>
		<input type="reset" value="�ʱ�ȭ"/>
	</div>
	</form>
<%
}
%>
</body>
</html>