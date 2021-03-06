/**
 * cbpAnimatedHeader.js v1.0.0
 * http://www.codrops.com
 *
 * Licensed under the MIT license.
 * http://www.opensource.org/licenses/mit-license.php
 *
 * Copyright 2013, Codrops
 * http://www.codrops.com
 */
var cbpAnimatedHeader = (function() {

    var docElem = document.documentElement,
        indicators = $('.index-banner'),
        didScroll = false,
        changeHeaderOn = 200;

    function init() {
        scrollPage();
        window.addEventListener( 'scroll', function( event ) {
            if( !didScroll ) {
                didScroll = true;
                setTimeout( scrollPage, 250 );
            }
        }, false );
    }

    function scrollPage() {
        var sy = scrollY();
        if ( sy >= changeHeaderOn ) {
            if(!$('#main-nav').hasClass('navbar-scrolled')) {
                $('#main-nav').addClass('navbar-scrolled' );
                $('.navbar-brand').show();
            }

        }
        else {
            if($('#main-nav').hasClass('navbar-scrolled')) {
                $('#main-nav').removeClass('navbar-scrolled' );
                $('.navbar-brand').hide();
            }

        }
        didScroll = false;
    }

    function scrollY() {
        return window.pageYOffset || docElem.scrollTop;
    }


    init();

})();
