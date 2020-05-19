// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require activestorage
//= require turbolinks
//= require articles
//= require jquery
//= require jquery_ujs
//= require settings.js
//= require_tree .

$( document ).on('turbolinks:load', function() {
    console.log("It works on each visit!")
  })

$(document).on('turbolinks:load', function() {
    $("#SelectedPosts").hide();
  });

$(document).on('turbolinks:load', function() {
  $("[data-js-hide-link]").click(function (event) {
    $(this).parents("li").hide();
    event.preventDefault();
  });
});

$(document).on('turbolinks:load', function() {
  $("[data-js-toggle-topic]").click(function (event) {
    console.log($("#"+ event.currentTarget.getAttribute("data-topic")))
    $("." + event.currentTarget.getAttribute("data-topic")).toggle();    

    if($("#"+ event.currentTarget.getAttribute("data-topic")).css('color')==='rgb(255, 165, 0)')
    {
      console.log($("#"+ event.currentTarget.getAttribute("data-topic")).css('color'))
      console.log('if')
      $("#"+ event.currentTarget.getAttribute("data-topic")).css({
      'color':'rgb(0, 0, 0)'
      })
    }
    else {
      console.log('else')
      $("#"+ event.currentTarget.getAttribute("data-topic")).css({
        'color':'rgb(255, 165, 0)'
      })
    }   
    console.log("hiding: ." + event.currentTarget.getAttribute("data-topic"));
    event.preventDefault();
  });
});

$(document).on('turbolinks:load', function() {
  $("[data-js-selected-posts]").click(function (event) {
    console.log("Selected Posts");
    $("#SelectedPosts").show();
    $("#RecentPosts").hide();
    event.preventDefault();
  });
});

$(document).on('turbolinks:load', function() {
  $("[data-js-recent-posts]").click(function (event) {
    console.log("Recent Posts");
    $("#SelectedPosts").hide();
    $("#RecentPosts").show();
    event.preventDefault();
  });
});
