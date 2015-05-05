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
//= require ckeditor/init
//= require modernizr
//= require jquery.themepunch.tools.min
//= require jquery.themepunch.revolution
//= require isotope.pkgd
//= require owl.carousel
//= require magnific-popup
//= require jquery.appear
//= require jquery.countTo
//= require jquery.parallax
//= require jquery.validate
//= require template
//= require custom
//= require jquery-ui/datepicker
//= require chosen-jquery
//= require social-share-button
//= require analytics

var ready = function(){
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
    $(this).next('.sublist').slideToggle('slow');
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);

