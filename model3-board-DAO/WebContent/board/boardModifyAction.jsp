<%@	page	language="java"	contentType="text/html;	charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-Type" content="text/html; charset=EUC-KR">
<title>BOARD MODIFY ACTION</title>
</head>
<body>
<%
request.setCharacterEncoding("euc-kr");
if(request.getParameter("boardNo") == null || request.getParameter("boardPw") ==
null) {
	response.sendRedirect(request.getContextPath()+"/board/boardList.jsp");
} else {
	int boardNo = Integer.parseInt(request.getParameter("boardNo"));
	System.out.println("boardModifyAction param boardNo :"+boardNo);
	String boardPw = request.getParameter("boardPw");
	System.out.println("boardModifyAction param boardPw :"+boardPw);
	String boardSubject = request.getParameter("boardSubject");
	System.out.println("boardModifyAction param boardSubject :"+boardSubject);
	String boardContent = request.getParameter("boardContent");
	System.out.println("boardModifyAction param boardContent :"+boardContent);
	int boardImg = Integer.parseInt(request.getParameter("boardImg"));
	System.out.println("boardModifyAction param boardImg :"+boardImg);
	String boardfileName = request.getParameter("boardfileName");
	System.out.println("boardModifyAction param boardfileName :"+boardfileName);

	Board board = new Board();
	board.setBoardNo(boardNo);
	board.setBoardPw(boardPw);
	board.setBoardSubject(boardSubject);
	board.setBoardContent(boardContent);
	board.setBoardImg(boardImg);
	board.setBoardfileName(boardfileName);
	
	BoardDao boardDao = new BoardDao();
	boardDao.updateBoard(board);

response.sendRedirect(request.getContextPath()+"/board/boardView.jsp?boardNo="+boardNo);
}
%>
</body>
</html>