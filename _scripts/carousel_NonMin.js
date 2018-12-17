// ------------------------------------------- 
// Flexslider Custom Js 
// @description custom script for Flexslider    
// -------------------------------------------

$(document).ready(function () {
    $('.flexslider').flexslider({
        animation: "slide",
        controlNav: "thumbnails",
        animationLoop: true,
        itemMargin: 5,
        maxItems:1,
        slideshow: true,
        slideshowSpeed: 5000
    });

    $('#homepage_carousel').flexslider({
        before: function (slider) {
            $('#homepage_carousel .flex_caption').hide(); 
        },
        after: function (slider) {
            $('#homepage_carousel .flex_caption').fadeIn("slow");//.fadeIn(myAnimationSpeed); // ...and fade !
        }
            
    });

});
