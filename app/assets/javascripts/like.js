$(function(){

  function countUpLike(likeCount) {
  	var new_count = Number(likeCount) + 1;
  	// $('#like-text').text(new_count);
  }

  $('.like-bottun').on('click',function(){
  	// e.preventDefault();
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