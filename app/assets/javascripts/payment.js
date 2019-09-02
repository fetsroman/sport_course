//= require rails-ujs
//= require activestorage
//= require turbolinks

window.onload = function (e) {
    document.getElementById('submit').onclick = function (e) {
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

        e.preventDefault();

        if (cvv.value.length <= 2) {
            cvv.style.border = '1px solid red';
            cvv_hint.textContent = 'Довжина має бути 3 символи'
        } else {
            cvv.style.border = '1px solid #F2C94C';
            cvv_hint.textContent = ''
        }

        if (dateOfCard.value.length <= 6) {
            dateOfCard.style.border = '1px solid red';
            date_hint.textContent = 'Введіть дату в вказаному форматі'
        } else {
            dateOfCard.style.border = '1px solid #F2C94C';
            date_hint.textContent = ''
        }
        if (card_number.value.length <= 19) {
            card_number.style.border = '1px solid red';
            card_hint.textContent = 'перевірте номер карти'
        } else {
            card_number.style.border = '1px solid #F2C94C';
            card_hint.textContent = ''
        }

        if (check.checked) {
            check_valid.style.color = "#3c3c3c";
            check_valid_span1.style.color = "#3c3c3c";
            check_valid_span2.style.color = "#3c3c3c";
        } else {
            check_valid.style.color = "red";
            check_valid_span1.style.color = "red";
            check_valid_span2.style.color = "red";
        }

        if (check.checked && card_number.style.border === '1px solid #F2C94C' &&
            dateOfCard.style.border === '1px solid #F2C94C' && cvv.style.border === '1px solid #F2C94C') {

            let card = card_number.value.replace(/ /g, '');
            let date = dateOfCard.value.trim().split('');
            date.splice(2, 3);
            console.log(check.checked, Number(cvv.value), date, card)
        }
    };
    document.getElementById('card-number').onkeypress = function (event) {
        const char = String.fromCharCode(event.which);
        if (!(/[0-9+]/.test(char))) {
            event.preventDefault();
        }
        if (event.target.value.length <= 19) {
            if (event.target.value.length % 5 === 0) {
                event.target.value += ' ';
            }
        }
    };
    document.getElementById('cvv').onkeypress = function (event) {
        const char = String.fromCharCode(event.which);
        if (!(/[0-9+]/.test(char))) {
            event.preventDefault();
        }
    };
    document.getElementById('dateOfCard').onkeypress = function (event) {
        const char = String.fromCharCode(event.which);
        if (!(/[0-9+]/.test(char))) {
            event.preventDefault();
        }
        setTimeout(function () {
            if (event.target.value.length === 2) {
                event.target.value += ' / ';
            }
        }, 0);
    };
};