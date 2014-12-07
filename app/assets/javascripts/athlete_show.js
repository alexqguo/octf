$(function () {
		var athleteData;
		var generatedGraphs = {};
		var id = $(".details").data("athlete-id");
		var isMobile = screen.width <= 480; // TODO: change this
		var currentGraph = $($(".graph").not(".invisible")[0]);

		function createGraph(key) {
			generatedGraphs[key] = true;

			$("#" + key).highcharts({
				chart: { 
					type: "line",
					backgroundColor: "#FEFEFE"
				},
				title: { text: key },
				tooltip: {
					enabled: true,
					formatter: function () {
						var formattedY;
						var eventName = this.series.chart.title.text;
						if (athleteData[eventName].is_running_event) {
							formattedY = this.y.formatTime();
						} else {
							formattedY = this.y.toFixed(2);
						}

						return '<b>' + this.series.name + '</b><br>' + 
						this.x +': '+ formattedY;
					}
				},
				plotOptions: {
					line: {
						dataLabels: { 
							enabled: isMobile,
							formatter: function () {
								var formattedY;
								var eventName = this.series.chart.title.text;
								if (athleteData[eventName].is_running_event) {
									formattedY = this.y.formatTime();
								} else {
									formattedY = this.y.toFixed(2);
								}
								
								return formattedY;
							}
						}
					}
				},
				xAxis: { categories: athleteData[key].years },
				yAxis: { 
					title: { text: athleteData[key].units },
					labels: {
						formatter: function () {
							var eventName = this.chart.title.text;
							if (athleteData[eventName].is_running_event) {
								return this.value.formatTime();
							} else {
								return this.value.toFixed(2);
							}
						}
					}
				},
				series: athleteData[key].series
			});
		}

		$.get("/athletes/" + id + "/graph_data", function(data) {
			athleteData = data;
			createGraph(Object.keys(athleteData)[0]);
		});

		$(".event-list-item").on("click", function (event) {
			event.preventDefault();
			var eventId = $(event.target).data("name");

			currentGraph.toggleClass("invisible");
			$("#" + eventId).toggleClass("invisible");
			currentGraph = $("#" + eventId);

			if (!generatedGraphs[eventId]) {
				createGraph(eventId);
			}
		});
});