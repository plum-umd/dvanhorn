function showHide(shID) {
    var e = document.getElementById(shID);
    if (e) {
	if (e.style.display == 'none') {
	    e.style.display = 'inline';
	} else {
	    e.style.display = 'none';
	}
    }
}
