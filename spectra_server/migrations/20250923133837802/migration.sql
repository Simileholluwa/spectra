BEGIN;

--
-- ACTION ALTER TABLE
--
CREATE UNIQUE INDEX "follower_unique_index" ON "follower" USING btree ("followerId", "followingId");

--
-- MIGRATION VERSION FOR spectra
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('spectra', '20250923133837802', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250923133837802', "timestamp" = now();

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
