$(document).ready(function() {

    var $c = $('.offer_full_desc');
    var $w = $c.find("div.big_gallery_wrapper");
    var $nav = $c.find('div.nav_gallery_wrapper');

    $w.magnificPopup({
        delegate: 'a',
        fixedContentPos: false,
        removalDelay: 300,
        mainClass: 'mfp-fade',
        type: 'image',
        gallery: {enabled:true}
    });

    $w.slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        autoplay: false,
        fade:true,
        arrows:true,
        speed: 200,
        dots:false,
        infinite: true,
        asNavFor: '#offer_gallery'// TODO:: это негибкий хардкод, а что если на странице будет несколько галерей такого типа?
    });

    $nav.slick({
        slidesToShow: 3,
        slidesToScroll: 1,
        asNavFor: '#offer_gallery', // TODO:: это негибкий хардкод, а что если на странице будет несколько галерей такого типа?
        dots: false,
        speed: 200,
        //centerMode: true,
        arrows:false,
        focusOnSelect: true
    });

    /*setTimeout(function() {
        var $b = $("#gallery3_nav").find(".img-holder");
        //console.log($b);
        $b.bind({
            mouseenter: function() {
                $(this).addClass("plusOpacity");
            },
            mouseleave: function() {
                $(this).removeClass("plusOpacity");
            }
        })
    },100);*/


});