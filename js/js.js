// javascript

var init = ( function () {

	var LEFT = 37, UP = 38, RIGHT = 39;

	PARENT_CAT = typeof(PARENT_CAT) != "undefined" ? PARENT_CAT : '';
	PREV_ENTRY = typeof(PREV_ENTRY) != "undefined" ? PREV_ENTRY : '';
	NEXT_ENTRY = typeof(NEXT_ENTRY) != "undefined" ? NEXT_ENTRY : '';

	document.onkeypress = function(e) {
		switch (e.keyCode) {
			case UP :
				if (PARENT_CAT && window.pageYOffset == 0)
				window.location = PARENT_CAT; 
				break;				
			case LEFT  : 
				if (PREV_ENTRY)
				window.location = PREV_ENTRY; 
				break;
			case RIGHT : 
				if (NEXT_ENTRY)
				window.location = NEXT_ENTRY; 
				break;
		}
	}

})();


function fadeOut( elem, time )
{
	var startOpacity = elem.style.opacity || 1;
	elem.style.opacity = startOpacity;
	(function go() {
		elem.style.opacity -= startOpacity / ( time / 100 );

		// for IE
		elem.style.filter = 'alpha(opacity=' + elem.style.opacity * 100 + ')';

		if( elem.style.opacity > 0 )
			setTimeout( go, 100 );
		else
			elem.style.display = 'none';
	})();
}


function fadeIn( elem, time )
{
	if (elem.style.opacity == 0)
		elem.style.opacity = .1;

	var startOpacity = elem.style.opacity || .1;
	elem.style.opacity = startOpacity;

	(function go() {
		elem.style.opacity += startOpacity  ( time / 100 )  ;

		console.log(elem.style.opacity);

		//console.log(elem.style.opacity);

		// for IE
		elem.style.filter = 'alpha(opacity=' + elem.style.opacity * 100 + ')';

		if( elem.style.opacity < 1 )
			setTimeout( go, 100 );
		else
			elem.style.display = 'none';
	})();
}
