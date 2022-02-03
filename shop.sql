--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 13.4

-- Started on 2021-12-26 23:53:33

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 206 (class 1259 OID 16521)
-- Name: _order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._order (
    id_order integer NOT NULL,
    id_client integer NOT NULL,
    registration_date date NOT NULL,
    delivery_date date NOT NULL,
    id_delivery_code integer NOT NULL,
    price_of_delivery numeric NOT NULL,
    CONSTRAINT _order_check CHECK (((id_order > 0) AND (id_client > 0) AND (id_delivery_code > 0))),
    CONSTRAINT check_dates CHECK ((registration_date < delivery_date))
);


ALTER TABLE public._order OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16496)
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    id_client integer NOT NULL,
    city character(100) NOT NULL,
    person_contact character(50) NOT NULL,
    email character(50) NOT NULL,
    id_payment_code integer,
    street character(100),
    house character(20),
    CONSTRAINT client_id_client_check CHECK ((id_client > 0))
);


ALTER TABLE public.client OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16527)
-- Name: delivery; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.delivery (
    id_delivery_code integer NOT NULL,
    delivery_method character(30) NOT NULL,
    CONSTRAINT delivery_id_delivery_code_check CHECK ((id_delivery_code > 0))
);


ALTER TABLE public.delivery OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16471)
-- Name: order_strings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_strings (
    id_order integer NOT NULL,
    order_numbers integer NOT NULL,
    id_item integer NOT NULL,
    count integer NOT NULL,
    CONSTRAINT order_strings_check CHECK (((id_order > 0) AND (order_numbers > 0) AND (id_item > 0) AND (count > 0)))
);


ALTER TABLE public.order_strings OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16639)
-- Name: payment_method; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_method (
    id_payment_code integer NOT NULL,
    payment_method character(30)
);


ALTER TABLE public.payment_method OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16462)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id_item integer NOT NULL,
    name character varying(150),
    count integer,
    purchase_price numeric,
    sale_price numeric,
    CONSTRAINT products_check CHECK (((id_item > 0) AND (count > 0)))
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16511)
-- Name: purchase_strings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purchase_strings (
    id_purchases integer NOT NULL,
    strings_number integer NOT NULL,
    id_item integer NOT NULL,
    count integer NOT NULL,
    CONSTRAINT purchase_strings_check CHECK (((id_purchases > 0) AND (strings_number > 0) AND (id_item > 0) AND (count > 0)))
);


ALTER TABLE public.purchase_strings OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16537)
-- Name: purchases; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purchases (
    id_purchases integer NOT NULL,
    date_time timestamp without time zone NOT NULL,
    id_supplier integer NOT NULL,
    CONSTRAINT purchases_id_purchases_check CHECK ((id_purchases > 0))
);


ALTER TABLE public.purchases OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16486)
-- Name: supplier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supplier (
    id_supplier integer NOT NULL,
    address character(200) NOT NULL,
    person_contact character(50) NOT NULL,
    email character(60) NOT NULL,
    CONSTRAINT supplier_id_supplier_check CHECK ((id_supplier > 0))
);


ALTER TABLE public.supplier OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16506)
-- Name: tracking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tracking (
    id_tracking integer NOT NULL,
    id_order integer NOT NULL,
    order_status character(20) NOT NULL,
    location character(100) NOT NULL,
    CONSTRAINT tracking_check CHECK (((id_tracking > 0) AND (id_order > 0)))
);


ALTER TABLE public.tracking OWNER TO postgres;

--
-- TOC entry 3057 (class 0 OID 16521)
-- Dependencies: 206
-- Data for Name: _order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._order (id_order, id_client, registration_date, delivery_date, id_delivery_code, price_of_delivery) FROM stdin;
1	3	2021-09-14	2021-09-16	2	0.00
2	1	2021-09-15	2021-09-18	1	290.00
3	4	2021-10-02	2021-10-03	2	0.00
4	5	2021-10-07	2021-10-09	1	290.00
5	2	2021-10-13	2021-10-14	2	0.00
6	6	2021-10-18	2021-10-25	3	250.00
\.


