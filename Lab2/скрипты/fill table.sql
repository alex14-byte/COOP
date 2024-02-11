INSERT INTO public."user"(login, password, first_name, last_name, surname, phone_number)
VALUES ('test_ADMIN', 'test_ADMIN', 'Алексей', 'Иванов', 'Сергеевич', '+74957556983');
INSERT INTO public."user"(login, password, first_name, last_name, surname, phone_number)
VALUES ('test_OWNER', 'test_OWNER', 'Андрей', 'Алексеев', 'Степанович', '+72347556983');
INSERT INTO public."user"(login, password, first_name, last_name, surname, phone_number)
VALUES ('test_ADMIN', 'test_ADMIN', 'Иван', 'Рыбалкин', 'Андрееевич', '+76577556983');
INSERT INTO public."user"(login, password, first_name, last_name, surname, phone_number)
VALUES ('test_OWNER', 'test_OWNER', 'Максим', 'Галкин', 'Сергеевич', '+74957556258');
INSERT INTO public."user"(login, password, first_name, last_name, surname, phone_number)
VALUES ('test_RENTER', 'test_RENTER', 'Александр', 'Лобанов', 'Александрович', '+74957555583');

INSERT INTO public.tsj(name, manager_id)
VALUES ('ТСЖ 1', 1);
INSERT INTO public.tsj(name, manager_id)
VALUES ('ТСЖ 2', 2);
INSERT INTO public.tsj(name, manager_id)
VALUES ('ТСЖ 3', 3);
INSERT INTO public.tsj(name, manager_id)
VALUES ('ТСЖ 4', 4);
INSERT INTO public.tsj(name, manager_id)
VALUES ('ТСЖ 5', 5);



INSERT INTO public.address(city, street, house_number, tsj_id)
VALUES ('Москва', 'ул. Академика Семёнова', 1, 1);
INSERT INTO public.address(city, street, house_number, tsj_id)
VALUES ('Санкт-Петербург', 'ул. Береговая', 1, 2);
INSERT INTO public.address(city, street, house_number, tsj_id)
VALUES ('Пермь', 'ул. Амурская', 1, 3);
INSERT INTO public.address(city, street, house_number, tsj_id)
VALUES ('Екатеринбург', 'ул. Воловья', 1, 4);
INSERT INTO public.address(city, street, house_number, tsj_id)
VALUES ('Москва', 'ул. Авиаторов', 1, 5);


INSERT INTO public.flat("number", address_id)
VALUES (1, 1);
INSERT INTO public.flat("number", address_id)
VALUES (1, 2);
INSERT INTO public.flat("number", address_id)
VALUES (1, 3);
INSERT INTO public.flat("number", address_id)
VALUES (1, 4);
INSERT INTO public.flat("number", address_id)
VALUES (1, 5);


INSERT INTO public.user_in_flat(user_id, flat_id, role)
VALUES (1, 1, 'ADMIN');
INSERT INTO public.user_in_flat(user_id, flat_id, role)
VALUES (2, 2, 'MANAGER');
INSERT INTO public.user_in_flat(user_id, flat_id, role)
VALUES (3, 3, 'MANAGER');
INSERT INTO public.user_in_flat(user_id, flat_id, role)
VALUES (4, 4, 'MANAGER');
INSERT INTO public.user_in_flat(user_id, flat_id, role)
VALUES (5, 5, 'MANAGER');


INSERT INTO public.provider(name, contact)
VALUES ('GAZPROM', '+71234567891');
INSERT INTO public.provider(name, contact)
VALUES ('OOOAAA', '+74957555583');
INSERT INTO public.provider(name, contact)
VALUES ('BEST_PROVIDER', '+74957556258');
INSERT INTO public.provider(name, contact)
VALUES ('PROVIDER#1', '+74957556983');
INSERT INTO public.provider(name, contact)
VALUES ('PROVIDER2', '+74957556258');

INSERT INTO public.resource(name, price, provider_id)
VALUES ('GAZ', 99.99, 1);
INSERT INTO public.resource(name, price, provider_id)
VALUES ('WATER', 199.99, 2);
INSERT INTO public.resource(name, price, provider_id)
VALUES ('ELECTRICITY', 299.99, 3);
INSERT INTO public.resource(name, price, provider_id)
VALUES ('GAZ', 399.99, 4);
INSERT INTO public.resource(name, price, provider_id)
VALUES ('WATER', 499.99, 5);

INSERT INTO public.meter(serial_number, resource_id, installation_date, flat_id)
VALUES ('SERIAL_1', 1, CURRENT_DATE, 1);
INSERT INTO public.meter(serial_number, resource_id, installation_date, flat_id)
VALUES ('SERIAL_2', 2, CURRENT_DATE, 2);
INSERT INTO public.meter(serial_number, resource_id, installation_date, flat_id)
VALUES ('SERIAL_3', 3, CURRENT_DATE, 3);
INSERT INTO public.meter(serial_number, resource_id, installation_date, flat_id)
VALUES ('SERIAL_4', 4, CURRENT_DATE, 4);
INSERT INTO public.meter(serial_number, resource_id, installation_date, flat_id)
VALUES ('SERIAL_5', 5, CURRENT_DATE, 5);

INSERT INTO public.value_history(value, meter_id, cost)
VALUES ('10.55', 1, 0);
INSERT INTO public.value_history(value, meter_id, cost)
VALUES ('100.44', 2, 99);
INSERT INTO public.value_history(value, meter_id, cost)
VALUES ('25.23', 3, 99);
INSERT INTO public.value_history(value, meter_id, cost)
VALUES ('555.666', 4, 99);
INSERT INTO public.value_history(value, meter_id, cost)
VALUES ('123.32', 5, 99);