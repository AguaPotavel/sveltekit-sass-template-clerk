-- CreateEnum
CREATE TYPE "UserAccess" AS ENUM ('REGULAR', 'PRO', 'BUSSINESS', 'ADMIN');

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "emailVerified" BOOLEAN NOT NULL DEFAULT false,
    "password" TEXT,
    "name" TEXT,
    "userAccess" "UserAccess" NOT NULL DEFAULT 'REGULAR',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Session" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "expiresAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Session_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BetHouse" (
    "id" TEXT NOT NULL,
    "houseName" TEXT NOT NULL,
    "url" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "BetHouse_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BetHouseUserPortfolio" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "BetHouseId" TEXT NOT NULL,
    "balance" DOUBLE PRECISION NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "transactions" JSONB[],

    CONSTRAINT "BetHouseUserPortfolio_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Bet" (
    "id" TEXT NOT NULL,
    "odd" DOUBLE PRECISION NOT NULL,
    "description" TEXT,
    "stake" DOUBLE PRECISION NOT NULL,
    "betList" JSONB[],
    "cashOut" BOOLEAN NOT NULL DEFAULT false,
    "isWinner" BOOLEAN,
    "returnValue" DOUBLE PRECISION,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "closedAt" TIMESTAMP(3),
    "isClosed" BOOLEAN NOT NULL DEFAULT false,
    "sport" TEXT,
    "BetHouseId" TEXT,
    "userId" TEXT NOT NULL,
    "print" TEXT,
    "betTagId" TEXT,

    CONSTRAINT "Bet_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BetTag" (
    "id" TEXT NOT NULL,
    "tag" TEXT NOT NULL,
    "description" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userId" TEXT NOT NULL,

    CONSTRAINT "BetTag_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PrintPrompt" (
    "id" TEXT NOT NULL,
    "promptMobile" TEXT NOT NULL,
    "promptDesktop" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "BetHouseId" TEXT NOT NULL,

    CONSTRAINT "PrintPrompt_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "BetHouseUserPortfolio_userId_BetHouseId_key" ON "BetHouseUserPortfolio"("userId", "BetHouseId");

-- CreateIndex
CREATE UNIQUE INDEX "PrintPrompt_BetHouseId_key" ON "PrintPrompt"("BetHouseId");

-- AddForeignKey
ALTER TABLE "Session" ADD CONSTRAINT "Session_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BetHouseUserPortfolio" ADD CONSTRAINT "BetHouseUserPortfolio_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BetHouseUserPortfolio" ADD CONSTRAINT "BetHouseUserPortfolio_BetHouseId_fkey" FOREIGN KEY ("BetHouseId") REFERENCES "BetHouse"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Bet" ADD CONSTRAINT "Bet_BetHouseId_fkey" FOREIGN KEY ("BetHouseId") REFERENCES "BetHouse"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Bet" ADD CONSTRAINT "Bet_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Bet" ADD CONSTRAINT "Bet_betTagId_fkey" FOREIGN KEY ("betTagId") REFERENCES "BetTag"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BetTag" ADD CONSTRAINT "BetTag_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PrintPrompt" ADD CONSTRAINT "PrintPrompt_BetHouseId_fkey" FOREIGN KEY ("BetHouseId") REFERENCES "BetHouse"("id") ON DELETE CASCADE ON UPDATE CASCADE;
