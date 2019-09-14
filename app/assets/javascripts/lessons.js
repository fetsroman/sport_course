//= require jquery3
//= require rails-ujs
//= require activestorage
//= require turbolinks

$(document).ready(function(){
    function changeValue(arg, max) {
        const range = document.getElementById("myRange");
        const range_line_width = document.getElementById("range-value");
        const procent = document.querySelector(".procent");
        const lesson = document.querySelector(".lesson");

        range.value = arg;
        range.max.value = max;
        let p = arg / max;
        range_line_width.style.width = p + '%';
        const total = parseFloat(range_line_width.style.width) * 100;
        lesson.textContent = `${arg} / ${max} уроків`;
        setTimeout(function () {
            range_line_width.style.width = total + '%';
            procent.textContent = total + '%'
        }, 0);
    }

    var arr = $(".lesson").text().split(" ");
    changeValue(arr[0], arr[2]);

    // function AjaxTrackVideo() {
    //     if ( $(".video-container").attr("data-watched") == "false" ) {
    //         var course_id = $(".main-section").attr('id');
    //         var lesson_id = $(".video-container").attr('id');
    //         var videoEnded = false;
    //         const lesson = document.querySelector(".videoControl");
    //         lesson.ontimeupdate = (event) => {
    //             let duration = event.target.duration;
    //             let currentTime = event.target.currentTime;
    //             let p = currentTime / duration * 100;
    //             if (p.toFixed(0) >= 90) {
    //                 if (!videoEnded) {
    //                     videoEnded = true;
    //                     console.log(videoEnded);
    //                     Rails.ajax({
    //                         url: "/courses/" + course_id + "/lessons/" + lesson_id + "/watched",
    //                         type: "get",
    //                         dataType:"json",
    //                         data: "",
    //                         success: function() {
    //                             lesson_id = parseInt(lesson_id);
    //                             lesson_id += 1;
    //                             $('#' + lesson_id).removeClass('to-view').addClass('viewed');
    //                             var watched_lessons = parseInt(arr[0]);
    //                             watched_lessons += 1;
    //                             $(".lesson").text(watched_lessons + " / " + arr[2] + " " + arr[3]);
    //                             changeValue(watched_lessons, arr[2]);
    //                             $(".video-container").attr("data-watched", "true");
    //                         },
    //                         error: function(data) {
    //                             console.log(data);
    //                         }
    //                     });
    //                 }
    //             } else {
    //                 if (videoEnded) {
    //                     videoEnded = true;
    //                     console.log(videoEnded);
    //                 }
    //             }
    //         };
    //     }
    // }
    //
    // AjaxTrackVideo();
    //
    // $('.every-video').click(function(){
    //     $(".viewing").addClass('viewed').removeClass("viewing");
    //     $(this).removeClass("viewed").addClass("viewing");
    //     AjaxTrackVideo();
    // });


    var boooool = false;

    $('#myBtn').click(function(){
        if (!boooool){
            $('#modal').addClass('toggleModal');
            boooool = true
        }
    });
    $('#close').click(function(){
        if (boooool){
            $('#modal').removeClass('toggleModal');
            boooool = false
        }
    });
    $('#modal').click(function(){
        if (boooool){
            $('#modal').removeClass('toggleModal');
            boooool = false
        }
    });
});