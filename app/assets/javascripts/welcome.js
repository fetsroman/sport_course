let scrolled,
    timer,
    scroll = document.getElementById('scroll'),
    setBool = false,
    header = document.querySelector('.header');


function headerBG() {
    if (window.pageYOffset >= 515) {
        if (!setBool) {
            header.classList.toggle('toggleHeader');
            scroll.classList.toggle('toggleScroll');
            setBool = true;
        }
    } else {
        if (setBool) {
            header.classList.toggle('toggleHeader');
            scroll.classList.toggle('toggleScroll');
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

    scroll.onclick = function () {
        scrolled = window.pageYOffset;
        scrollToTop();
    };
};
