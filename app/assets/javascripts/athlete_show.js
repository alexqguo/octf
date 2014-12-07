$(function () {
		var athlete_data;
		var id = $(".details").data("athlete-id");
		var isMobile = screen.width <= 480; // TODO: change this
		var currentGraph = $($(".graph").not(".invisible")[0]);

		$.get("/athletes/" + id + "/graph_data", function (data) {
			athlete_data = data;

			for (var key in athlete_data) {
				
				$("#" + key.replace(" ", "-").replace(",", "")).highcharts({
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
							if (athlete_data[eventName].is_running_event) {
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
									if (athlete_data[eventName].is_running_event) {
										formattedY = this.y.formatTime();
									} else {
										formattedY = this.y.toFixed(2);
									}
									
									return formattedY;
								}
							}
						}
					},
					xAxis: { categories: athlete_data[key].years },
					yAxis: { 
						title: { text: athlete_data[key].units },
						labels: {
							formatter: function () {
								var eventName = this.chart.title.text;
								if (athlete_data[eventName].is_running_event) {
									return this.value.formatTime();
								} else {
									return this.value.toFixed(2);
								}
							}
						}
					},
					series: athlete_data[key].series
				})
			}

		});
		
		$(".event-list-item").on("click", function (event) {
			var eventId = $(event.target).data("name");
			
			currentGraph.toggleClass("invisible");
			$("#" + eventId).toggleClass("invisible");
			currentGraph = $("#" + eventId);
		});

});