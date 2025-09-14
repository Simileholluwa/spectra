BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "artwork" ADD COLUMN "tagNames" json;
--
-- ACTION CREATE TABLE
--
CREATE TABLE "artwork_tags" (
    "id" bigserial PRIMARY KEY,
    "artworkId" bigint NOT NULL,
    "tagId" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "posthashtags_index_idx" ON "artwork_tags" USING btree ("artworkId", "tagId");

--
-- ACTION ALTER TABLE
--
ALTER TABLE "tag" DROP CONSTRAINT "tag_fk_0";
ALTER TABLE "tag" DROP COLUMN "_artworkTagsArtworkId";
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "artwork_tags"
    ADD CONSTRAINT "artwork_tags_fk_0"
    FOREIGN KEY("artworkId")
    REFERENCES "artwork"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "artwork_tags"
    ADD CONSTRAINT "artwork_tags_fk_1"
    FOREIGN KEY("tagId")
    REFERENCES "tag"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR spectra
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('spectra', '20250827154451682', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250827154451682', "timestamp" = now();

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
