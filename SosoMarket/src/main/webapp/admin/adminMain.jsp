<%@page import="com.google.gson.JsonArray"%>
<%@page import="com.tbk.prj.admin.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap -->
<link
	href="resources/Admincss/bootstrap.min.css?after"
	rel="stylesheet">
<!-- Font Awesome -->
<link
	href="resources/Admincss/font-awesome.min.css?after"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link href="resources/Admincss/custom.min.css?after"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<!-- 구글 차트 -->
<script>
    google.charts.load('current', { packages: ['corechart'] });
</script>
<script>
    window.onload = function () {
        google.charts.setOnLoadCallback(function () {
            setInterval(function () {
                fetch('/SosoMarket/Chart.do')
                    .then(response => response.json())
                    .then(data => {
                        console.log(data); // 데이터 확인용 로그
                        var chartData = [['카테고리', '수량']]; // 열 헤더 설정

                        // 각 배열의 첫 번째 값을 카테고리 이름으로, 두 번째 값을 수량으로 설정
                        data.forEach(item => {
                            chartData.push([item[0], item[1]]);
                        });

                        // 차트를 그리는 함수 호출
                        drawCategoryChart(chartData);
                    })
                    .catch(error => console.error('Error fetching data:', error));
            }, 30000);
        });

        function drawCategoryChart(dataArray) {
            var dataTable = google.visualization.arrayToDataTable(dataArray);

            var options = {
                pieHole: 0.4, // 도넛 차트 모양 조절
                width: 700,
                height: 400,
                colors: ['#F08080', '#E9967A', '#FFDAB9', '#FAFAD2',
                    	'#BDB76B', '#ADFF2F', '#9ACD32', '#3CB371',
                    	'#008B8B', '#4682B4', '#AFEEEE', '#00CED1',
                    	'#1E90FF', '#4169E1', '#483D8B', '#9370DB',
                    	'#DDA0DD'],
                chartArea: { left: 0, top: 0, width: '100%', height: '100%' }, // 레이아웃 설정
                legend: 'none' // 레전드(열 이름) 없애기
            };

            var objDiv = document.getElementById('column_chart_div1');
            var chart = new google.visualization.PieChart(objDiv);

            chart.draw(dataTable, options);
        }
    };
</script>
</head>
<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">
					<div class="navbar nav_title" style="border: 0;">
						<a class="site_title"><i class="fa fa-paw"></i> <span>관리자</span></a>
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
					<div class="row" style="display: inline-block;">
						<div class="top_tiles">
							<div class="animated flipInY col-lg-4 col-md-4 col-sm-6 ">
								<div class="tile-stats">
									<div class="icon">
										<i class="fa fa-search"></i>
									</div>
									<div class="count">${mvo.memberCount}</div>
									<h3>전체 회원</h3>
								</div>
							</div>
							<div class="animated flipInY col-lg-4 col-md-4 col-sm-6 ">
								<div class="tile-stats">
									<div class="icon">
										<i class="fa fa-comments-o"></i>
									</div>
									<div class="count">${pvo.prodCount}</div>
									<h3>전체 상품</h3>
								</div>
							</div>
							<div class="animated flipInY col-lg-4 col-md-4 col-sm-6 ">
								<div class="tile-stats">
									<div class="icon">
										<i class="fa fa-sort-amount-desc"></i>
									</div>
									<div class="count">${pdvo.prodCount }</div>
									<h3>거래완료</h3>
								</div>
							</div>
							<div class="animated flipInY col-lg-4 col-md-4 col-sm-6 ">
								<div class="tile-stats">
									<div class="icon">
										<i class="fa fa-check-square-o"></i>
									</div>
									<div class="count">${ptvo.todayCount }</div>
									<h3>today</h3>
								</div>
							</div>
						</div>
					</div>

					<!-- <div class="row">
						<div class="col-md-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>
										Transaction Summary <small>Weekly progress</small>
									</h2>
									<div class="filter">
										<div id="reportrange" class="pull-right"
											style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc">
											<i class="glyphicon glyphicon-calendar fa fa-calendar"></i> <span>December
												30, 2014 - January 28, 2015</span> <b class="caret"></b>
										</div>
									</div>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<div class="col-md-9 col-sm-12 ">
										<div class="demo-container" style="height: 280px">
											<div id="chart_plot_02" class="demo-placeholder"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div> -->
				</div>
				<div class="col-md-6 col-sm-6  ">
					<div class="x_panel">
						<div class="x_title">
							<h2>카테고리별 비율</h2>
							<div class="clearfix"></div>
						</div>
						<!-- 카테고리 차트 들어오는 div -->
						<div id="column_chart_div1"></div>
					</div>
				</div>

			</div>
			<!-- /page content -->

		</div>
	</div>

	<!-- Bootstrap -->
	<script
		src="resources/Adminjs/bootstrap.bundle.min.js?after"></script>
	<!-- Custom Theme Scripts -->
	<script src="resources/Adminjs/custom.min.js?after"></script>
</body>
</html>