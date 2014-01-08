# Patterns For Large-Scale JavaScript Application Architecture
#### Addy Osmani

Перевод на русский язык. Addy Osmani [в курсе][1].

### Запуск сайта локально

    
    cd project-directory/
    # Один раз установить зависимости
    bundle install
    # Запустить блог. Будет доступен на 4000-м порту localhost'а
    jekyll serve --watch


### Файлы перевода

Главы на английском языке и на русском лежат в [здесь][2]

### Гайдлайн

Мы придерживаемся гайдлайна по оформлению markdown от Frontender Magazine.
Ознакомиться с ним можно [здесь][3]



### Верстка и все такое

    # Запуск Stylus
    stylus -w -o assets/css/ ./_stylus/main.styl

    # Запуск jekyll
    jekyll serve --watch


[1]: https://twitter.com/addyosmani/status/415195066895171584
[2]: https://github.com/shuvalov-anton/Patterns-For-Large-Scale-JavaScript-Application-Architecture/tree/gh-pages/_includes/translation
[3]: https://github.com/FMRobot/FM-guidelines
