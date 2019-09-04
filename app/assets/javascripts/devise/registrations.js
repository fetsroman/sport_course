//= require jquery3
//= require rails-ujs
//= require activestorage
//= require turbolinks

$(document).ready(function(){
    const email = document.getElementById('email'),
        password = document.getElementById('password'),
        check = document.getElementById('check'),
        password_hint = document.getElementById('password-hint'),
        email_hint = document.getElementById('email-hint'),
        check_valid = document.getElementById('check-valid'),
        check_valid_span1 = document.getElementById('span1'),
        check_valid_span2 = document.getElementById('span2'),
        radio = document.querySelector("input[name=language]:checked");

    var my_data = $('#foobar').data('foobar');

    function validateEmail(email_check) {
        var re = /^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
        return re.test(email_check);
    }

    my_data.forEach(function(element) {

        if(validateEmail(email.value) == false){
            email.style.border = '1px solid red';
            email_hint.textContent = 'Неправильний Email';
        }
        if (element == 'email') {
            email.style.border = '1px solid red';
            email_hint.textContent = 'Такий Email вже використовується';
        }
        if(element == 'password'){
            if (password.value == '') {
                password.style.border = '1px solid red';
                password_hint.textContent = 'Введіть пароль';
            } else if (password.value.length <= 7) {
                password.style.border = '1px solid red';
                password_hint.textContent = 'Потрібен пароль більше 7 символів';
            }
        }

        if(element == 'terms_and_conditions'){
            if (check.checked == false){
                check_valid.style.color = "red";
                check_valid_span1.style.color = "red";
                check_valid_span2.style.color = "red";
            }
        }
    });
});
