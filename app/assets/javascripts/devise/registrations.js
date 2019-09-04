//= require jquery3
//= require rails-ujs
//= require activestorage
//= require turbolinks

$(document).ready(function(){
    const email = document.getElementById('email'),
        password = document.getElementById('password'),
        name = document.getElementById('name'),
        phone = document.getElementById('phone'),
        check = document.getElementById('terms_and_conditions'),
        password_hint = document.getElementById('password-hint'),
        email_hint = document.getElementById('email-hint'),
        name_hint = document.getElementById('name-hint'),
        phone_hint = document.getElementById('phone-hint'),
        check_valid = document.getElementById('check-valid'),
        check_valid_span1 = document.getElementById('span1'),
        check_valid_span2 = document.getElementById('span2'),
        radio = document.querySelector("input[name=language]:checked");

    let my_data = $('#foobar').data('foobar');

    // function validateEmail(email_check) {
    //     var re = /^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
    //     return re.test(email_check);
    // }

    my_data.forEach(function(element) {

        // if(validateEmail(email.value) == false){
        //     email.style.border = '1px solid red';
        //     email_hint.textContent = 'Неправильний Email';
        // }
        // if (element == 'email') {
        //     email.style.border = '1px solid red';
        //     email_hint.textContent = 'Такий Email вже використовується';
        // }
        // if(element == 'password'){
        //     if (password.value == '' || password.value == ' ') {
        //         validation(password, password_hint, "Введіть пароль", "1px solid red");
        //     } else if (password.value.length <= 7) {
        //         validation(password, password_hint, "Потрібен пароль більше 7 символів", "1px solid red");
        //     }
        // }
        // if (name.value.length < 1 && element == 'name') {
        //     validation(name, name_hint, "Введіть ім'я", "1px solid red");
        // } else {
        //     validation(name, name_hint, "", "1px solid #F2C94C");
        // }
        // if (phone.value.length <= 9 && element == 'phone') {
        //     validation(phone, phone_hint, "Введіть номер телефону", "1px solid red");
        // } else {
        //     validation(phone, phone_hint, "", "1px solid #F2C94C");
        // }

        if(element == 'terms_and_conditions'){
            if (check.checked == false){
                check_valid.style.color = "red";
                check_valid_span1.style.color = "red";
                check_valid_span2.style.color = "red";
            }
        }
    });

    function validation(valid, hint, placeholder, border_color) {
        valid.style.border = border_color;
        hint.textContent = placeholder;
    }

});
//
// $('#phone').keypress(function (event) {
//     const char = String.fromCharCode(event.which);
//     if (!(/[0-9+]/.test(char))) {
//         event.preventDefault();
//     }
// });
