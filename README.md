# Паттерны для масштабируемых JavaScript-приложений

Перевод на русский язык. Эдди Османи [в курсе][1].

## Участники

    project  : largescaleJS_ru
    repo age : 3 months
    active   : 57 days
    commits  : 405
    files    : 140
    authors  : 
        295  Shuvalov Anton          72.8%
         45  Vladimir Starkov        11.1%
         22  Rakhim Davletkaliyev    5.4%
         10  andreyr82               2.5%
          7  FMRobot                 1.7%
          7  Maxim Gladkih           1.7%
          4  Nikita Bayev            1.0%
          2  theghostbel             0.5%
          2  Sergei Khaletskiy       0.5%
          2  Vlad Tsepelev           0.5%
          1  Mikhail Baranov         0.2%
          1  Andrew                  0.2%
          1  Vladimir                0.2%
          1  Artem Sapegin           0.2%
          1  Andrey Rachkov          0.2%
          1  croupier                0.2%
          1  finico                  0.2%
          1  rakeev                  0.2%
          1  Vadim Makeev            0.2%


## Разработчикам

Главы на английском языке и на русском лежат в директории *[./_includes/translation/][2]*

В оформлении markdown мы стараемся придерживаться [правил][3] от Frontender Magazine.

Локально сайт можно запустить примерно так:

    git clone https://github.com/shuvalov-anton/largescaleJS_ru.git largescalejs
    cd $_
    bundle install
    stylus -w -o assets/css/ ./_stylus/main.styl
    jekyll serve --watch

Версия для электронных книг, к сожалению, совершенно не зависит от других файлов.
Собирать новые книги так:

    cd ./epub
    pandoc epub.md -o largescale-js.epub --toc-depth=2 --epub-cover-image=cover.jpg --epub-chapter-level=2
    pandoc epub.md -o largescale-js.fb2 --toc-depth=2 --epub-cover-image=cover.jpg --epub-chapter-level=2
    kindleGen -c1 -locale ru  largescale-js.epub -o largescale-js.mobi

[1]: https://twitter.com/addyosmani/status/415195066895171584
[2]: https://github.com/shuvalov-anton/Patterns-For-Large-Scale-JavaScript-Application-Architecture/tree/gh-pages/_includes/translation
[3]: https://github.com/FMRobot/FM-guidelines
