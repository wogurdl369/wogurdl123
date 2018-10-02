<%@	page	language="java"	contentType="text/html;	charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardView</title>
</head>
<body>
<h1>BOARD VIEW</h1>	
<%
if(request.getParameter("boardNo") == null) {
	response.sendRedirect(request.getContextPath()+"/board/boardList.jsp");
} else {
	int boardNo = Integer.parseInt(request.getParameter("boardNo"));
	BoardDao boardDao = new BoardDao();
	Board board = boardDao.selectBoardByKey(boardNo);
%>
		<div>board_no :</div>
		<div><%=board.getBoardNo()%></div>
		<div>board_subject :</div>
		<div><%=board.getBoardSubject()%></div>
		<div>board_content :</div>
		<div><%=board.getBoardContent()%></div>
		<div>board_user :</div>
		<div><%=board.getBoardUser()%></div>
		<div>board_img :</div>
		<div><%=board.getBoardImg()%></div>
		<div>board_fileName :</div>
		<div><%=board.getBoardfileName()%></div>
		<div>

<a href="<%=request.getContextPath()%>/board/boardModifyForm.jsp?boardNo=<%=board.getBoardNo()%>">����</a>
<a href="<%=request.getContextPath()%>/board/boardList.jsp?boardNo=<%=board.getBoardNo()%>">List</a>
<a href="<%=request.getContextPath()%>/board/boardRemoveForm.jsp?boardNo=<%=board.getBoardNo()%>">����</a>
	</div>
<% } %>
</body>
</html>
 