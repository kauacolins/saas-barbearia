-- CreateTable
CREATE TABLE "public"."User" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."BarberShop" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "adress" TEXT NOT NULL,
    "phones" TEXT[],
    "description" TEXT NOT NULL,
    "imageURL" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BarberShop_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."BarberShopService" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "imageURL" TEXT NOT NULL,
    "price" DECIMAL(10,2) NOT NULL,
    "barbershopId" TEXT NOT NULL,

    CONSTRAINT "BarberShopService_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."Booking" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "barbershopId" TEXT NOT NULL,
    "serviceId" TEXT NOT NULL,

    CONSTRAINT "Booking_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "public"."BarberShopService" ADD CONSTRAINT "BarberShopService_barbershopId_fkey" FOREIGN KEY ("barbershopId") REFERENCES "public"."BarberShop"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."Booking" ADD CONSTRAINT "Booking_userId_fkey" FOREIGN KEY ("userId") REFERENCES "public"."User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."Booking" ADD CONSTRAINT "Booking_serviceId_fkey" FOREIGN KEY ("serviceId") REFERENCES "public"."BarberShopService"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
