# Schema Information

## users
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
email           | string    | not null, unique
name            | string    | not null
password_digest | string    | not null

## sessions
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
user_id     | integer   | not null, foreign key
token       | string    | not null, unique

## listings
column name    | data type | details
---------------|-----------|-----------------------
id             | integer   | not null, primary key
owner_id       | integer   | not null, foreign key (references users)
title          | string    | not null
price          | integer   | not null
capacity       | integer   | not null
address        | string    | not null
description    | text      | not null
cover_photo_id | integer   | foreign key (references photos)
home_type_id   | integer   | not null, foreign key (references home_types)
bedrooms       | integer   | not null
beds           | integer   | not null
bathrooms      | integer   | not null

## home_types
column name    | data type | details
---------------|-----------|-----------------------
id             | integer   | not null, primary key
name           | integer   | not null, unique

## reservations
column name    | data type | details
---------------|-----------|-----------------------
id             | integer   | not null, primary key
user_id        | integer   | not null, foreign key (references users)
listing_id     | integer   | not null, foreign key (references listings)
start_date     | datetime  | not null
end_date       | datetime  | not null
status         | string    | not null, default 'PENDING'
guests         | integer   | not null

## photos
column name    | data type | details
---------------|-----------|-----------------------
id             | integer   | not null, primary key
listing_id     | integer   | not null, foreign key (references listings)
url            | string    | not null
ord            | integer   | default 0
verified       | boolean   | default false


## reviews
column name    | data type | details
---------------|-----------|-----------------------
id             | integer   | not null, primary key
listing_id     | integer   | not null, foreign key (references listings), unique combined with user_id
user_id        | string    | not null, foreign key (references users), unique combined with listing_id
body           | text      | not null
rating         | integer   | not null

## amenities
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
name        | string    | not null, unique
description | text      |

## listing_amenities
column name    | data type | details
---------------|-----------|-----------------------
id             | integer   | not null, primary key
listing_id     | integer   | not null, foreign key (references listings), unique combined with amenity_id
amenity_id     | integer   | not null, foreign key (references amenities), unique combined with listing_id
