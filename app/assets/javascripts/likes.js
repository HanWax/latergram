$(document).ready(function(){
	$('.like-link').on('click', function(event){
	event.preventDefault():
	$.post(this.href, function(response){
		alert(response.new_like_count);
	});
	})
})