BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "tag" ALTER COLUMN "usageCount" DROP NOT NULL;
ALTER TABLE "tag" ALTER COLUMN "usageCount" SET DEFAULT 1;
ALTER TABLE "tag" ALTER COLUMN "createdAt" DROP NOT NULL;
ALTER TABLE "tag" ALTER COLUMN "createdAt" SET DEFAULT CURRENT_TIMESTAMP;

--
-- MIGRATION VERSION FOR spectra
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('spectra', '20250823124959674', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250823124959674', "timestamp" = now();

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
