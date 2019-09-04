//= require jquery3
//= require rails-ujs
//= require activestorage
//= require turbolinks

$(document).ready(function(){
    const email = document.getElementById('email'),
        password = document.getElementById('password'),
        password_hint = document.getElementById('password-hint'),
        email_hint = document.getElementById('email-hint');

    if ( $(".hidden").text() == "Invalid Email or password." ) {
        email.style.border = '1px solid red';
        password.style.border = '1px solid red';
        email_hint.textContent = 'Неправильний Email або Пароль';
    }
    else if($(".hidden").text() == "You have to confirm your email address before continuing.") {
        email.style.border = '1px solid red';
        email_hint.textContent = 'Підтвердіть аккаунт за допомогою листа на вашому Email';
    }
});
