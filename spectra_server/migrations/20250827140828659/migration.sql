BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "tag" DROP CONSTRAINT "tag_fk_0";
ALTER TABLE "tag" DROP COLUMN "artworkId";
ALTER TABLE "tag" ADD COLUMN "_artworkTagsArtworkId" bigint;
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
    VALUES ('spectra', '20250827140828659', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250827140828659', "timestamp" = now();

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
