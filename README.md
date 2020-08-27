# Minecraft Tape File System
 File system for Computronics streamer.  [FILE VER 0.2.4 (pre Alpha)
 
 Minecraft Tape File System 1 (MTFS, MTFS-1)

Файловая система предназначена для хранения внутриигровых данных на "кассетах" от 2х до 128 минут (от 480Кб до 30Мб соответственно)

## Глава 0.25 - что такое MTFS и зачем мне это?

1. MTFS это файловая система для хранения данных на кассетах из Computronics. 
2. Максимальная 128 -ми минутная кассета может вмещять до 30 Мегабайт данных, когда Жёсткий диск 3-го уровня из мода Opencomputers может вмещать до 4 мегабайт данных. С помощью файловой системы MTFS становится возможным удобное использование кассет, появляется возможнось хранить/записывать/считывать данные по различному местонахождению без особого труда.

## Глава 0.5 - как устроена MTFS?
 
- Запись происходит блоками по {4 - 100 Килобайт?} (и может изменяться динамически?) на всём протяжении "ленты". Каждый блок содержит в начале и конце байты - маркеры. (Подробнее - MTFS глава 2 : список маркеров и их назначение) данные кодируется в Base64 для предотвращения коллизии с маркерами. {Возможно опциональное сжатие и шифрование с замедлением скорости работы, создание массивов из "кассет"? }  
- Символы описанные ниже предназначены для большего удобства чтения. В ФС они не требуются. 
	- Если после байта счёта файлов или папок стоит больше одного указателя заголовка файла или папки, то   
	- Значения в скобках (глава2) - значения привязанные к байтам, количество байт.  
	- Значения в скобках (глава1) - привязанные байты, '{' и '}' - начало и конец ленты, '|' - начало или конец блока данных, '.' - разделитель байтов.  

## Глава 1 - структура файловой системы и реализация папок.  
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     

```
 начало "ленты"  80
 блок1          |82 88(01) 90(04) 72 6f 6f 74 (10) 30 4c 2f 51 73 4e 43 2f 30 4c 72 51 73 44 45 96(fe60000000)<нули, пока блок не станет равным 4k 83|
 блок2          |82 96(ffe0000000)<нули, пока блок не станет равным 4k 83|
 блок3          |82 89(0100)8b(01)01(0с)30 59 54 51 73 4у 43 35 30 4с 73 78 8с(?) 8d(?) 8f(14e0000000)8e<много байт, закодированных в base 64>95 96(?x5)нули, пока блок не станет равным 4k 83|
 блок4          |82 <блоки данных> 83|
 конец "ленты"   81
```

0. блок данных с корневой структурой папок.
1. блок данных с корневой структурой файлов.  
2. блок данных c файлами  
 
## Глава 2 - список-справка по маркерам (hex) MTFS.

- Base64 Reserved - 41-7a, 30-39, 2b, 2f, 3D [data]    ()
- Начало "ленты" - 80 (0)
- Конец "ленты" - 81  (0)
- Начало блока данных - 82(0)
- Конец блока данных - 83(0)
- Текущяя позиция адреса - 84(5)
- {?} позиция адреса относительно начала - 85 (5)
- Адрес относительного прыжка на следующий заголовок файла - 86 (5)
- Адрес следующего заголовка файла (глобальный) - 87 (5)
- Указатель счёта папок - 88(1)
- Указатель счёта файлов - 89 (2) 
- Байт пустых данных - 8a ((5)произвольная длинна) относительный адрес конца блока.
- [тип данных] заголовок файла-8b ((1)где находится <индекс папки, или root>, (1)произвольная длинна)
- [тип данных] время создания файла- 8c (?)
- [тип данных] время изменения файла- 8d (?)
- [тип данных] начало данных файла- 8e
- [тип данных] относиельный конец данных файла- 8f (5)
- Заголовок папки - 90 ((1)где находится, (1)произвольная длинна )
- Заголовок файла (имя в структуре папок) - 91 (((1)где находится, 1)произвольная длинна)
- {?} указатель конца счёта папок- 92(1) байт относительного прыжка в конец 
- {?} указатель конца счёта файлов- 93 (1) байт относительного прыжка в конец 
- {?} конец заголовка папки - 94
- {?} конец заголовка файла - 95 
- Пустые байты - 96 (5) адрес относительного конца
- байт размера блока (учитывая байт начала и конца блока данных) - 97 (3) байты адреса конца блока относительно байта начала 

## Глава 3 - пример интерфейса.

## Глава 4 - ?

## Глава 5 - ?

## Глава 6 - стример из куска VHS'а и палок.


## {глава - ? применение и реализация MTFS на компакт кассете в реальности? (не знаю зачем это вам вообще надо ,упорина надо меньше принимать.)}  

***дальнейшее развитие MTFS:***  

```
[в разработке]   MTFS-1 : файловая система на "кассетах" из мода Computronics
   
[запланированно] Open Computers Note Block Music (OCNBM) или подобие MIDI.
	
[запланированно] создание файла цифрового аудио (.dmm) и новый чисто музыкальный формат DMM! (Digital Minecraft Music)
	
[запланированно] MTFS-2 : поддержка сжатия и создание массивов.
   
[запланированно] MTFS-3 : поддержка шифрования.

[запланированно] MTFS-4 : оптимизация скорости работы. 

проект RTFS  : 

[запланированно] RTFS-1 : пора реализовывать в железе! (совместимо с MTFS-2)

[запланированно] RTFS-2 : Real Tape File System (совместимость с MTFS 3)

[запланированно] RTFS-3 : (NGRTFS - 0.5): глобальная оптимизация и реализация полностью в кремнии!

[запланированно] NGRTFS - 1 : (RTFS-4 , RTFS 2.0) Next Gen RTFS реализация на кусках стримера DDS : Да будет БМГ!

[запланированно] NGRTFS - 2 : оптимизация всего и вся! 

[запланированно] NGRTFS - 3 : возьмём куски от LTO или DLT. 

[запланированно] NGRTFS - 4 : оптимизация и глобальная переработка , куда же без неё.

[запланированно] NGRTFS-V : файловая система на видео плёнке! (используется только яркостный канал)

[запланированно] NGRTFS-V2 : использование каналов яркости для большей плотности данных .

(предположительный конец развития NGRTFS-V , NGRTFS и RTFS , полировка кода до идеала.) 

[?] MFTS-5? 
```
