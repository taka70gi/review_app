document.addEventListener("turbolinks:load", function() {
  $(function(){
      $(".favorite_navi").on('click',function(){
          /*クリックでコンテンツを開閉*/
          $(".favorite_list_position").slideToggle(200);
      })
  })
  $(function(){
    $(".comment_navi").on('click',function(){
        /*クリックでコンテンツを開閉*/
        $(".favorite_list_row").slideToggle(200);
    })
  })
  $(function(){
    $(".hamburger_wide").on('click',function(){
        /*クリックでコンテンツを開閉*/
        $(".header-nav-menu").slideToggle(200);
    })
  })
  $(function() {
    function readURL(input) {
      if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
          $('.img_prev').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
      }
    }
    $(".post_post_img").change(function() {
      $('.img_prev').removeClass('hidden');
      readURL(this);
    });
  });
});
