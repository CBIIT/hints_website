$(document).ready(function () {
    $('.accordion-trigger').on('click', function () {
        // Get the target panel using the aria-controls attribute
        const targetId = $(this).attr('aria-controls');
        const $targetPanel = $('#' + targetId);

        // Check if currently expanded
        const isExpanded = $(this).attr('aria-expanded') === 'true';

        // Toggle attributes and visibility
        $(this).attr('aria-expanded', !isExpanded);

        if (isExpanded) {
            $targetPanel.attr('hidden', ''); // Hide the panel
        } else {
            $targetPanel.removeAttr('hidden'); // Show the panel
        }
    });
});