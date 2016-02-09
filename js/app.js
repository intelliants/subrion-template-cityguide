$(function() {

	//
	// Utils
	// --------------------------------------------------

	// append Modal to body for better z-index
	$('.modal').appendTo('body');

	// toggle tooltips
	$('[data-toggle="tooltip"]').tooltip({
		container: 'body'
	});
});
