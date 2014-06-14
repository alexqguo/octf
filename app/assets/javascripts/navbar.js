$(function () {
	var location = window.location.pathname.split("/")[1];
	if (!location) {
		location = "home";
	}

	var currentNavlistTab = $(".navlist-item[data-tab=" + location + "]");
	currentNavlistTab.addClass("selected");

	if (window.innerWidth < 750) {
		showSmallNavbar();
	} else {
		$("#navlistMini").hide();
	}

	function showSmallNavbar() {
		$("#navlistLarge").hide();
		$("#navlistMini").show();
	}

	function showBigNavbar() {
		$("#navlistLarge").show();
		$("#navlistMini").hide();
	}

	$(window).resize(function () {
		if (window.innerWidth < 750) {
			showSmallNavbar();
		} else {
			showBigNavbar();
		}

		$(".header-wrap").css("left: 0");
	});

	$(".menu-button").click(function (event) {
		event.preventDefault();
		$("#droplist").toggle();
	});
});