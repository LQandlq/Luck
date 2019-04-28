<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${path}/pic/uploads" method="post" enctype="multipart/form-data">
	<input type="file" name="files"/>
	<input type="text" name="description" value="${pic.description }">
	 <select>
      <option>1</option>
      <option>2</option>
      <option>3</option>
      <option>4</option>
      <option>5</option>
    </select>
	<input type="submit" value="提交"/>
	<img alt="" src="\picture\123@qq.com\upload\1.jpg">
</form>
</body>
</html>