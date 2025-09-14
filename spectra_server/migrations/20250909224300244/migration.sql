BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "artwork" DROP CONSTRAINT "artwork_fk_0";
--
-- ACTION ALTER TABLE
--
ALTER TABLE "artwork_comment" DROP CONSTRAINT "artwork_comment_fk_0";
ALTER TABLE "artwork_comment" DROP CONSTRAINT "artwork_comment_fk_1";
--
-- ACTION ALTER TABLE
--
ALTER TABLE "artwork_comment_likes" DROP CONSTRAINT "artwork_comment_likes_fk_1";
--
-- ACTION ALTER TABLE
--
ALTER TABLE "artwork_downloads" DROP CONSTRAINT "artwork_downloads_fk_1";
--
-- ACTION ALTER TABLE
--
ALTER TABLE "artwork_likes" DROP CONSTRAINT "artwork_likes_fk_1";
--
-- ACTION ALTER TABLE
--
ALTER TABLE "artwork_views" DROP CONSTRAINT "artwork_views_fk_1";
--
-- ACTION ALTER TABLE
--
ALTER TABLE "user" DROP CONSTRAINT "user_fk_0";
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "artwork"
    ADD CONSTRAINT "artwork_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "user"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "artwork_comment"
    ADD CONSTRAINT "artwork_comment_fk_0"
    FOREIGN KEY("artworkId")
    REFERENCES "artwork"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "artwork_comment"
    ADD CONSTRAINT "artwork_comment_fk_1"
    FOREIGN KEY("ownerId")
    REFERENCES "user"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "artwork_comment_likes"
    ADD CONSTRAINT "artwork_comment_likes_fk_1"
    FOREIGN KEY("likedById")
    REFERENCES "user"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "artwork_downloads"
    ADD CONSTRAINT "artwork_downloads_fk_1"
    FOREIGN KEY("downloadedById")
    REFERENCES "user"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "artwork_likes"
    ADD CONSTRAINT "artwork_likes_fk_1"
    FOREIGN KEY("likedById")
    REFERENCES "user"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "artwork_views"
    ADD CONSTRAINT "artwork_views_fk_1"
    FOREIGN KEY("viewedById")
    REFERENCES "user"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "user"
    ADD CONSTRAINT "user_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR spectra
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('spectra', '20250909224300244', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250909224300244', "timestamp" = now();

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
