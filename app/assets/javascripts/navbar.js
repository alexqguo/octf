$(function () {
	var location = window.location.pathname.split("/")[1];
	if (!location) {
		location = "home";
	}

	var currentNavlistTab = $(".navlist-item[data-tab=" + location + "]");
	currentNavlistTab.addClass("selected");

	function showSmallNavbar() {
		$(".navbar").hide();
		$(".navbar-mini").show();
	}

	function showBigNavbar() {
		$(".navbar").show();
		$(".navbar-mini").hide();
	}

	$(window).resize(function () {
		if (window.innerWidth < 750) {
			showSmallNavbar();
		} else {
			showBigNavbar();
		}
	});
});