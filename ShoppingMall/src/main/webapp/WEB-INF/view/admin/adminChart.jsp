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
				📊 매출 현황 분석 최신 매출 데이터를 한눈에 파악하세요. 트렌드를 분석하고 성장을 예측해보세요.<a
					target="_blank" href="main.do">메인으로</a> .
			</div>
		</div>
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-chart-area me-1"></i> 시간대별매출
			</div>
			<div class="card-body">
				<canvas id="myAreaChart" width="100%" height="30"></canvas>
			</div>
			<div class="card-footer small text-muted">매시간대별 매출을 표현합니다</div>
		</div>
		<div class="row">
			<div class="col-lg-6">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-chart-bar me-1"></i> 지난주매출
					</div>
					<div class="card-body">
						<canvas id="myBarChart" width="100%" height="50"></canvas>
					</div>
					<div class="card-footer small text-muted">전날을 기준으로 7일 동안의 매출을
						표현합니다</div>
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
					<div class="card-footer small text-muted">각 카테고리별 총매출을 비교합니다</div>
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