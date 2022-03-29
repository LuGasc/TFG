create table if not exists social_network_user (
    id bigserial primary key,
    first_name varchar(100),
    last_name varchar(100),
    login varchar(100),
    password varchar(100),
    created_date timestamp
);
create sequence if not exists social_network_user_sequence start 1000 increment 1;

create table if not exists message (
    id bigserial primary key,
    content text,
    created_date timestamp,
    user_id bigint references social_network_user(id)
);
create sequence if not exists message_sequence start 1000 increment 1;

create table if not exists friends (
    user_id bigint not null references social_network_user(id),
    friend_id bigint not null references social_network_user(id)
);

create table if not exists image (
    id bigserial primary key,
    title varchar(100) not null,
    price varchar(100) not null,
    path text,
    hash text,
    created_date timestamp not null,
    user_id bigint references social_network_user(id)
);
create sequence if not exists image_sequence start 1000 increment 1;

create table if not exists sold (
    id bigserial primary key,
    hash text,
    user_id bigint references social_network_user(id),
    image_id bigint references image(id)
);
create sequence if not exists sold_sequence start 1000 increment 1;