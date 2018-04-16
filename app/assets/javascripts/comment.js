$(function(){

  function appendHTML(comment) {
    var html = `<div class="comment clearfix">
                  <div class="comment-left">
                    <img src="${comment.user_avatar}" alt="profile_pohoto" class="media-object"
                    style="width: 70px; height: 70px;">
                  </div>
                  <div class="comment-right">
                    <div class="comment-right__user-name">
                      ${comment.user_name}
                    </div>
                    <div class="comment-right__text">
                      ${comment.content}
                    </div>
                  </div>
                </div>`
    $('.comments-body').append(html);
  }

  $('#new_comment').on('submit',function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      appendHTML(data);
      $('.message').val('');
      $('.send-bottun').prop('disabled', false);
    })
    .fail(function(){
      alert('コメントを入力してください');
      $('.send-bottun').prop('disabled', false);
    })
  });
});
