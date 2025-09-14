BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "artwork" DROP COLUMN "tags";
ALTER TABLE "artwork" DROP COLUMN "aiModel";
ALTER TABLE "artwork" DROP COLUMN "mediaType";
ALTER TABLE "artwork" ADD COLUMN "mediaType" bigint;
--
-- ACTION CREATE TABLE
--
CREATE TABLE "model" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "usageCount" bigint DEFAULT 1,
    "_artworkAimodelArtworkId" bigint
);

--
-- ACTION ALTER TABLE
--
ALTER TABLE "tag" DROP COLUMN "createdAt";
ALTER TABLE "tag" ADD COLUMN "_artworkTagsArtworkId" bigint;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "model"
    ADD CONSTRAINT "model_fk_0"
    FOREIGN KEY("_artworkAimodelArtworkId")
    REFERENCES "artwork"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "tag"
    ADD CONSTRAINT "tag_fk_0"
    FOREIGN KEY("_artworkTagsArtworkId")
    REFERENCES "artwork"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR spectra
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('spectra', '20250825104449942', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250825104449942', "timestamp" = now();

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
