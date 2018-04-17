$(function(){

  // images main, sub-first, sub-second and sub-third
  var previewImages = [$('.cover-image-upload'), 
                        $('.image-upload').first(), 
                        $('.image-upload:eq(1)'), 
                        $('.image-upload').last()];

  // iterate through sub-images
  previewImages.forEach(function(image){
   image.on('change', 'input[type="file"]', function (e) {
     var file = e.target.files[0],
       reader = new FileReader(),
       t = image;
     // ファイル読み込みが完了した際のイベント登録
     reader.onload = (function (file) {
       return function (e) {
         //既存のプレビューを削除
         t.find(".cover-image-upload__image").remove();
         t.find(".img-responsive").remove();
         // .prevewの領域の中にロードした画像を表示するimageタグを追加
         t.append($('<img>').attr({
           src: e.target.result,
           class: "cover-image-upload__image",
           title: file.name
         }));

       };
     })(file);

     reader.readAsDataURL(file);
   });
 })

 //end of function()
});