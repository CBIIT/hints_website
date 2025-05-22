//$('#exportModalPopupButton').click(function () {
//    $('#exportModalPopup').show();
//    $('#exportModalPopup').addClass('show').attr('aria-modal', 'true');
//    //var myModal = new bootstrap.Modal(document.getElementById('exportModalPopup'));
//    //myModal.show();
//});
$(document).ready(function () {
    $('#exportModalPopupButton').click(function () {
        $('#exportModalPopup').show();
        $('#exportModalPopup').addClass('show').attr('aria-modal', 'true');
    });

    // Close modal when clicking anywhere outside the modal
    $(document).click(function (event) {
        $('#exportModalPopup').modal('hide');
        //if (!$(event.target).closest('#exportModalPopup, #exportModalPopupButton').length) {
        //    $('#exportModalPopup').modal('hide');
        //}
    });
});
