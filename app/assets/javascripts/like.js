$(function(){

  function countUpLike(likeCount) {
  	var new_count = Number(likeCount) + 1;
  	$('#like-text').html(`<img id="like-image" src="/assets/liked.png" alt="Liked" width="19" height="19" />${new_count}`);
  }

  $('.like-bottun').on('click',function(){
  	var likeCount = $('#like-text').text();
  	console.log(likeCount);
  	$.ajax ({
  		url: location.href,
  		type: "GET",
  		data: {
  			likeCount: likeCount
  		},
  		dataType: 'json'
  	})
  	.always(function(data){
  		countUpLike(likeCount);
  	})
  })
});