$(function () {
	var location = window.location.pathname.split("/")[1];
	if (!location) {
		location = "home";
	}

	var currentNavlistTab = $(".navlist-item[data-tab=" + location + "]");
	currentNavlistTab.addClass("selected");
});