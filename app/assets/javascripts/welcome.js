//= require jquery3
//= require bootstrap
//= require slick.min
//= require rails-ujs
//= require activestorage
//= require turbolinks

let scrolled,
    timer,
    scroll = document.getElementById('scroll'),
    setBool = false,
    header = document.querySelector('.header');


function headerBG() {
    if (window.pageYOffset >= 515) {
        if (!setBool) {
            $("header").addClass('toggleHeader');
            $("#scroll").addClass('toggleScroll');
            setBool = true;
        }
    } else {
        if (setBool) {
            $("header").removeClass('toggleHeader');
            $("#scroll").removeClass('toggleScroll');
            setBool = false;
        }
    }
}

function scrollToTop() {

    if (scrolled >= 0) {
        window.scrollTo(0, scrolled);
        scrolled = scrolled - 50;// -50 length scroll
        timer = setTimeout(scrollToTop, 10) // 20 scroll speed
    } else {
        clearTimeout(timer);
        window.scrollTo(0, 0)
    }
}

window.onload = function () {

    window.onscroll = function () {
        headerBG()
    };

    headerBG();
    scroll = document.getElementById('scroll'),
    $('#scroll').click(function(){
        scrolled = window.pageYOffset;
        scrollToTop();
    });
};

$(document).on('click', '.scroll-nav', function (event) {
    event.preventDefault();

    $('html, body').animate({
        scrollTop: $($.attr(this, 'href')).offset().top - 120
    }, 900);
});
$( document ).ready(function() {
    $('.slider').slick({
        infinite: true,
        slidesToShow: 3,
        slidesToScroll: 3,
        responsive: [
            {
                breakpoint: 1200,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 2,
                }
            },
            {
                breakpoint: 992,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 1,
                }
            },
            {
                breakpoint: 767,
                settings: {
                    slidesToScroll: 1,
                    centerMode: true,
                    variableWidth: true,
                }
            }
        ]
    });

    $('.price-wrapper').slick({
        infinite: true,
        slidesToShow: 3,
        slidesToScroll: 3,
        autoplay: true,
        autoplaySpeed: 5000,
        responsive: [
            {
                breakpoint: 1200,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 2,
                }
            },
            {
                breakpoint: 992,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            },
            {
                breakpoint: 470,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1,
                }
            }
        ]
    });
});