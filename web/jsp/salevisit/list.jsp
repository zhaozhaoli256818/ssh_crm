﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<TITLE>访问记录列表</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="${pageContext.request.contextPath }/css/Style.css" type=text/css rel=stylesheet>
<LINK href="${pageContext.request.contextPath }/css/Manage.css" type=text/css
	rel=stylesheet>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/my.js"></script>

	<SCRIPT type="text/javascript">
		function changePage(pageNum) {
			//alert(pageNum);
			//1 将页码的值放入对应表单隐藏域中
			$("#currentPageInput").val(pageNum);
			//2 提交表单
			$("#pageForm").submit();
		};

		function changePageSize(pageSize) {
			//alert(pageSize);
			//1 将页码的值放入对应表单隐藏域中
			$("#pageSizeInput").val(pageSize);
			//2 提交表单
			$("#pageForm").submit();
		};
	</SCRIPT>
	<script type="text/javascript">
		$(function () {
			addSelect();
		});
	</script>
<META content="MSHTML 6.00.2900.3492" name=GENERATOR>
</HEAD>
<BODY>

		
		<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
			<TBODY>
				<TR>
					<TD width=15><IMG src="${pageContext.request.contextPath }/images/new_019.jpg"
						border=0></TD>
					<TD width="100%" background="${pageContext.request.contextPath }/images/new_020.jpg"
						height=20></TD>
					<TD width=15><IMG src="${pageContext.request.contextPath }/images/new_021.jpg"
						border=0></TD>
				</TR>
			</TBODY>
		</TABLE>
		<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
			<TBODY>
				<TR>
					<TD width=15 background="${pageContext.request.contextPath }/images/new_022.jpg"><IMG
						src="${pageContext.request.contextPath }/images/new_022.jpg" border=0></TD>
					<TD vAlign=top width="100%" bgColor=#ffffff>
						<TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
							<TR>
								<TD class=manageHead>当前位置：访问记录管理 &gt; 记录列表</TD>
							</TR>
							<TR>
								<TD height=2></TD>
							</TR>
						</TABLE>
						<TABLE borderColor=#cccccc cellSpacing=0 cellPadding=0
							width="100%" align=center border=0>
							<TBODY>
								<TR>
									<TD height=25>
										<FORM id="pageForm" name="pageForm"
											  action="${pageContext.request.contextPath }/SaleVisitAction_list"
											  method=post>
										<TABLE cellSpacing=0 cellPadding=2 border=0>
											<%--隐藏域--%>
											<input type="hidden" name="currentPage" id="currentPageInput">
											<input type="hidden" name="pageSize" id="pageSizeInput">
											<TBODY>
												<TR>

													<TD>客户名称：</TD>
													<TD>
														<INPUT class="hidden" id="cust_id" style="WIDTH: 80px" maxLength=50 name="customer.cust_id" value="${param['customer.cust_id']}">
														<INPUT class=textbox id="cust_name" style="WIDTH: 80px" maxLength=50 name="cust_name" value="${param.cust_name}">
														<input type="button" value="选择客户" onclick="window.open('${pageContext.request.contextPath}/CustomerAction_list?selected=true','','width=600,height=400');">
													</TD>
													<TD>业务员名称：</TD>
													<TD id="username">
													</TD>
													<TD><INPUT class=button id=sButton2 type="submit"
														value=" 筛选 " name=sButton2>
													</TD>
												</TR>
											</TBODY>
										</TABLE>
										</FORM>
									</TD>
								</TR>
							    
								<TR>
									<TD>
										<TABLE id=grid
											style="BORDER-TOP-WIDTH: 0px; FONT-WEIGHT: normal; BORDER-LEFT-WIDTH: 0px; BORDER-LEFT-COLOR: #cccccc; BORDER-BOTTOM-WIDTH: 0px; BORDER-BOTTOM-COLOR: #cccccc; WIDTH: 100%; BORDER-TOP-COLOR: #cccccc; FONT-STYLE: normal; BACKGROUND-COLOR: #cccccc; BORDER-RIGHT-WIDTH: 0px; TEXT-DECORATION: none; BORDER-RIGHT-COLOR: #cccccc"
											cellSpacing=1 cellPadding=2 rules=all border=0>
											<TBODY>
												<TR
													style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none">
													<TD>业务员名称</TD>
													<TD>客户名称</TD>
													<TD>访问时间</TD>
													<TD>访问人</TD>
													<TD>访问地址</TD>
													<TD>访问详情</TD>
													<TD>下次访问时间</TD>
													<TD>操作</TD>
												</TR>
												<c:forEach items="${pageBean.list }" var="salevisit">
												<TR
													style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
													<TD>${salevisit.user.user_name}</TD>
													<TD>${salevisit.customer.cust_name}</TD>
													<TD>${salevisit.visit_time_s}</TD>
													<TD>${salevisit.visit_interviewee}</TD>
													<TD>${salevisit.visit_addr}</TD>
													<TD>${salevisit.visit_detail}</TD>
													<TD>${salevisit.visit_nexttime_s}</TD>
													<TD>
													<a href="${pageContext.request.contextPath }/SaleVisitAction_toEdit?visit_id=${salevisit.visit_id}">修改</a>
													&nbsp;&nbsp;
													<a href="${pageContext.request.contextPath }/linkmanServlet?method=delete&lkmId=${linkman.lkm_id}">删除</a>
													</TD>
												</TR>
												
												</c:forEach>

											</TBODY>
										</TABLE>
									</TD>
								</TR>
								
								<TR>
									<TD><SPAN id=pagelink>
											<DIV
													style="LINE-HEIGHT: 20px; HEIGHT: 20px; TEXT-ALIGN: right">
												共[<B>${pageBean.totalCount}</B>]条记录,[<B>${pageBean.totalPage}</B>]页
												,每页显示
												<select name="pageSize"
														onchange="changePageSize($('#pageSizeSelect option:selected').val())"
														id="pageSizeSelect">

												<option value="3"
														<c:if test="${pageSize==3 }">selected</c:if>>3</option>
												<option value="5"
														<c:if test="${pageSize==5 }">selected</c:if>>5</option>
												</select>
												条
												[<A href="javascript:void(0)"
													onclick="changePage(${pageBean.currentPage-1})">前一页</A>]
												<B>${pageBean.currentPage}</B>
												[<A href="javascript:void(0)"
													onclick="changePage(${pageBean.currentPage+1})">后一页</A>]
												到
												<input type="text" size="3" id="page" name="page"
													   value="${pageBean.currentPage}"/>
												页

												<input type="button" value="Go" onclick="changePage($('#page').val())"/>
											</DIV>
									</SPAN></TD>
								</TR>
							</TBODY>
						</TABLE>
					</TD>
					<TD width=15 background="${pageContext.request.contextPath }/images/new_023.jpg"><IMG
						src="${pageContext.request.contextPath }/images/new_023.jpg" border=0></TD>
				</TR>
			</TBODY>
		</TABLE>
		<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
			<TBODY>
				<TR>
					<TD width=15><IMG src="${pageContext.request.contextPath }/images/new_024.jpg"
						border=0></TD>
					<TD align=middle width="100%"
						background="${pageContext.request.contextPath }/images/new_025.jpg" height=15></TD>
					<TD width=15><IMG src="${pageContext.request.contextPath }/images/new_026.jpg"
						border=0></TD>
				</TR>
			</TBODY>
		</TABLE>
	</FORM>
</BODY>
</HTML>
