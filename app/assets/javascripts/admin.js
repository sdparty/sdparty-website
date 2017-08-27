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
//= require chosen-jquery
//= require jquery.datetimepicker
//= require html.sortable

var ready_ran = 0;

set_positions = function(){
  // loop through and give each task a data-pos
  // attribute that holds its position in the DOM
  $('.panel.panel-default').each(function(i){
      $(this).attr("data-pos",i+1);
  });
}

var ready = function(){
  if (ready_ran == 1){
    return;
  }else{
    ready_ran = 1;
  }
  // datetiimepicker
  $('.datetimepicker').datetimepicker({format: 'Y-m-d H:i'});
  // enable chosen js
  if(!$('div.chosen-container.chosen-container-multi').length){
    $('.chosen-select').chosen({
      search_contains: true,
      allow_single_deselect: true,
      no_results_text: 'No results matched',
      width: '400px'
    });
    $(".chosen-select").trigger('chosen:updated');
  }

  set_positions();
  $.ajaxSetup({
    headers: {
      'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    }
  });

  if ($('.sortable-issue').length) {
    // after the order changes
    sortable('.sortable-issue')[0].addEventListener('sortupdate', function(e) {
      // array to store new order
      updated_order = []
      // set the updated positions
      set_positions();

      // populate the updated_order array with the new task positions
      $('.panel.panel-default').each(function(i){
          updated_order.push({ id: $(this).data("id"), position: i+1 });
      });

      // send the updated order via ajax
      $.ajax({
        type: "PUT",
        url: '/admin/issues/sort',
        data: {
          _method: 'put',
          issue: {
            order: updated_order
          },
          authenticity_token: window._token
        }
      });
    });
  }

  if ($('.sortable-banner').length) {
    // after the order changes
    sortable('.sortable-banner')[0].addEventListener('sortupdate', function(e) {
      // array to store new order
      updated_order = []
      // set the updated positions
      set_positions();

      // populate the updated_order array with the new task positions
      $('.panel.panel-default').each(function(i){
          updated_order.push({ id: $(this).data("id"), position: i+1 });
      });

      // send the updated order via ajax
      $.ajax({
        type: "PUT",
        url: '/admin/banners/sort',
        data: {
          _method: 'put',
          banner: {
            order: updated_order
          },
          authenticity_token: window._token
        }
      });
    });
  }
};


$(document).ready(ready);
