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
//= require turbolinks
//= require bootstrap
//= require ckeditor/init
//= require chosen-jquery
//= require jquery.datetimepicker

var ready = function(){
  // datetiimepicker
  $('.datetimepicker').datetimepicker({format: 'Y-m-d H:i'});
  // enable chosen js
  $('.chosen-select').chosen({
    search_contains: true,
    allow_single_deselect: true,
    no_results_text: 'No results matched',
    width: '200px',
  });
  $(".chosen-select").trigger('chosen:updated');
};


$("input[name='article[kind]']").change(function(){
  if($(this).val() == 'issue') {
    $('.issue_field').show();
  } else {
    $('.issue_field').hide();
  }

});


$(document).ready(ready);
$(document).on('page:load', ready);
