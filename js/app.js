$(function() {

	//
	// Categories: show more
	// --------------------------------------------------

	if ($('.js-categories').length) {
		var $parent = $('.js-categories');

		$('> .row:nth-child(4)', $parent)
			.nextAll('.row')
			.wrapAll('<div class="ia-categories__hidden"></div>')

		$('.js-more-cats').on('click', function(e) {
			e.preventDefault();

			var $this = $(this),
				$hiddenList = $parent.find('.ia-categories__hidden'),
				lessText = $this.data('less-cats-text'),
				moreText = $this.data('more-cats-text');

			if (!$hiddenList.hasClass('is-visible')) {
				$hiddenList.slideDown('fast', function() {
					$hiddenList.addClass('is-visible');
					$this.html(lessText);
				});
			} else {
				$hiddenList.slideUp('fast', function() {
					$hiddenList.removeClass('is-visible');
					$this.html(moreText);
				});
			}
		});
	}

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
