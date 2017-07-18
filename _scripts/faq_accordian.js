
$(document).ready(function () {
    function close_accordion_section() {
        $('.accordion .accordion-section-title').removeClass('active');
        $('.accordion .accordion-section-content').slideUp(300).removeClass('open');
    }

    $('.accordion-section-title').click(function (e) {
        // Grab current anchor value
        var currentAttrValue = $(this).attr('href');

        if ($(e.target).is('.active')) {
            close_accordion_section();

            //$('this').css('background', 'url(_images/faqs/plus.gif) left top no-repeat');
        } else {
            close_accordion_section();

            // Add active class to section title
            $(this).addClass('active');
            // Open up the hidden content panel
            $('.accordion ' + currentAttrValue).slideDown(300).addClass('open');
            //$('this').css('background', '#2d73a1 url(_images/faqs/minus.gif) left top no-repeat');

        }

        e.preventDefault();
    });
});

$('.accordion-section-title').click(function () {
    // Grab current anchor value
    var currentAttrValue = $(this).attr('href');

    $('.accordion .accordion-section-title').removeClass('active');
    $('.accordion .accordion-section-content').slideUp(300).removeClass('open');

    $(this).addClass('active');
    $('.accordion ' + currentAttrValue).slideDown(300).addClass('open');
});

function close_accordion_section() {
    $('.accordion .accordion-section-title').removeClass('active');
    $('.accordion .accordion-section-content').slideUp(300).removeClass('open');
}

$(document).ready(function () {
    function close_accordion_section() {
        // Close everything up
    }

    $('.accordion-section-title').click(function () {
        // Grab current anchor value
        var currentAttrValue = $(this).attr('href');

        // Open and close here
    });

    $('.accordion-section-content').css('display', 'none');

});