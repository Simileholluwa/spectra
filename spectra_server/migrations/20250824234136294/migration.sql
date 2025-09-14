BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "likes" CASCADE;

--
-- ACTION ALTER TABLE
--
DROP INDEX "artwork_id_unique_idx";
CREATE UNIQUE INDEX "artwork_downloads_unique_idx" ON "artwork_downloads" USING btree ("artworkId", "downloadedById");
--
-- ACTION ALTER TABLE
--
DROP INDEX "post_id_unique_idx";
CREATE UNIQUE INDEX "artwork_likes_unique_idx" ON "artwork_likes" USING btree ("artworkId", "likedById");
--
-- ACTION CREATE TABLE
--
CREATE TABLE "artwork_views" (
    "id" bigserial PRIMARY KEY,
    "artworkId" bigint NOT NULL,
    "viewedById" bigint NOT NULL,
    "dateCreated" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "artwork_views_unique_idx" ON "artwork_views" USING btree ("artworkId", "viewedById");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "artwork_views"
    ADD CONSTRAINT "artwork_views_fk_0"
    FOREIGN KEY("artworkId")
    REFERENCES "artwork"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "artwork_views"
    ADD CONSTRAINT "artwork_views_fk_1"
    FOREIGN KEY("viewedById")
    REFERENCES "user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR spectra
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('spectra', '20250824234136294', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250824234136294', "timestamp" = now();

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
