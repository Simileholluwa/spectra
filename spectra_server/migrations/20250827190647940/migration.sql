BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "artwork" ADD COLUMN "modelNames" json;
--
-- ACTION CREATE TABLE
--
CREATE TABLE "artwork_models" (
    "id" bigserial PRIMARY KEY,
    "artworkId" bigint NOT NULL,
    "modelId" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "artworkmodels_index_idx" ON "artwork_models" USING btree ("artworkId", "modelId");

--
-- ACTION ALTER TABLE
--
DROP INDEX "posthashtags_index_idx";
CREATE UNIQUE INDEX "artworktags_index_idx" ON "artwork_tags" USING btree ("artworkId", "tagId");
--
-- ACTION ALTER TABLE
--
ALTER TABLE "model" DROP CONSTRAINT "model_fk_0";
ALTER TABLE "model" DROP COLUMN "_artworkAimodelArtworkId";
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "artwork_models"
    ADD CONSTRAINT "artwork_models_fk_0"
    FOREIGN KEY("artworkId")
    REFERENCES "artwork"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "artwork_models"
    ADD CONSTRAINT "artwork_models_fk_1"
    FOREIGN KEY("modelId")
    REFERENCES "model"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR spectra
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('spectra', '20250827190647940', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250827190647940', "timestamp" = now();

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
