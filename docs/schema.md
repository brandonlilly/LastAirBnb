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

## listings
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
owner_id    | integer   | not null, foreign key (references users)
title       | string    | not null
price       | integer   | not null
capacity    | integer   | not null
address     | integer   | not null
description | text      | not null

## bookings
column name    | data type | details
---------------|-----------|-----------------------
id             | integer   | not null, primary key
user_id        | integer   | not null, foreign key (references users)
listing_id     | integer   | not null, foreign key (references listings)
check_in_date  | datetime  | not null
check_out_date | datetime  | not null

## photos
column name    | data type | details
---------------|-----------|-----------------------
id             | integer   | not null, primary key
listing_id     | integer   | not null, foreign key (references listings)
url            | string    | not null

## reviews
column name    | data type | details
---------------|-----------|-----------------------
id             | integer   | not null, primary key
listing_id     | integer   | not null, foreign key (references listings)
user_id        | string    | not null, foreign key (references users)
body           | text      | not null
stars          | integer   |

## amenities
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
name        | string    | not null
description | text      |

## listing_amenities
column name    | data type | details
---------------|-----------|-----------------------
id             | integer   | not null, primary key
listing_id     | integer   | not null, foreign key (references listings), unique w/ amenity_id
amenity_id     | integer   | not null, foreign key (references amenities)
