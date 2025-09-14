BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "artwork_comment" DROP CONSTRAINT "artwork_comment_fk_2";
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "artwork_comment"
    ADD CONSTRAINT "artwork_comment_fk_2"
    FOREIGN KEY("parentId")
    REFERENCES "artwork_comment"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR spectra
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('spectra', '20250912195842105', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250912195842105', "timestamp" = now();

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
