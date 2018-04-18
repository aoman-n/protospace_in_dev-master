$(function(){

  function countUpLike(data) {
  	$('#like-text').text(`${data.count}`);
  }

  $('.like-bottun').on('click',function(){
  	// e.preventDefault();
  	// var likeCount = $('#like-image').text();
  	$.ajax ({
  		url: location.href,
  		type: "GET",
  		// data: {
  		// 	likeCount: likeCount
  		// },
  		dataType: 'json'
  	})
  	.always(function(data){
  		countUpLike(data);
  		console.log(${data.count});
  	})
  })
});