// javascript

var init = ( function () {

	var LEFT = 37, RIGHT = 39;

	document.onkeypress = function(e) {
		switch (e.keyCode) {
			case LEFT : nextEntry(); break;
			case RIGHT : prevEntry(); break;
		}
	}

	function prevEntry() { 
		if (typeof(PREV_ENTRY) != "undefined") {
			window.location = PREV_ENTRY;
		} 
	}

	function nextEntry() {
		if (typeof(NEXT_ENTRY) != "undefined") {
			window.location = NEXT_ENTRY;
		}	
	}

})();
