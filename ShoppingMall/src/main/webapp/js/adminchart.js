Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

document.addEventListener("DOMContentLoaded", function() {
	// Area Chart Example
	var ctxArea = document.getElementById("myAreaChart").getContext("2d");
	var myLineChart = new Chart(ctxArea, {
		type: 'line',
		data: {
			datasets: [{
				data: [],
				backgroundColor: "rgba(0, 123, 255, 0.2)", // 파란색 배경색 (불투명도 0.2)
				borderColor: "rgba(0, 123, 255, 1)", // 파란색 테두리 색
				borderWidth: 2
			}]
		},
		options: {
			scales: {
				xAxes: [{
					time: {
						unit: 'date'
					},
					gridLines: {
						display: false
					},
					ticks: {
						maxTicksLimit: 7
					}
				}],
				yAxes: [{
					ticks: {
						min: 0,
						max: 500000,
						maxTicksLimit: 5
					},
					gridLines: {
						color: "rgba(0,0,0,250)",
					}
				}],
			},
			legend: {
				display: false
			}
		}
	});

	// Bar Chart Example
	var ctxBar = document.getElementById("myBarChart").getContext("2d");
	var myBarChart = new Chart(ctxBar, {
		type: 'bar',
		data: {
			labels: [],
			datasets: [{
				label: "Revenue",
				backgroundColor: "rgba(2,117,216,1)",
				borderColor: "rgba(2,117,216,1)",
				data: [],
			}],
		},
		options: {
			scales: {
				xAxes: [{
					time: {
						unit: 'day'
					},
					gridLines: {
						display: false
					},
					ticks: {
						maxTicksLimit: 7,
						fontSize: 10,
						autoSkip: false,
						maxRotation: 90,
						minRotation: 45
					},
					scaleLabel: {
						display: true,
						labelString: 'Date'
					}
				}],
				yAxes: [{
					ticks: {
						min: 0,
						max: 100000,
						maxTicksLimit: 5
					},
					gridLines: {
						display: true
					}
				}],
			},
			legend: {
				display: false
			}
		}
	});

	// Pie Chart Example
	var ctxPie = document.getElementById("myPieChart").getContext("2d");
	var myPieChart = new Chart(ctxPie, {
		type: 'pie',
		data: {
			labels: ['사료', '간식', '건강관리', '배변용품', '장난감', '미용/목욕'],
			datasets: [{
				data: [],
				backgroundColor: ['#007bff', '#dc3545', '#ffc107', '#28a745', '#f9c6cf', '#8b00ff'],
			}],
		},
	});

	fetch('adminTimeChart.do')
		.then(response => response.json())
		.then(data => {
			console.log("time:" + data);
			const labels = data.map(item => item.chartName);
			const revenue = data.map(item => item.chartValue);
			console.log("time:" + labels);
			myLineChart.data.labels = labels;
			myLineChart.data.datasets[0].data = revenue;
			myLineChart.update();
		})
		.catch(error => console.error('Error fetching data:', error));


	// Fetch data for Bar Chart
	fetch('adminBarChart.do')
		.then(response => response.json())
		.then(data => {
			console.log(data);
			// JSON 데이터에서 labels와 revenue를 추출합니다
			const labels = data.map(item => formatDate(item.chartDate));
			const revenue = data.map(item => item.chartValue);
			console.log("날짜값 : " + labels);
			console.log("벨류값 : " + revenue);
			// 차트에 데이터를 반영합니다
			myBarChart.data.labels = labels;
			myBarChart.data.datasets[0].data = revenue;
			myBarChart.update();
		})
		.catch(error => console.error('Error fetching data:', error));

	// 날짜 형식을 "MM-DD"로 변환하는 함수
	function formatDate(dateString) {
		// 물음표 제거 및 공백 제거
		dateString = dateString.replace('?', '').trim();

		// "May 29, 2024, 12:00:00AM" 형식을 "May 29, 2024"로 변환
		const dateParts = dateString.split(',');
		if (dateParts.length > 1) {
			dateString = dateParts[0] + ',' + dateParts[1].split(' ')[0];
		}

		const date = new Date(dateString);
		if (isNaN(date)) {
			console.error('Invalid date:', dateString);
			return 'Invalid Date'; // 혹은 빈 문자열 등 원하는 기본값으로 대체
		}
		const month = String(date.getMonth() + 1).padStart(2, '0');
		const day = String(date.getDate()).padStart(2, '0');
		return `${month}-${day}`;
	}

	// Fetch data for Pie Chart
	fetch('adminPieChart.do') // API 엔드포인트를 입력하세요
		.then(response => response.json())
		.then(data => {
			console.log(data);
			// JSON 데이터에서 labels와 revenue를 추출합니다
			let labels = data.map(item => item.chartName);
			console.log(labels);
			if (labels == '1') {
				labels = '사료';
			} else if (labels == 2) {
				labels = "간식";
			}
			const revenue = data.map(item => item.chartValue);
			console.log("차트 이름값 : " + labels);
			console.log("차트 값 : " + revenue);
			// 차트에 데이터를 반영합니다
			// myPieChart.data.labels = labels;
			myPieChart.data.datasets[0].data = revenue;
			myPieChart.update();
		})
		.catch(error => console.error('Error fetching data:', error));
});