<%@	page	language="java"	contentType="text/html;	charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content=Type" content="text/html; charset=EUC-KR">
<title>BOARD MODIFY FORM</title>
</head>
<body>
<h1>BOARD MODIFY</h1> 
<%
if(request.getParameter("boardNo") == null) {
	response.sendRedirect(request.getContextPath()+"/board/boardList.jsp");
} else {
	int boardNo = Integer.parseInt(request.getParameter("boardNo"));
	System.out.println("boardModify param boardNo:"+boardNo);
		BoardDao boardDao = new BoardDao();
		Board board = boardDao.selectBoardByKey(boardNo);
%>
	<form	action="<%=request.getContextPath()%>/board/boardModifyAction.jsp"method="post">
		<div>no</div>
		<div><input name="boardNo" value="<%=board.getBoardNo()%>" type="text"readonly="readonly"/></div>
		<div>��й�ȣȮ��: </div>
		<div><input name="boardPw" id="boardPw" type="password"/></div>
		<div>������ : </div>
		<div><input	name="boardSubject" value="<%=board.getBoardSubject()%>"id="boardSubject" type="text"/></div>
		<div>���� : </div>
		<div><textarea	name="boardContent"	id="boardContent"	rows="5" cols="50"><%=board.getBoardContent()%></textarea></div>
		<div>�׸� : </div>
		<div><input	name="boardImg" value="<%=board.getBoardImg()%>"id="boardImg" type="text"/></div>
		<div>�̹������� : </div>
		<div><input	name="boardfileName" value="<%=board.getBoardfileName()%>"id="boardfileName" type="text"/></div>
		<div>
		
			<input type="submit" value="�ۼ���"/>
			<input type="reset" value="�ʱ�ȭ"/>
		</div>
	</form>
<% } %></body></html>