﻿#language: ru



Функционал: создание документа Поступления товара

Как Менеджер по закупкам я хочу
создание документа Поступления товара
чтобы поставить товар на учет   
Контекст: 
Дано Я открыл новый сеанс TestClient или подключил уже существующий


Сценарий: создание документа Поступления товара
// создание документа
* открытие формы создания документа
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Закупки' 'Поступления товаров'
	Тогда открылось окно 'Поступления товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Поступление товара (создание)'
* заполнение шапки документа
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Большой'
	Тогда элемент формы с именем "Склад" стал равен 'Большой'
	И я нажимаю кнопку выбора у поля с именем "Поставщик"
	Тогда открылось окно 'Контрагенты'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000006' | 'Пантера АО'   |
	И я нажимаю на кнопку с именем 'ФормаВыбрать'
	Тогда открылось окно 'Поступление товара (создание) *'
* заполнение товарной части
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И в таблице  "Список" я перехожу на один уровень вниз
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000007' | 'Сланцы'       |
	И я нажимаю на кнопку с именем 'ФормаВыбрать'
	Тогда открылось окно 'Поступление товара (создание) *'
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '10,00'
	И в таблице "Товары" я завершаю редактирование строки
* проверка заполнения табличной части
	Тогда таблица "Товары" содержит строки:
		| 'Товар'  | 'Артикул'  | 'Цена'   | 'Количество' | 'Сумма'    |
		| 'Сланцы' | 'ОБ-00055' | '*' | '10,00'      | '3 000,00' |
	И я нажимаю на кнопку "Записать"
* номер
	И я запоминаю значение поля "Номер" как "$Номер$"
* проведение документа
И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
И я жду закрытия окна 'Поступление товара (создание) *' в течение 20 секунд
* проверка создания документа
	И таблица "Список" содержит строки:
		| 'Номер' | 
		| $Номер$ |

Сценарий: 	проверка наличия в справочнике номенклатуры Сланцы
И В командном интерфейсе я выбираю 'Продажи' 'Товары'
Тогда открылось окно 'Товары'
И я нажимаю на кнопку с именем 'ФормаСписок'
	И таблица "Список" содержит строки:
		| 'Наименование' | 
		| Сланцы |