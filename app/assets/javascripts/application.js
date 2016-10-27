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
//= require bootstrap
//= require toastr

//= require cbpAnimatedHeader

//= require jquery.easing.min
//= require scrollreveal/scrollreveal.min
//= require scroll-page
//= require masks
//= require smart_listing

$(document).ready(function(){
    // NAV
    $('.btn-menu').on('click', function() {
        $('#side-nav').addClass('active');
    });
    $('.close-menu').on('click', function() {
        $('#side-nav').removeClass('active');
    });
    // END NAV

    $window = $(window);
    $('div[data-type="background"]').each(function(){
        var $scroll = $(this);
        $(window).scroll(function() {
            var yPos = -($window.scrollTop() / $scroll.data('speed'));
            var coords = '50% '+ yPos + 'px';
            $scroll.css({ backgroundPosition: coords });
        });
    });
});
