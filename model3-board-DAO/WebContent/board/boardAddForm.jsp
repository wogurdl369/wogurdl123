<%@	page	language="java"	contentType="text/html;	charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խ��� �۾���</title>
<!--  //JQuery UI CSS���� -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<!--  //JQuery �⺻ js���� -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<!--  //JQuery UI ���̺귯�� js���� -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>


<script type="text/javascript">
    $(function() {
        $("#boardreg").datepicker({
            dateFormat : "yy-mm-dd",
            monthNamesShort : ['1��', '2��', '3��', '4��', '5��', '6��', '7��', '8��', '9��', '10��', '11��', '12��'],
            dayNamesMin : ['��', '��', 'ȭ', '��', '��', '��', '��'],
            changeMonth : true,
            changeYear : true,
            yearRange : "c-70:c+70",
            showMonthAfterYear : true
        });
    });
</script>

</head>
<body>
<h1>�Խ��� �۾���</h1>
<form action="<%=request.getContextPath()%>/board/boardAddAction.jsp"method="post">
	<div>��й�ȣ : </div>
	<div><input name="boardPw" id="boardPw" type="password"/></div>
	<div>������ : </div>
	<div><input name="boardSubject" id="boardSubject" type="text"/></div>
	<div>���� : </div>
	<div><textarea	name="boardContent"	id="boardContent"	rows="5" cols="50"></textarea></div>
	<div>�۾��� : </div>
	<div><input name="boardUser" id="boardUser" type="text"/></div>
	<div>���� : </div>
	<div><input name="boardreg" id="boardreg" type="text"/></div>
	<div>�׸� : </div>
	<div><input name="boardImg" id="boardImg" type="text"/></div>
	<div>�̹������� : </div>
	<div><input name="boardfileName" id="boardfileName" type="text"/></div>
	<div>
		<input type="submit" value="���Է�"/>
		<input type="reset" value="�ʱ�ȭ"/>
	</div>
</form>
</body>
</html>