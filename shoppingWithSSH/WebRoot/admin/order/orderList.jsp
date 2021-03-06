<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'goodsList.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="admin/css/general.css" />

  </head>
 
  <body>
  	<div class="top">订单列表</div>
	<div class="main">
	<a href="queryOrderByStatus?keyword=1"><input type="button" value="已发货"/></a>
	<a href="queryOrderByStatus?keyword=0"><input type="button" value="未发货"/></a>
	<br/><br/>
  	<table border="1" cellpadding="3" cellspacing="0" width="100%">
  		<tr>
  			<th>id</th>
  			<th>订单号</th>
  			<th>买家id</th>
  			<th>交易时间</th>
  			<th>订单状态</th>
  			<th width="70px">操作</th>
  		</tr>
	    <s:iterator value="OrderList">    	
    		<tr class="trtd" height="80px">
    			<td><s:property value="id" /></td>
    			<td><s:property value="orderNum" /></td>
    			<td><s:property value="user.id" /></td>
    			<td><s:property value="buytime" /></td>
    			<td><s:property value="status" /></td>
    			<td>	
					<div>
						<c:if test='${status==0}'>
							<a href="dealOrder?order.id=<s:property value="id" />">发货</a>
						</c:if>
						<c:if test='${status==1}'>
							已发货<br/><s:property value="sendTime" />			
						</c:if>
					</div>
				</td>
    		</tr>	
	    </s:iterator>
    	<s:iterator value="page">    
        <tr height="80px">    
         	<td colspan="8" align="center" bgcolor="#ccc">    
	         	共<s:property value="allRow"/>条记录        
	         	共<s:property value="totalPage"/>页        
	         	当前第<s:property value="currentPage"/>页
         		<s:if test="%{currentPage == 1}">    
          			第一页  上一页    
         		</s:if>    
         		<!-- currentPage为当前页 -->    
		        <s:else>    
		           <a href="orderList?pageNo=1">第一页</a>    
		           <a href="orderList?pageNo=<s:property value="%{currentPage-1}"/>">上一页</a>    
		        </s:else>    
        
		        <s:if test="%{currentPage != totalPage}">    
			         <a href="orderList?pageNo=<s:property value="%{currentPage+1}"/>">下一页</a>    
			         <a href="orderList?pageNo=<s:property value="totalPage"/>">最后一页</a>    
		        </s:if>    
        
		        <s:else>    
		         	下一页  最后一页    
		        </s:else>    
         	</td>    
        </tr>    
	</s:iterator>
	</table>
	</div>
	<div class="footer"><jsp:include page="/admin/copyright.inc"/></div>    
  </body>
</html>
