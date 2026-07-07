$(document).ready(function () {

    // Set "Show All" as the default active button on page load
    $('.filter-trigger[data-target="all"]').addClass('active');

    $('.filter-trigger').on('click', function () {

        // Remove the 'active' class from all buttons
        $('.filter-trigger').removeClass('active');

        // Add the 'active' class ONLY to the button that was clicked
        $(this).addClass('active');


        //Get the target category from the clicked button's data attribute
        const targetCategory = $(this).attr('data-target');
        const $contentSections = $('.content-section');

        //Apply the filter logic based on the target category
        if (targetCategory === 'all') {
            $contentSections.show(); //Show all sections
        } else {
            $contentSections.hide(); //Hide all sections

            //Show only the sections that match the target category
            $('.content-section[data-category="' + targetCategory + '"]').show();
        }
    });
});