CREATE SCHEMA "guest";

CREATE SCHEMA "room";

CREATE SCHEMA "room_maid";

CREATE SCHEMA "room_date";

CREATE SCHEMA "date";

CREATE TABLE "guest"."public" (
  "id" int PRIMARY KEY,
  "username" varchar,
  "id_card" varchar,
  "account" interger,
  "created_at" timestamp
);

CREATE TABLE "guest"."private" (
  "id" int PRIMARY KEY,
  "pay_method" varchar,
  "updated_on" timestamp,
  "created_at" timestamp
);

CREATE TABLE "room"."public" (
  "id" int PRIMARY KEY,
  "type" varchar,
  "total_price" integer,
  "updated_on" timestamp
);

CREATE TABLE "room"."private" (
  "id" int PRIMARY KEY,
  "room_number" integer,
  "cleaning_by" varchar,
  "cleaning_status" boolean
);

CREATE TABLE "room_maid"."private" (
  "id" int PRIMARY KEY,
  "name" varchar,
  "updated_on" timestamp
);

CREATE TABLE "room_date"."public" (
  "id" int PRIMARY KEY,
  "total_days" integer,
  "price_day" integer
);

CREATE TABLE "date"."public" (
  "id" int PRIMARY KEY,
  "chk_in" datetime,
  "chk_out" datetime
);

ALTER TABLE "guest"."public" ADD FOREIGN KEY ("id") REFERENCES "guest"."private" ("id");

CREATE TABLE "public_public" (
  "public_id" int NOT NULL,
  "public_id(1)" int NOT NULL,
  PRIMARY KEY ("public_id", "public_id(1)")
);

ALTER TABLE "public_public" ADD FOREIGN KEY ("public_id") REFERENCES "guest"."public" ("id");

ALTER TABLE "public_public" ADD FOREIGN KEY ("public_id(1)") REFERENCES "room"."public" ("id");


ALTER TABLE "room"."public" ADD FOREIGN KEY ("id") REFERENCES "room"."private" ("id");

ALTER TABLE "guest"."public" ADD FOREIGN KEY ("account") REFERENCES "room"."public" ("total_price");

CREATE TABLE "public_public(1)" (
  "public_id" int NOT NULL,
  "public_id(1)" int NOT NULL,
  PRIMARY KEY ("public_id", "public_id(1)")
);

ALTER TABLE "public_public(1)" ADD FOREIGN KEY ("public_id") REFERENCES "room"."public" ("id");

ALTER TABLE "public_public(1)" ADD FOREIGN KEY ("public_id(1)") REFERENCES "room_date"."public" ("id");


ALTER TABLE "room"."private" ADD FOREIGN KEY ("cleaning_status") REFERENCES "room_maid"."private" ("updated_on");

ALTER TABLE "room"."private" ADD FOREIGN KEY ("cleaning_by") REFERENCES "room_maid"."private" ("name");

ALTER TABLE "room_date"."public" ADD FOREIGN KEY ("total_days") REFERENCES "room"."public" ("total_price");

ALTER TABLE "room_date"."public" ADD FOREIGN KEY ("price_day") REFERENCES "room"."public" ("total_price");

ALTER TABLE "room_date"."public" ADD FOREIGN KEY ("total_days") REFERENCES "date"."public" ("chk_in");

CREATE TABLE "public_public(2)" (
  "public_chk_out" datetime NOT NULL,
  "public_total_days" integer NOT NULL,
  PRIMARY KEY ("public_chk_out", "public_total_days")
);

ALTER TABLE "public_public(2)" ADD FOREIGN KEY ("public_chk_out") REFERENCES "date"."public" ("chk_out");

ALTER TABLE "public_public(2)" ADD FOREIGN KEY ("public_total_days") REFERENCES "room_date"."public" ("total_days");

