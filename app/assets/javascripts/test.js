$(function(){
	$('#setting').hover(function(){
		var cog = $(this).find('span');
		$(cog).animate({
			'font-size':'16px'
		},200);
	},function(){
		var cog = $(this).find('span');
		(cog).animate({
			'font-size':'14px'
		},200);
	});
	$('#top-btn').click(function(){
		$('html, body').animate({
			'scrollTop' : 0
		},500);
	});
});