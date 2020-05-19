var jq = jQuery.noConflict();

jq( document ).on('turbolinks:load',function(){

    $('a').on('click', function(){
        var target = $(this).attr('rel');
        $("#"+target).show().siblings("div").hide();
     }).trigger('load');
     event.preventDefault();

});


