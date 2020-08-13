# Minecraft Tape File System
 File system for Computronics streamer.  [FILE VER 0.0.1 (pre Alpha)
 
 Minecraft Tape File System 1 (MTFS , MTFS-1)

файловая система предназначена для хранения внутриигровых данных на "кассетах" от 2х до 128 минут (30Мб Макс.)


глава 0.25 - что такое MTFS и зачем мне это?

MTSF это файловая система для хранения данных на кассетах из Computronics. 
максимальная 128 -ми минутная кассета может вмещять до 30 Мегабайт данных. когда Жёсткий диск 3-го уровня (Opencomputers может вмещять только 4 мегабайта данных.


глава 0.5 - как устроена MTFS?
 
запись происходит блоками по {4 - 100 Килобайт (и может изменяться динамически?)?} на всём протяжении "ленты". каждый блок содержит в начале и конце байты - маркеры. (подробнее - MTFS глава 2 : список маркеров и их назначение) данные кодируется в Base64 для предотвращения коллизии с маркерами. {возможно опциональное сжатие и шифрование с замедлением скорости работы, создание массивов из "кассет"? }


глава 1 -структура файловой системы и реализация папок.

 {?}

глава 2 - список-справка по маркерам (hex) MTFS.

Base64 Reserved - 00-3F

начало "ленты"-40

конец "ленты"-41

начало блока данных-42

конец блока данных-43

текущяя позиция адреса -44

позиция адреса относительно начала-45

адрес относительного прыжка на следующий заголовок файла-46

адрес следующего заголовка файла (глобальный)-47

указатель счёта папок-48

указатель счёта файлов-49 

байт пустых данных-4a

[тип данных] заголовок файла

[тип данных] время создания файла

[тип данных] время изменения файла 

[тип данных] начало данных файла 

[тип данных] конец данных файла 


глава 3 - ?







{глава - ? применение и реализация MTFS на компакт кассете в реальности? (не знаю зачем это вам вообще надо ,упорина надо меньше принимать.)}  

*** дальнейшее развитие MTFS: 

       [в разработке]   MTFS-1 файловая система на "кассетах" из мода Computronics
	   
       [запланированно] OPen Computers Note Block Music (OCNTB) или подобие MIDI.
		
       [запланированно] создание файла цифрового аудио (.dmm) и новый чисто музыкальный формат DMM! (Digital Minecraft Music)
		
       [запланированно] MTFS-2 поддержка сжатия и создание массивов.
	   
       [запланированно] MTFS-3 поддержка шифрования
	   
       [запланированно] MTFS-4 оптимизация скорости работы. 
	   
	   проект RTFS  : 
	   
       [запланированно] МТFS-5 или RTFS-1 : пора реализовывать в железе! (совместимо с MTFS-2)
	   
       [запланированно] RTFS-2 : Real Tape File System (совместимость с MTFS 3)
	   
       [запланированно] RTFS-3  (NGRTFS - 0.5): глобальная оптимизация и реализация полностью в кремнии!
	   
       [запланированно] NGRTFS - 1 : (RTFS-4 , RTFS 2.0) Next Gen RTFS реализация на кусках стримера DDS : Да будет БМГ!
	   
       [запланированно] NGRTFS - 2 оптимизация всего и вся! 
	   
       [запланированно] NGRTFS - 3 : возьмём куски от LTO или DLT! 
	   
       [запланированно] NGRTFS - 4 : оптимизация и глобальная переработка , куда же без неё!
	   
       [запланированно] NGRTFS-V : файловая система на видео плёнке! (используется только яркостный канал)
	   
       [запланированно] NGRTFS-V2 : использование каналов яркости для большей плотности данных .
       
       
        (предположительный конец развития NGRTFS-V , NGRTFS и RTFS , полировка кода до идеала.) 
