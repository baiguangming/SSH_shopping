<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updategoods.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="admin/css/general.css">
	<link rel="stylesheet" href="admin/ckeditor/samples/sample.css">
	<script type="text/javascript" src="admin/js/jquery-1.10.2.js"></script>
	<script type="text/javascript" src="admin/js/ajaxfileupload.js"></script>
	<script type="text/javascript" src="admin/js/fileupload.js"></script>
	<script type="text/javascript" src="admin/ckeditor/ckeditor.js"></script>
	<script type="text/javascript">
		function changeType(){
			var x = document.getElementById("choose").value;
			document.getElementById("goodstype").value = x;
		}
	</script>
	

  </head>
  
  <body>
  	<div class="top">更新商品</div>
	<div class="main">
    <form action="updateGoods" method="post">
    	<input type="hidden" name="id" value="${goods.id}"/><br/>
 		<table width="100%">
  			<tr class="trtd">
  				<td>商品名称</td>
  				<td><input name="goodsname" value="${goods.goodsname}"/></td>
  			</tr>
  			<tr class="trtd">
  				<td>商品类型</td>
  				<td>
  					<select id="choose" onchange="changeType()">
				  		<s:iterator value="goodsTypeList">
				  			<option value="<s:property value='id'/>"><s:property value="typename"/></option>
				  		</s:iterator>
  					</select>
  					<input id="goodstype" name="goodstype" value="${goods.goodstype}"/>
  				</td>
  			</tr>
  			<tr class="trtd">
  				<td>商品数量</td>
  				<td><input name="count" value="${goods.count}"/></td>
  			</tr>
  			<tr class="trtd">
  				<td>商品价格</td>
  				<td><input name="price" value="${goods.price}"/></td>
  			</tr>
  			<tr class="trtd">
  				<td>商品描述</td>
  				<td><textarea name="goodsdesc" class="ckeditor" rows="15">${goods.goodsdesc}</textarea></td>
  			</tr>
  			<tr class="trtd">
  				<td>上传商品图片</td>
  				<td>
  					<input id="fileToUpload" type="file" name="file"/>		
  					<input name="goodspic" id="picpath" value="${goods.goodspic}"/>
  					<button id="uploadSubmit"  onclick="return FileUpload('uploadSubmit')">上传</button>
  				</td>
  			</tr>
  			<tr class="trtd">
  				<td>查看图片</td>
  				<td><img id="viewImg" src="${goods.goodspic}"></td>
  			</tr>			
  			<tr class="trtd">
  				<td colspan="2" align="right"><input type="submit" value="更新"/></td>
  			</tr> 		
  		</table>
   	</form>
   	</div>
	<div class="footer"><jsp:include page="/admin/copyright.inc"/></div>
  </body>
</html>
