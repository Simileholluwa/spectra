BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "artwork_comment" (
    "id" bigserial PRIMARY KEY,
    "artworkId" bigint NOT NULL,
    "ownerId" bigint NOT NULL,
    "text" text,
    "dateCreated" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone,
    "likesCount" bigint DEFAULT 0,
    "repliesCount" bigint DEFAULT 0,
    "parentId" bigint,
    "isDeleted" boolean DEFAULT false
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "artwork_comment_likes" (
    "id" bigserial PRIMARY KEY,
    "artworkCommentId" bigint NOT NULL,
    "likedById" bigint NOT NULL,
    "dateCreated" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "artwork_comment_likes_unique_idx" ON "artwork_comment_likes" USING btree ("artworkCommentId", "likedById");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "artwork_comment"
    ADD CONSTRAINT "artwork_comment_fk_0"
    FOREIGN KEY("artworkId")
    REFERENCES "artwork"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "artwork_comment"
    ADD CONSTRAINT "artwork_comment_fk_1"
    FOREIGN KEY("ownerId")
    REFERENCES "user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "artwork_comment"
    ADD CONSTRAINT "artwork_comment_fk_2"
    FOREIGN KEY("parentId")
    REFERENCES "artwork_comment"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "artwork_comment_likes"
    ADD CONSTRAINT "artwork_comment_likes_fk_0"
    FOREIGN KEY("artworkCommentId")
    REFERENCES "artwork_comment"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "artwork_comment_likes"
    ADD CONSTRAINT "artwork_comment_likes_fk_1"
    FOREIGN KEY("likedById")
    REFERENCES "user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR spectra
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('spectra', '20250908191809584', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250908191809584', "timestamp" = now();

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
