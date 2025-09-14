BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "artwork" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "artwork" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "mediaUrl" text,
    "thumbnailUrl" text,
    "mediaType" text,
    "tags" json,
    "prompt" text,
    "aiModel" json NOT NULL,
    "resolution" text,
    "allowDownload" boolean DEFAULT true,
    "views" bigint DEFAULT 0,
    "likes" bigint DEFAULT 0,
    "taggedUsers" json,
    "commentsCount" bigint DEFAULT 0,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone,
    "showPrompt" boolean DEFAULT true
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "artwork"
    ADD CONSTRAINT "artwork_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR spectra
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('spectra', '20250816224027943', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250816224027943', "timestamp" = now();

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
