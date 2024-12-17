-- CreateTable
CREATE TABLE "Player" (
    "id" SERIAL NOT NULL,
    "firstname" TEXT NOT NULL,
    "lastname" TEXT NOT NULL,
    "birthId" INTEGER NOT NULL,
    "nbaId" INTEGER NOT NULL,
    "heightId" INTEGER NOT NULL,
    "weightId" INTEGER NOT NULL,
    "college" TEXT,
    "affiliation" TEXT,
    "leagueId" INTEGER NOT NULL,

    CONSTRAINT "Player_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Birth" (
    "id" INTEGER NOT NULL,
    "date" TEXT NOT NULL,
    "country" TEXT NOT NULL,

    CONSTRAINT "Birth_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "NBA" (
    "id" INTEGER NOT NULL,
    "start" INTEGER NOT NULL,
    "pro" INTEGER NOT NULL,

    CONSTRAINT "NBA_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Height" (
    "id" INTEGER NOT NULL,
    "feets" TEXT NOT NULL,
    "inches" TEXT NOT NULL,
    "meters" TEXT NOT NULL,

    CONSTRAINT "Height_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Weight" (
    "id" INTEGER NOT NULL,
    "pounds" TEXT NOT NULL,
    "kilograms" TEXT NOT NULL,

    CONSTRAINT "Weight_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "League" (
    "id" INTEGER NOT NULL,
    "jersey" INTEGER,
    "active" BOOLEAN NOT NULL,
    "pos" TEXT NOT NULL,
    "standard" TEXT,

    CONSTRAINT "League_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Player" ADD CONSTRAINT "Player_birthId_fkey" FOREIGN KEY ("birthId") REFERENCES "Birth"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Player" ADD CONSTRAINT "Player_nbaId_fkey" FOREIGN KEY ("nbaId") REFERENCES "NBA"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Player" ADD CONSTRAINT "Player_heightId_fkey" FOREIGN KEY ("heightId") REFERENCES "Height"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Player" ADD CONSTRAINT "Player_weightId_fkey" FOREIGN KEY ("weightId") REFERENCES "Weight"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Player" ADD CONSTRAINT "Player_leagueId_fkey" FOREIGN KEY ("leagueId") REFERENCES "League"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
