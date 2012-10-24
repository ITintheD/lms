// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require jquery-fileupload/basic
//= require_tree .




$(function () {
  $('input.upload').fileupload({
      dataType: 'json',
      url: '/'+ $('input.upload').attr('data-resource_name') + '/registrations/create_photo/' + $('input.upload').attr('data-resource_id'), 
      success: function (data) {
			var class_name = "#" + data.location;
    	$( class_name ).empty();
        $( class_name ).append('<img src="' + data.url + '">');
      }
    });
 });

function mark_resource_as_read(resource_id) {
	$.ajax({
	  type: 'GET',
	  url: '/resources/read/' + resource_id
	});	
}


