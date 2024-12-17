/*
  Warnings:

  - A unique constraint covering the columns `[playerId]` on the table `Birth` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[playerId]` on the table `Height` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[playerId]` on the table `League` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[playerId]` on the table `NBA` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[playerId]` on the table `Weight` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `playerId` to the `Birth` table without a default value. This is not possible if the table is not empty.
  - Added the required column `playerId` to the `Height` table without a default value. This is not possible if the table is not empty.
  - Added the required column `playerId` to the `League` table without a default value. This is not possible if the table is not empty.
  - Added the required column `playerId` to the `NBA` table without a default value. This is not possible if the table is not empty.
  - Added the required column `playerId` to the `Weight` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Player" DROP CONSTRAINT "Player_birthId_fkey";

-- DropForeignKey
ALTER TABLE "Player" DROP CONSTRAINT "Player_heightId_fkey";

-- DropForeignKey
ALTER TABLE "Player" DROP CONSTRAINT "Player_leagueId_fkey";

-- DropForeignKey
ALTER TABLE "Player" DROP CONSTRAINT "Player_nbaId_fkey";

-- DropForeignKey
ALTER TABLE "Player" DROP CONSTRAINT "Player_weightId_fkey";

-- AlterTable
CREATE SEQUENCE birth_id_seq;
ALTER TABLE "Birth" ADD COLUMN     "playerId" INTEGER NOT NULL,
ALTER COLUMN "id" SET DEFAULT nextval('birth_id_seq');
ALTER SEQUENCE birth_id_seq OWNED BY "Birth"."id";

-- AlterTable
CREATE SEQUENCE height_id_seq;
ALTER TABLE "Height" ADD COLUMN     "playerId" INTEGER NOT NULL,
ALTER COLUMN "id" SET DEFAULT nextval('height_id_seq');
ALTER SEQUENCE height_id_seq OWNED BY "Height"."id";

-- AlterTable
CREATE SEQUENCE league_id_seq;
ALTER TABLE "League" ADD COLUMN     "playerId" INTEGER NOT NULL,
ALTER COLUMN "id" SET DEFAULT nextval('league_id_seq');
ALTER SEQUENCE league_id_seq OWNED BY "League"."id";

-- AlterTable
CREATE SEQUENCE nba_id_seq;
ALTER TABLE "NBA" ADD COLUMN     "playerId" INTEGER NOT NULL,
ALTER COLUMN "id" SET DEFAULT nextval('nba_id_seq');
ALTER SEQUENCE nba_id_seq OWNED BY "NBA"."id";

-- AlterTable
ALTER TABLE "Player" ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "leagueId" DROP NOT NULL;
DROP SEQUENCE "Player_id_seq";

-- AlterTable
CREATE SEQUENCE weight_id_seq;
ALTER TABLE "Weight" ADD COLUMN     "playerId" INTEGER NOT NULL,
ALTER COLUMN "id" SET DEFAULT nextval('weight_id_seq');
ALTER SEQUENCE weight_id_seq OWNED BY "Weight"."id";

-- CreateIndex
CREATE UNIQUE INDEX "Birth_playerId_key" ON "Birth"("playerId");

-- CreateIndex
CREATE UNIQUE INDEX "Height_playerId_key" ON "Height"("playerId");

-- CreateIndex
CREATE UNIQUE INDEX "League_playerId_key" ON "League"("playerId");

-- CreateIndex
CREATE UNIQUE INDEX "NBA_playerId_key" ON "NBA"("playerId");

-- CreateIndex
CREATE UNIQUE INDEX "Weight_playerId_key" ON "Weight"("playerId");

-- AddForeignKey
ALTER TABLE "Birth" ADD CONSTRAINT "Birth_playerId_fkey" FOREIGN KEY ("playerId") REFERENCES "Player"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NBA" ADD CONSTRAINT "NBA_playerId_fkey" FOREIGN KEY ("playerId") REFERENCES "Player"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Height" ADD CONSTRAINT "Height_playerId_fkey" FOREIGN KEY ("playerId") REFERENCES "Player"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Weight" ADD CONSTRAINT "Weight_playerId_fkey" FOREIGN KEY ("playerId") REFERENCES "Player"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "League" ADD CONSTRAINT "League_playerId_fkey" FOREIGN KEY ("playerId") REFERENCES "Player"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
