<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
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
<!-- Datatables -->
<link
	href="resources/Admincss/dataTables.bootstrap.min.css?after"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link href="resources/Admincss/custom.min.css?after"
	rel="stylesheet">
<script>
	/* 게시글 삭제 */
	function delComm(postId) {
		$.ajax({
			url : '/SosoMarket/CommDel.do?postId=' + postId,
			method : 'POST',
			data : {
				postId : postId
			},
			success : function(data) {
				alert('게시글이 삭제되었습니다!')
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
						<div class="title_right">
							<div
								class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
							</div>
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="row">

						<div class="col-md-12 col-sm-12 ">
							<div class="x_panel">
								<div class="x_title">
									<h2>
										회사생활 전체 조회</small>
									</h2>
									<ul class="nav navbar-right panel_toolbox">
										<li><a class="collapse-link"><i
												class="fa fa-chevron-up"></i></a></li>
										<li class="dropdown"><a href="#" class="dropdown-toggle"
											data-toggle="dropdown" role="button" aria-expanded="false"><i
												class="fa fa-wrench"></i></a>
											<div class="dropdown-menu"
												aria-labelledby="dropdownMenuButton">
												<a class="dropdown-item" href="#">Settings 1</a> <a
													class="dropdown-item" href="#">Settings 2</a>
											</div></li>
										<li><a class="close-link"><i class="fa fa-close"></i></a>
										</li>
									</ul>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<div class="row">
										<div class="col-sm-12">
											<div class="card-box table-responsive">
												<table id="datatable-checkbox"
													class="table table-striped table-bordered bulk_action"
													style="width: 100%">
													<thead>
														<tr>
															<th>
															<th><input type="checkbox" id="check-all"></th>
															</th>
															<th>글 번호</th>
															<th>회원 아이디</th>
															<th>제목</th>
															<th>조회수</th>
															<th>작성일</th>
															<th>삭제</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="vo" items="${posts }">
															<tr>
																<td>
																<th><input type="checkbox" id="check-all"></th>
																</td>
																<td>${vo.postId }</td>
																<td>${vo.memberId }</td>
																<td>${vo.postTitle }</td>
																<td>${vo.postViews }</td>
																<td>${vo.generationDate }</td>
																<td><a class="close-link"
																	onclick="delComm('${vo.postId}')"><i
																		class="fa fa-close"></i></a></td>
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
				</div>
			</div>
			<!-- /page content -->
		</div>
	</div>

	<!-- jQuery -->
	<script src="resources/Adminjs/jquery.min.js?after"></script>
	<!-- Bootstrap -->
	<script
		src="resources/Adminjs/bootstrap.bundle.min.js?after"></script>
	<!-- FastClick -->
	<script
		src="resources/Adminjs/jquery.dataTables.min.js?after"></script>
	<script
		src="resources/Adminjs/dataTables.bootstrap.min.js?after"></script>

	<!-- Custom Theme Scripts -->
	<script src="resources/Adminjs/custom.min.js?after"></script>

</body>
</html>