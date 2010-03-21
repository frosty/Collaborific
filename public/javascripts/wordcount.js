$(document).ready(function() {
	$("[class^='count[']").each(function() {
		var elClass = $(this).attr('class');
		var minWords = 0;
		var maxWords = 0;
		var countControl = elClass.substring((elClass.indexOf('['))+1, elClass.lastIndexOf(']')).split(',');
		
		if(countControl.length > 1) {
			minWords = countControl[0];
			maxWords = countControl[1];
		} else {
			maxWords = countControl[0];
		}	
		
		$(this).after('<div class="wordCount success"><strong>0</strong> / ' + maxWords + ' Words</div>');
		if(minWords > 0) {
			$(this).siblings('.wordCount').addClass('error');
		}	
		
		$(this).bind('keyup click blur focus change paste', function() {
			var numWords = jQuery.trim($(this).val()).split(' ').length;
			if($(this).val() === '') {
				numWords = 0;
			}	
			$(this).siblings('.wordCount').children('strong').text(numWords);
			
			if(numWords < minWords || (numWords > maxWords && maxWords != 0)) {
				$(this).siblings('.wordCount').addClass('error');
				$(this).siblings('.wordCount').removeClass('success');
			} else {
				$(this).siblings('.wordCount').removeClass('error');	
				$(this).siblings('.wordCount').addClass('success');
			}
		});
	});
});