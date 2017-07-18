function validateFileSize() {

    $('#BTN_Submit').prop('disabled', false);

    var uploadControl = $('#FileUpload1')[0];

    if (uploadControl.files[0].size > 5242880) {

        $('#dvMsg').show();
        $('#BTN_Submit').prop('disabled', true);
    }

    else {

        $('#dvMsg').hide();
    }
}
