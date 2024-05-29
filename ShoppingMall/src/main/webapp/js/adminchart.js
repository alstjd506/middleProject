document.addEventListener("DOMContentLoaded", function() {
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
                        max: 15000,
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

    // AJAX 요청을 사용하여 데이터를 가져옵니다
    fetch('adminBarChart.do') // API 엔드포인트를 입력하세요
        .then(response => response.json())
        .then(data => {
			console.log(data);
            // JSON 데이터에서 labels와 revenue를 추출합니다
            const labels = data.map(item => item.ChartDate);
            const revenue = data.map(item => item.chartValue);
			console.log("날짜값 : "+labels);
			console.log("벨류값 : "+revenue);
            // 차트에 데이터를 반영합니다
            myBarChart.data.labels = labels;
            myBarChart.data.datasets[0].data = revenue;
            myBarChart.update();
        })
        .catch(error => console.error('Error fetching data:', error));
});