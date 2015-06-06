// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require modernizr
//= require isotope.pkgd
//= require owl.carousel
//= require magnific-popup
//= require jquery.appear
//= require jquery.sharrre
//= require jquery.countTo
//= require jquery.parallax
//= require jquery.validate
//= require template
//= require custom
//= require social-share-button
//= require analytics

var ready_ran = 0;

var ready = function(){
  if (ready_ran == 1){
    return;
  }else{
    ready_ran = 1;
  }
  if ($("#disqus_thread").length) {
    var disqus_shortname = 'sdparty';
    (function() {
      var dsq = document.createElement('script');
      dsq.type = 'text/javascript';
      dsq.async = true;
      dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
      (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
    })();
  }

  $('.sublist').hide();
  $('.prlist span').click(function() {
    console.log('show');
    $(this).next('.sublist').slideToggle('slow');
  });

  if ($('#abgneBlock > ul.list > li').length > 1) {

    var $block = $('#abgneBlock'),
      $slides = $('ul.list', $block),
      _width = $block.width(),
      $li = $('li', $slides),
      _animateSpeed = 600,
      // 加入計時器, 輪播時間及控制開關
      timer, _showSpeed = 3000, _stop = false;

    // 產生 li 選項
    var _str = '';
    for(var i=0, j=$li.length;i<j;i++){
      // 每一個 li 都有自己的 className = playerControl_號碼
      _str += '<li class="playerControl_' + (i+1) + '"><span></span><div></div></li>';
    }

    // 產生 ul 並把 li 選項加到其中
    var $playerControl = $('<ul class="playerControl"></ul>').html(_str).appendTo($slides.parent()).css('left', function(){
      // 把 .playerControl 移到置中的位置
      return (_width - $(this).width()) / 2;
    });

    // 幫 li 加上 click 事件
    var $playerControlLi = $playerControl.find('li').click(function(){
      var $this = $(this);
      $this.addClass('current').siblings('.current').removeClass('current');

      clearTimeout(timer);
      // 移動位置到相對應的號碼
      $slides.stop().animate({
        left: _width * $this.index() * -1
      }, _animateSpeed, function(){
        // 當廣告移動到正確位置後, 依判斷來啟動計時器
        if(!_stop) timer = setTimeout(move, _showSpeed);
      });

      return false;
    }).eq(0).click().end();

    // 如果滑鼠移入 $block 時
    $block.hover(function(){
      // 關閉開關及計時器
      _stop = true;
      clearTimeout(timer);
    }, function(){
      // 如果滑鼠移出 $block 時
      // 開啟開關及計時器
      _stop = false;
      timer = setTimeout(move, _showSpeed);
    });

    // 計時器使用
    function move(){
      var _index = $('.current').index();
      $playerControlLi.eq((_index + 1) % $playerControlLi.length).click();
    }
  }
  if ($('#donate-form').length) {
    $('#submit_button').click(function() {
      $('#address').val($('#recipient_address').val());
      $('#name').val($('#recipient_name').val());
      $('#cellphone').val($('#recipient_cellphone').val());
      $('#donate-form').submit();
    });
  }
};

$(document).ready(ready);
$(document).on('page:load', ready);

