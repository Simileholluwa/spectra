BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "artwork" ADD COLUMN "downloads" bigint DEFAULT 0;
--
-- ACTION CREATE TABLE
--
CREATE TABLE "artwork_downloads" (
    "id" bigserial PRIMARY KEY,
    "artworkId" bigint NOT NULL,
    "downloadedById" bigint NOT NULL,
    "dateCreated" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "artwork_id_unique_idx" ON "artwork_downloads" USING btree ("artworkId", "downloadedById");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "artwork_likes" (
    "id" bigserial PRIMARY KEY,
    "artworkId" bigint NOT NULL,
    "likedById" bigint NOT NULL,
    "dateCreated" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "post_id_unique_idx" ON "artwork_likes" USING btree ("artworkId", "likedById");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "artwork_downloads"
    ADD CONSTRAINT "artwork_downloads_fk_0"
    FOREIGN KEY("artworkId")
    REFERENCES "artwork"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "artwork_downloads"
    ADD CONSTRAINT "artwork_downloads_fk_1"
    FOREIGN KEY("downloadedById")
    REFERENCES "user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "artwork_likes"
    ADD CONSTRAINT "artwork_likes_fk_0"
    FOREIGN KEY("artworkId")
    REFERENCES "artwork"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "artwork_likes"
    ADD CONSTRAINT "artwork_likes_fk_1"
    FOREIGN KEY("likedById")
    REFERENCES "user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR spectra
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('spectra', '20250824014311220', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250824014311220', "timestamp" = now();

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
