<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Gentelella Alela! |</title>

<!-- Bootstrap -->
<link
	href="resources/Admincss/bootstrap.min.css?after"
	rel="stylesheet">
<!-- Font Awesome -->
<link
	href="resources/Admincss/font-awesome.min.css?after"
	rel="stylesheet">
<!-- iCheck -->
<link href="resources/Admincss/green.css?after"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link href="resources/Admincss/custom.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	/* 관심상품 삭제 */
	function delMem(memberId) {
		$.ajax({
			url : '/SosoMarket/MemDel.do?memberId=' + memberId,
			method : 'POST',
			data : {
				memberId : memberId
			},
			success : function(data) {
				alert('회원이 삭제되었습니다!')
				window.location.reload();
			},
			error : function(error) {
				console.error('Error', error);
			}
		});
	}
</script>
</head>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">
					<div class="navbar nav_title" style="border: 0;">
						<a href="index.html" class="site_title"><i class="fa fa-paw"></i>
							<span>관리자</span></a>
					</div>

					<div class="clearfix"></div>

					<br />

					<!-- sidebar menu -->
					<div id="sidebar-menu"
						class="main_menu_side hidden-print main_menu">
						<div class="menu_section">
							<ul class="nav side-menu">
								<li><a><i class="fa fa-home"></i> Home <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="/SosoMarket/AdminMain.do">관리자 메인</a></li>
									</ul></li>
								<li><a><i class="fa fa-table"></i> Tables <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="/SosoMarket/AdminMember.do">회원 조회</a></li>
										<li><a href="/SosoMarket/MemComm.do">회사생활 조회</a></li>
										<li><a href="/SosoMarket/AdminProdList.do">상품 조회</a></li>
									</ul></li>
								<li><a><i class="fa fa-home"></i> 메인 <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="/SosoMarket/HomeProd.do">메인</a></li>
									</ul></li>
							</ul>
						</div>
					</div>
					<!-- /sidebar menu -->

				</div>
			</div>

			<!-- page content -->
			<div class="right_col" role="main">
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>
								회원 테이블
							</h3>
						</div>

					</div>

					<div class="clearfix"></div>

					<div class="row" style="display: block;">
						<div class="col-md-4 col-sm-6  ">
							<div class="x_panel">
								<div class="x_title">
									<h2>
										상위 판매 회원
									</h2>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">

									<table class="table">
										<thead>
											<tr>
												<th>순위</th>
												<th>id</th>
												<th>판매갯수</th>
											</tr>
										</thead>
										<tbody>
										<% int count = 1; %>
										<c:forEach var="pvo" items="${plist }">
											<tr>
												<th scope="row"><%=count++ %></th>
												<td>${pvo.memberId }</td>
												<td>${pvo.memberCount }</td>
											</tr>
										</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>


						<div class="col-md-4 col-sm-6  ">
							<div class="x_panel">
								<div class="x_title">
									<h2>
										승진률 높은 회원
									</h2>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<table class="table table-hover">
										<thead>
											<tr>
												<th>순위</th>
												<th>id</th>
												<th>score</th>
											</tr>
										</thead>
										<tbody>
										<% int hcount = 1; %>
										<c:forEach var="hvo" items="${hlist }">
											<tr>
												<th scope="row"><%=hcount++ %></th>
												<td>${hvo.memberId }</td>
												<td>${hvo.ratingScore }</td>
											</tr>
										</c:forEach>
										</tbody>
									</table>

								</div>
							</div>
						</div>

						<!-- <div class="clearfix"></div> -->

						<div class="col-md-4 col-sm-6  ">
							<div class="x_panel">
								<div class="x_title">
									<h2>
										이달의 판매왕
									</h2>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<table class="table table-hover">
										<thead>
											<tr>
												<th>순위</th>
												<th>id</th>
												<th>판매갯수</th>
											</tr>
										</thead>
										<tbody>
										<% int mcount = 1; %>
										<c:forEach var="mvo" items="${mlist }">
											<tr>
												<th scope="row"><%=mcount++ %></th>
												<td>${mvo.memberId }</td>
												<td>${mvo.memberCount }</td>
											</tr>
										</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						
						<div class="clearfix"></div>
						<div class="col-md-12 col-sm-12  ">
							<div class="x_panel">
								<div class="x_title">
									<h2>
										회원 테이블
									</h2>
									<div class="clearfix"></div>
								</div>

								<div class="x_content">
									<div class="table-responsive">
										<table class="table table-striped jambo_table bulk_action">
											<thead>
												<tr class="headings">
													<th><input type="checkbox" id="check-all" class="flat">
													</th>
													<th class="column-title">id</th>
													<th class="column-title">phoneNumber</th>
													<th class="column-title">nickname</th>
													<th class="column-title">score</th>
													<th class="column-title">email</th>
													<th class="column-title">delete</th>
												</tr>
											</thead>

											<tbody>
												<c:forEach var="vo" items="${list }">
													<tr class="even pointer">
														<td class="a-center "><input type="checkbox"
															class="flat" name="table_records"></td>
														<td class=" ">${vo.memberId }</td>
														<td class=" ">${vo.phoneNumber }</td>
														<td class=" ">${vo.nickname }</td>
														<td class=" ">${vo.ratingScore }</td>
														<td class=" ">${vo.email }</td>
														<td><a class="close-link" onclick="delMem('${vo.memberId}')"><i class="fa fa-close"></i></a></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /page content -->

			<!-- footer content -->
			<footer>
				<!-- <div class="pull-right">
					Gentelella - Bootstrap Admin Template by <a
						href="https://colorlib.com">Colorlib</a>
				</div> -->
				<div class="clearfix"></div>
			</footer>
			<!-- /footer content -->
		</div>
	</div>

	<!-- jQuery -->
	<script src="resources/Adminjs/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="resources/Adminjs/bootstrap.bundle.min.js"></script>

	<!-- Custom Theme Scripts -->
	<script src="resources/Adminjs/custom.min.js"></script>
</body>
</html>
