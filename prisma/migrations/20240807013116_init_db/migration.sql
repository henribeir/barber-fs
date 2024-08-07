/*
  Warnings:

  - You are about to drop the column `ImageUrl` on the `Barbershop` table. All the data in the column will be lost.
  - You are about to drop the column `email` on the `Barbershop` table. All the data in the column will be lost.
  - You are about to drop the column `phone` on the `Barbershop` table. All the data in the column will be lost.
  - You are about to drop the column `ImageUrl` on the `BarbershopService` table. All the data in the column will be lost.
  - You are about to drop the column `serviceID` on the `Booking` table. All the data in the column will be lost.
  - You are about to drop the column `userID` on the `Booking` table. All the data in the column will be lost.
  - Added the required column `address` to the `Barbershop` table without a default value. This is not possible if the table is not empty.
  - Added the required column `imageUrl` to the `Barbershop` table without a default value. This is not possible if the table is not empty.
  - Added the required column `imageUrl` to the `BarbershopService` table without a default value. This is not possible if the table is not empty.
  - Added the required column `serviceId` to the `Booking` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userId` to the `Booking` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Booking" DROP CONSTRAINT "Booking_serviceID_fkey";

-- DropForeignKey
ALTER TABLE "Booking" DROP CONSTRAINT "Booking_userID_fkey";

-- AlterTable
ALTER TABLE "Barbershop" DROP COLUMN "ImageUrl",
DROP COLUMN "email",
DROP COLUMN "phone",
ADD COLUMN     "address" TEXT NOT NULL,
ADD COLUMN     "imageUrl" TEXT NOT NULL,
ADD COLUMN     "phones" TEXT[];

-- AlterTable
ALTER TABLE "BarbershopService" DROP COLUMN "ImageUrl",
ADD COLUMN     "imageUrl" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Booking" DROP COLUMN "serviceID",
DROP COLUMN "userID",
ADD COLUMN     "serviceId" TEXT NOT NULL,
ADD COLUMN     "userId" TEXT NOT NULL;

-- AddForeignKey
ALTER TABLE "Booking" ADD CONSTRAINT "Booking_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Booking" ADD CONSTRAINT "Booking_serviceId_fkey" FOREIGN KEY ("serviceId") REFERENCES "BarbershopService"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
