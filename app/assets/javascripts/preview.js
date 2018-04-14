$(function(){

// preview fucntion requires refactoring!!

  //画像ファイルプレビュー表示のイベント追加 fileを選択時に発火するイベントを登録
  $('.cover-image-upload').on('change', 'input[type="file"]', function(e) {
    var file = e.target.files[0],
        reader = new FileReader(),
        t = $(".cover-image-upload");


    // ファイル読み込みが完了した際のイベント登録
    reader.onload = (function(file) {
      return function(e) {
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

  $('.image-upload').first().on('change', 'input[type="file"]', function(e) {
    var file = e.target.files[0],
        reader = new FileReader(),
        t = $(".image-upload").first();


    // ファイル読み込みが完了した際のイベント登録
    reader.onload = (function(file) {
      return function(e) {
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

  $('.image-upload:eq(1)').on('change', 'input[type="file"]', function(e) {
    var file = e.target.files[0],
        reader = new FileReader(),
        t = $(".image-upload:eq(1)");


    // ファイル読み込みが完了した際のイベント登録
    reader.onload = (function(file) {
      return function(e) {
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

  $('.image-upload').last().on('change', 'input[type="file"]', function(e) {
    var file = e.target.files[0],
        reader = new FileReader(),
        t = $(".image-upload").last();


    // ファイル読み込みが完了した際のイベント登録
    reader.onload = (function(file) {
      return function(e) {
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
});