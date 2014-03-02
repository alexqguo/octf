/*
Does not do hours, I was lazy
*/
Number.prototype.formatTime = function () {
	if (this < 60) {
		return this.toFixed(2);
	}
	
	var minutes = Math.floor(this / 60).toString();
	var seconds = (this - (minutes * 60)).toFixed(2);
	
	if (seconds.split(".")[0].length < 2) {
		seconds = "0" + seconds;
	}
	
	return minutes + ":" + seconds;
}