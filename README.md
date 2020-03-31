[![Build Status](https://travis-ci.org/Akalaimakalai/Funbox_test_task.svg?branch=master)](https://travis-ci.org/Akalaimakalai/Funbox_test_task)

# Funbox test task

Applications for viewing the dollar to ruble exchange rate. With the ability to create your own exchange rate.

## App requirements

Реализуйте web-приложение (Rails проект), которое удовлетворяет нижеизложенным требованиям.
* Приложение содержит две страницы: / и /admin
* На странице / отображается текущий курс доллара к рублю, известный
приложению.
* Приложение фоновым скриптом периодически обновляет курс из любого
выбранного вами доступного источника (сайт CBR, главная страница
http://www.rbc.ru, и т.д.).
* При обновлении курса в приложении он обновляется на всех открытых в
текущий момент страницах /.
* На странице /admin находится форма, содержащая поле для ввода числа,
поле для ввода даты-времени и сабмит.
* При сабмите введенное число делается форсированным курсом до введённого
времени, т.е. до этого времени реальный курс игнорируется, вместо него
страницах / отображается форсированный курс.
• Страница /admin «помнит» введенные предыдущий раз значения, они
отображаются уже введенными при загрузке страницы.
• При сабмите форсированного курса он, конечно же, cразу обновляется на всех
открытых страницах /. При истечении времени действия форсированного
курса на всех страницах начинает отображаться реальный курс.
* Форма содержит разумные валидации.
* Внешний вид приложения должен быть аккуратным в рамках разумного
(например, использовать Twitter Bootstrap).
* Плюсом будет использование какого-либо JS-фреймворка на клиентской
стороне.
* Web-приложение должно корректно работать в браузерах Firefox и Chrome
последних версий.
* Код должен быть покрыт тестами.
* Все необходимое для локального запуска приложения должно быть
оформлено в виде Procfile-а для Foreman.

### Prerequisites

App uses <a href="https://www.postgresql.org/download/" target="_blank">postgresql</a> as DB.
Also, you need <a href="https://redis.io/topics/quickstart" target="_blank">redis</a> as DB for <a href="https://github.com/mperham/sidekiq" target="_blank">sidekiq</a>.

### Installing

The App can be installed with ```bin/setup``` command.

### Running

The App can be run with  ```bin/starup``` command.

## Running the tests

Tests can be run with ```rspec spec/``` command.
