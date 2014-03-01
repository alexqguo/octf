$(function () {
	$(".chosen-select").prop("selectedIndex", -1);
	
	$(".chosen-select").chosen({
		placeholder_text_single: "Find an athlete...",
		width: "200px"
	});
	
	$(".chosen-form").submit(function (event) {
		event.preventDefault();
		var athlete_id = $(".chosen-form select").val();
		if (athlete_id) {
			window.location.href = "/athletes/" + athlete_id;
		}
	});
});