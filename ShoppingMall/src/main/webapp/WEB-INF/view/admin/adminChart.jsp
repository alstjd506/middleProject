<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Charts - SB Admin</title>
<link href="css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
</head>

<div class="container-fluid px-4">
	<div class="container-fluid px-4">
		<h1 class="mt-4">매출차트</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="admin.do">관리자홈으로</a></li>
			<li class="breadcrumb-item active">Charts</li>
		</ol>
		<div class="card mb-4">
			<div class="card-body">
				알ㄹ라라라라라라ㅏㅇ숄라라라라라라라이리이러이러이ㅏ강아지 귀엽지 알라라라나아나안ㅁ암ㄴ이ㅏ만아아아아아아아나나나나ㅏㄴ다다다다나나나나ㅣㅌㄴ티티티
				ㅇ낟ㅈ안녕난영난ㄴ연ㅇ나여 넌나를 발<a
					target="_blank" href="main.do">메인으로</a> .
			</div>
		</div>
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-chart-area me-1"></i> 하루매출
			</div>
			<div class="card-body">
				<canvas id="myAreaChart" width="100%" height="30"></canvas>
			</div>
			<div class="card-footer small text-muted">Updated yesterday at
				11:59 PM</div>
		</div>
		<div class="row">
			<div class="col-lg-6">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-chart-bar me-1"></i> 주간매출
					</div>
					<div class="card-body">
						<canvas id="myBarChart" width="100%" height="50"></canvas>
					</div>
					<div class="card-footer small text-muted">Updated yesterday
						at 11:59 PM</div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-chart-pie me-1"></i> 카테고리별매출
					</div>
					<div class="card-body">
						<canvas id="myPieChart" width="100%" height="50"></canvas>
					</div>
					<div class="card-footer small text-muted">Updated yesterday
						at 11:59 PM</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
	crossorigin="anonymous"></script>
<script src="js/adminchart.js">
	
</script>