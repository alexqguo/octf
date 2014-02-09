$(function () {
	$(".athlete-list-el a").on("mouseover", function (event) {
		$(this).toggleClass("selected");
	});
	
	$(".athlete-list-el a").on("mouseout", function (event) {
		$(this).toggleClass("selected");
	});
})