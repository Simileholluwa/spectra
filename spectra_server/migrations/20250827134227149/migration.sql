BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "tag" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "tag" (
    "id" bigserial PRIMARY KEY,
    "artworkId" bigint NOT NULL,
    "name" text NOT NULL,
    "usageCount" bigint DEFAULT 1
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "tag"
    ADD CONSTRAINT "tag_fk_0"
    FOREIGN KEY("artworkId")
    REFERENCES "artwork"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR spectra
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('spectra', '20250827134227149', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250827134227149', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240520102713718', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240520102713718', "timestamp" = now();


COMMIT;
