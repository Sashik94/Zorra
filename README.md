# Zorra

Тестовое задание IOS

Задача

Реализовать мобильное приложение для платформы ios на базе публичного АПИ Punk API

    https://punkapi.com/documentation/v2

Состав приложения:

1 Главный экран с постраничной загрузкой данных 

    https://api.punkapi.com/v2/beers?page=2&per_page=80

    Должен представлять собой UITableView/UICollection view с UIRefreshControl.

    Ячейки в списке должны содержать

    название (поле name)

    фотографию (поле image_url)

    При нажатии на ячейку должен открываться детальный экран

2 Детальный экран

    Содержит фото, название и описание пива (поле description)

    Требования:

      - Язык программирования: Swift
      - Архитектура - желательно не MVC
      - Не использовать Interface Builder для построения интерфейса
      - Можно использовать вспомогательные библиотеки (Alamofire и т.п.)
      - Дизайн – на ваше усмотрение, верстка на Autolayout, можно использовать сторонние DSL (SnapKit и т.п.)
      - Будет плюсом поддержка тёмной темы оформления
      - Реализованное задание загрузите на github или bitbucket
