//= require rails-ujs
//= require activestorage
//= require turbolinks

document.getElementById('submit').onclick = function (e) {
    const email = document.getElementById('email'),
        password = document.getElementById('password'),
        password_hint = document.getElementById('password-hint'),
        email_hint = document.getElementById('email-hint'),
        re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

    e.preventDefault();
    if (password.value.length <= 7) {
        password.style.border = '1px solid red';
        password_hint.textContent = 'Неправильний пароль';
    } else {
        password.style.border = 'none';
        password_hint.textContent = '';
    }
    if (!re.test(String(email.value).toLowerCase())) {
        email.style.border = '1px solid red';
        email_hint.textContent = 'Неправильний Email';
    } else {
        email.style.border = 'none';
        email_hint.textContent = '';
    }
    if(email_hint.textContent === '' && email_hint.textContent === ''){
        console.log(email.value, password.value)
    }
};
