//= require jquery3
//= require jquery_ujs

$(document).ready(function() {
    $("#image").change(function () {
        $("#image-filename").text($(this).val().split('\\').pop());
    });

    $("#video-upload").change(function () {
        $("#video-filename").text($(this).val().split('\\').pop());
    });

    $("#document").change(function () {
        $("#document-filename").text($(this).val().split('\\').pop());
    });
});