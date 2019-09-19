//= require jquery3
//= require bootstrap
//= require rails-ujs
//= require activestorage
//= require turbolinks

$(document).ready(function() {
    $("#image").change(function () {
        $("#image-filename").text($(this).val().split('\\').pop());
    });

    $("#video").change(function () {
        $("#video-filename").text($(this).val().split('\\').pop());
    });

    $("#document").change(function () {
        $("#document-filename").text($(this).val().split('\\').pop());
    });
})