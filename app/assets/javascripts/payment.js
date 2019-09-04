//= require jquery3
//= require activestorage
//= require turbolinks
//= require jquery.mask

$(document).ready(function(){
    const cvv = document.getElementById('cvv'),
        check = document.getElementById('check'),
        card_number = document.getElementById('card-number'),
        check_valid = document.getElementById('check-valid'),
        check_valid_span1 = document.getElementById('span1'),
        check_valid_span2 = document.getElementById('span2'),
        cvv_hint = document.getElementById('cvv-hint'),
        card_hint = document.getElementById('card-hint'),
        date_hint = document.getElementById('date-hint'),
        dateOfCard = document.getElementById('dateOfCard');

    if ( $(".hidden").text() == "Required parameter not passed card") {
        card_number.style.border = '1px solid red';
        dateOfCard.style.border = '1px solid red';
        cvv.style.border = '1px solid red';
        card_hint.textContent = "Перевірте вказані дані карти";
    }

    // if (check.checked) {
    //     check_valid.style.color = "#3c3c3c";
    //     check_valid_span1.style.color = "#3c3c3c";
    //     check_valid_span2.style.color = "#3c3c3c";
    // } else {
    //     check_valid.style.color = "red";
    //     check_valid_span1.style.color = "red";
    //     check_valid_span2.style.color = "red";
    // }

    $('#card-number').mask('0000 0000 0000 0000', {
        translation: {
            0: {
                pattern: /[0-9]/, optional: false
            }
        }
    });
    $('#dateOfCard').mask('00/00', {
        translation: {
            0: {
                pattern: /[0-9]/, optional: false
            }
        }
    });

    console.log($("dateOfCard").text());
});

