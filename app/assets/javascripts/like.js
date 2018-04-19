$(function(){

  function countUpLike(likeCount) {
  	var new_count = Number(likeCount) + 1;
    var html = `<div class="btn-secondary btn2 btn-default2">
                  <img id="like-image" src="/assets/liked.png" alt="Liked" width="19" height="19" />${new_count}
                </div>`

    $('#like-text').remove();
    $('.like-bottun').append(html);
  }

  $('#like-text').on('click',function(){
		var audioElement = $('#audio')[0];
		audioElement.play();
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
