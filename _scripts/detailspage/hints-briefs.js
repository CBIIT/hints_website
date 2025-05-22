$(document).ready(function () {
    const $navLinks = $('.nav-item.nav-link');
    const $tabPanes = $('.tab-pane');

    $navLinks.on('click', function (event) {
        event.preventDefault();

        // Remove active class and aria-selected from all links
        $navLinks.removeClass('active').attr('aria-selected', 'false');

        // Add active class and aria-selected to the clicked link
        $(this).addClass('active').attr('aria-selected', 'true');

        // Update tab-panes
        const targetPaneId = $(this).attr('href').substring(1); // Get the target pane ID
        $tabPanes.removeClass('show active');
        $('#' + targetPaneId).addClass('show active');
    });
});