--
-- TOC entry 3054 (class 0 OID 16496)
-- Dependencies: 203
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client (id_client, city, person_contact, email, id_payment_code, street, house) FROM stdin;
1	Обнинск\n\n                                                                                           	89206363022                                       	PotapkinDA@gmail.com                              	1	проспект Ленина 69                                                                                  	303                 
7	Обнинск                                                                                             	89104862544                                       	PupkinVA@yandex.ru                                	2	пр-кт Ленина 36                                                                                     	38                  
4	Обнинск                                                                                             	89207126381                                       	AlexanderKyznetcov@mail.ru                        	2	пр-кт Маркса д. 22                                                                                  	4                   
5	Обнинск                                                                                             	89007424357                                       	MilashkaMashka@yandex.ru                          	4	ул. Гагарина д. 21                                                                                  	51                  
6	Москва                                                                                              	89131678512                                       	KomissarovTema@gmail.com                          	3	ул. Намёткина д.12                                                                                  	42                  
2	Обнинск                                                                                             	89205758603                                       	IvanovaMaria1987@yandex.ru                        	5	ул. Красных Зорь д. 25/3                                                                            	125                 
3	Обнинск                                                                                             	89007491497                                       	LeonidKiller@gmail.com                            	1	ул. Курчатова 15                                                                                    	38                  
\.


--
-- TOC entry 3058 (class 0 OID 16527)
-- Dependencies: 207
-- Data for Name: delivery; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.delivery (id_delivery_code, delivery_method) FROM stdin;
1	Курьером                      
2	Самовывоз                     
3	Почтой                        
\.


--
-- TOC entry 3052 (class 0 OID 16471)
-- Dependencies: 201
-- Data for Name: order_strings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_strings (id_order, order_numbers, id_item, count) FROM stdin;
1	1	5	1
2	1	14	1
2	2	17	1
3	1	9	1
4	1	10	1
5	1	17	1
5	2	18	1
6	1	14	1
\.


--
-- TOC entry 3060 (class 0 OID 16639)
-- Dependencies: 209
-- Data for Name: payment_method; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_method (id_payment_code, payment_method) FROM stdin;
1	Курьеру наличными             
2	Курьеру банковской картой     
3	Банковской картой на сайте    
4	Apple Pay, Google Pay         
5	Картой при получении          
6	Наличными при получении       
\.


--
-- TOC entry 3051 (class 0 OID 16462)
-- Dependencies: 200
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id_item, name, count, purchase_price, sale_price) FROM stdin;
4	Xbox One X 1000 ГБ HDD	5	15999.00	52990.00
5	Xbox One X 1000 ГБ HDD + Cyberpunk 2077 Limited Edition + Game Pass Ultimate 1 месяц	10	19990.00	59990.00
6	Sony PlayStation 4 Slim 500 ГБ HDD	20	14999.00	44790.00
7	Sony PlayStation 4 Slim 1000 ГБ HDD + Gran Turismo Sport + Horizon Zero Dawn + Marvel Человек Паук + PS PLUS 3 месяца	10	29990.00	65990.00
8	Sony PlayStation 4 Pro 1000 ГБ HDD	5	37990.00	78990.00
9	Sony PlayStation 5 Digital Edition	50	27999.00	46499.00
10	Sony PlayStation 5	100	35990.00	57990.00
11	Nintendo Switch 32 ГБ	120	13990.00	23499.00
12	Nintendo Switch Lite 32 ГБ бирюзовый	75	6490.00	15499.00
13	Nintendo Switch Lite 32 ГБ синий	55	6490.00	15499.00
14	Nintendo Switch Lite 32 ГБ желтый	30	6490.00	15499.00
15	Nintendo Switch Lite 32 ГБ розовый	75	6490.00	15499.00
16	Nintendo Switch Lite 32 ГБ серый	30	6490.00	15499.00
17	Геймпад Microsoft Xbox Wireless Controller белый	30	2099.00	5599.00
18	Геймпад Microsoft Xbox Wireless Controller черный	10	2099.00	5599.00
19	Геймпад PlayStation DualSense for PS5 черный	20	1790.00	4899.00
1	Xbox Series S 512 ГБ SSD	200	18999.00	30799.00
2	Xbox Series X 1000 ГБ SSD	150	39999.00	62989.00
3	Xbox One S 1000 ГБ HDD + игра Forza Horizon 4	25	11499.00	20900.00
\.


--
-- TOC entry 3056 (class 0 OID 16511)
-- Dependencies: 205
-- Data for Name: purchase_strings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.purchase_strings (id_purchases, strings_number, id_item, count) FROM stdin;
1	1	2	20
1	2	4	10
1	3	8	15
2	1	1	30
2	2	2	10
3	1	12	20
\.


--
-- TOC entry 3059 (class 0 OID 16537)
-- Dependencies: 208
-- Data for Name: purchases; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.purchases (id_purchases, date_time, id_supplier) FROM stdin;
1	2021-09-12 00:00:00	2
2	2021-09-23 00:00:00	1
3	2021-10-11 00:00:00	2
4	2021-10-20 00:00:00	2
5	2021-11-13 00:00:00	3
6	2021-11-28 00:00:00	1
7	2021-12-14 00:00:00	3
\.


