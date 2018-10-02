<%@	page	language="java"	contentType="text/html;	charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html><head><meta http-equiv="content-Type" content="text/html, charset=EUC-KR"><title></title>
</head>
<body> 
<%
request.setCharacterEncoding("euc-kr");



if(request.getParameter("boardPw") == "" || request.getParameter("boardSubject") == "" || request.getParameter("boardContent") == "") {
	response.sendRedirect(request.getContextPath()+"/board/boardAddForm.jsp");
} else {
	String boardPw = request.getParameter("boardPw");
	System.out.println("param boardPw:" +boardPw);
	String boardSubject = request.getParameter("boardSubject");
	System.out.println("param boardSubject:" +boardSubject);
	String boardContent = request.getParameter("boardContent");
	System.out.println("param boardContent:" +boardContent);
	String boardUser = request.getParameter("boardUser");
	System.out.println("param boardUser:" +boardUser);
	int boardImg = Integer.parseInt(request.getParameter("boardImg"));
	System.out.println("param boardImg:" +boardImg);
	String boardfileName = request.getParameter("boardfileName");
	System.out.println("param boardfileName:" +boardfileName);
	
	Board board = new Board();
	board.setBoardPw(boardPw);
	board.setBoardSubject(boardSubject);
	board.setBoardContent(boardContent);
	board.setBoardUser(boardUser);
	board.setBoardImg(boardImg);
	board.setBoardfileName(boardfileName);
	
	BoardDao boardDao = new BoardDao();
	int rowCount = boardDao.insertBoard(board);
	
	response.sendRedirect(request.getContextPath()+"/board/boardList.jsp");
}
%>
</body>
</html>