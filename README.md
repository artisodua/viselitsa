# Игра "Виселица"

Описание:
Игра для двуих человек.
Количсетво попыток угадать букву - 7 (повторно не правильно введенные буквы не учитываются как ошибки ввода)

Один из игроков загадывает слово, при запуске программы .../ruby viselitsa.rb <Ваше слово> 
Если слово не загадали то программа берет произвольное слово из файла. 
Рисуется устрашающая виселица.

Второй игрок вводит букву, которая может входить в это слово. 
Если такая буква есть в слове, то программа записывает её над соответствующими этой букве чертами — столько раз, сколько она встречается 
в слове. Если такой буквы нет, то изображение виселици меняеться, и дорисовывается часть человекау. 
Второй игрок продолжает отгадывать буквы до тех пор, пока не отгадает всё слово. 
За каждый неправильный ответ прогрмамма добавляет одну часть туловища к виселице.
Их 6: голова, туловище, 2 руки и 2 ноги, последный седьмой промах затягивает петлю на шее, и выдает сообщение что Вы проиграли.
Если игроку удаётся угадать слово, он выигрывает и может загадывать слово.

КАК ДОБАВИТЬ СЛОВА В ФАЙЛ:
1. Для начала нужно зайти впапку "data"
2. Открыть файл words.txt
3. С новой строки добавить нужные Вам слова
4. Сохранить файл в кодировке UTF-8

Приятной Вам игры)