--
-- TOC entry 3053 (class 0 OID 16486)
-- Dependencies: 202
-- Data for Name: supplier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supplier (id_supplier, address, person_contact, email) FROM stdin;
1	г. Норильск, ул. Бегичева д. 19, пом. 324                                                                                                                                                               	Иксбоксов Андрей Витальевич                       	XboxAndrew@yandex.ru                                        
2	г. Москва ул. Новочеремушкинская 46                                                                                                                                                                     	Плейштейшн Игорь Александрович                    	Playstationmsk@mail.ru                                      
3	г. Калуга ул. Гагарина 36                                                                                                                                                                               	Нинтендо Федор Алексеевич                         	Nintendokaluga40@yandex.ru                                  
\.


--
-- TOC entry 3055 (class 0 OID 16506)
-- Dependencies: 204
-- Data for Name: tracking; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tracking (id_tracking, id_order, order_status, location) FROM stdin;
2	2	Заказ прибыл        	Курьер Вас ожидает                                                                                  
3	3	Заказ в пути        	Сортировка на складе Коледино                                                                       
4	4	Заказ прибыл        	Курьер Вас ожидает                                                                                  
5	5	Заказ в пути        	Сортировка на складе Коледино                                                                       
6	6	Заказ прибыл        	Отделение почты № 1                                                                                 
1	1	Заказ в пути        	Склад Коледино                                                                                      
\.


--
-- TOC entry 2909 (class 2606 OID 16607)
-- Name: _order _order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._order
    ADD CONSTRAINT _order_pkey PRIMARY KEY (id_order, id_client);


--
-- TOC entry 2903 (class 2606 OID 16624)
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id_client);


--
-- TOC entry 2911 (class 2606 OID 16531)
-- Name: delivery delivery_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT delivery_pkey PRIMARY KEY (id_delivery_code);


--
-- TOC entry 2899 (class 2606 OID 16475)
-- Name: order_strings order_srtings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_strings
    ADD CONSTRAINT order_srtings_pkey PRIMARY KEY (id_order, order_numbers);


--
-- TOC entry 2915 (class 2606 OID 16643)
-- Name: payment_method payment_method_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_method
    ADD CONSTRAINT payment_method_pkey PRIMARY KEY (id_payment_code);


--
-- TOC entry 2897 (class 2606 OID 16466)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id_item);


--
-- TOC entry 2907 (class 2606 OID 16655)
-- Name: purchase_strings purchase_strings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_strings
    ADD CONSTRAINT purchase_strings_pkey PRIMARY KEY (id_purchases, strings_number);


--
-- TOC entry 2913 (class 2606 OID 16541)
-- Name: purchases purchases_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT purchases_pkey PRIMARY KEY (id_purchases);


--
-- TOC entry 2901 (class 2606 OID 16490)
-- Name: supplier supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (id_supplier);


--
-- TOC entry 2905 (class 2606 OID 16510)
-- Name: tracking tracking_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracking
    ADD CONSTRAINT tracking_pkey PRIMARY KEY (id_tracking, id_order);


--
-- TOC entry 2919 (class 2606 OID 16532)
-- Name: _order fk_id_delivery_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._order
    ADD CONSTRAINT fk_id_delivery_code FOREIGN KEY (id_delivery_code) REFERENCES public.delivery(id_delivery_code);


--
-- TOC entry 2916 (class 2606 OID 16491)
-- Name: order_strings fk_id_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_strings
    ADD CONSTRAINT fk_id_item FOREIGN KEY (id_item) REFERENCES public.products(id_item);


--
-- TOC entry 2918 (class 2606 OID 16516)
-- Name: purchase_strings fk_id_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_strings
    ADD CONSTRAINT fk_id_item FOREIGN KEY (id_item) REFERENCES public.products(id_item);


--
-- TOC entry 2917 (class 2606 OID 16649)
-- Name: client fk_id_payment_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT fk_id_payment_code FOREIGN KEY (id_payment_code) REFERENCES public.payment_method(id_payment_code);


--
-- TOC entry 2920 (class 2606 OID 16542)
-- Name: purchases fk_id_supplier; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT fk_id_supplier FOREIGN KEY (id_supplier) REFERENCES public.supplier(id_supplier);


-- Completed on 2021-12-26 23:53:34

--
-- PostgreSQL database dump complete
--

