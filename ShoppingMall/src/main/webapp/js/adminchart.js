  Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
        Chart.defaults.global.defaultFontColor = '#292b2c';

        document.addEventListener("DOMContentLoaded", function() {
            // Area Chart Example
            var ctxArea = document.getElementById("myAreaChart").getContext("2d");
            var myLineChart = new Chart(ctxArea, {
                type: 'line',
                data: {
                    labels: ["Mar 1", "Mar 2", "Mar 3", "Mar 4", "Mar 5", "Mar 6", "Mar 7", "Mar 8", "Mar 9", "Mar 10", "Mar 11", "Mar 12", "Mar 13"],
                    datasets: [{
                        label: "Sessions",
                        lineTension: 0.3,
                        backgroundColor: "rgba(2,117,216,0.2)",
                        borderColor: "rgba(2,117,216,1)",
                        pointRadius: 5,
                        pointBackgroundColor: "rgba(2,117,216,1)",
                        pointBorderColor: "rgba(255,255,255,0.8)",
                        pointHoverRadius: 5,
                        pointHoverBackgroundColor: "rgba(2,117,216,1)",
                        pointHitRadius: 50,
                        pointBorderWidth: 2,
                        data: [10000, 30162, 26263, 18394, 18287, 28682, 31274, 33259, 25849, 24159, 32651, 31984, 38451],
                    }],
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
                                max: 40000,
                                maxTicksLimit: 5
                            },
                            gridLines: {
                                color: "rgba(0, 0, 0, .125)",
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

            // Pie Chart Example
            var ctxPie = document.getElementById("myPieChart").getContext("2d");
            var myPieChart = new Chart(ctxPie, {
                type: 'pie',
                data: {
                    labels: ['사료','간식','건강관리','배변용품','장난감','미용/목욕'],
                    datasets: [{
                        data: [],
                        backgroundColor: ['#007bff', '#dc3545', '#ffc107', '#28a745', '#f9c6cf', '#8b00ff'],
                    }],
                },
            });

            // Fetch data for Bar Chart
            fetch('adminBarChart.do') // API 엔드포인트를 입력하세요
                .then(response => response.json())
                .then(data => {
                    console.log(data);
                    // JSON 데이터에서 labels와 revenue를 추출합니다
                    const labels = data.map(item => item.chartDate);
                    const revenue = data.map(item => item.chartValue);
                    console.log("날짜값 : " + labels);
                    console.log("벨류값 : " + revenue);
                    // 차트에 데이터를 반영합니다
                    myBarChart.data.labels = labels;
                    myBarChart.data.datasets[0].data = revenue;
                    myBarChart.update();
                })
                .catch(error => console.error('Error fetching data:', error));

            // Fetch data for Pie Chart
            fetch('adminPieChart.do') // API 엔드포인트를 입력하세요
                .then(response => response.json())
                .then(data => {
                    console.log(data);
                    // JSON 데이터에서 labels와 revenue를 추출합니다
                    let labels = data.map(item => item.chartName);
                    console.log(labels);
                    if(labels=='1'){
						labels ='사료';
					}else if(labels==2) {
						labels ="간식";
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