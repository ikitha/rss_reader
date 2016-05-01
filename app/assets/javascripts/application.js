// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

var refreshFeed = function () {
    $.ajax({
        url: '/entries',  //Server script to process data
        type: 'GET',
        dataType: 'json',
        //Ajax events
        success: function (data) {
          $('#tech_posts ul').empty();
          data.entries.forEach(function (data) {
            $('#tech_posts ul').append(
              $('<li>').append(
                $('<div class="well well-sm entry">').append(
                  $('<a>').attr('href',data.url).append(data.name))
                .append(
                  $('<button class="bookmark btn btn-warning btn-sm pull-right" aria-label="Left Align">').attr('value', data.id).append(
                    $('<span class="glyphicon glyphicon-star" aria-hidden="true">')))
            ));
          });
        },
        error: function () {
            console.log("oops");
        }
    });
  };