$(function () {
	var location = window.location.pathname.split("/")[1];

	var currentNavlistTab = $(".navlist-item[data-tab=" + location + "]");
	currentNavlistTab.addClass("selected");
});