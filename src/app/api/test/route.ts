// pages/api/prisma-example.ts
import { NextApiRequest, NextApiResponse } from "next";
import { PrismaClient } from "@prisma/client";
import { NextResponse } from "next/server";

const prisma = new PrismaClient();

export async function POST(req: NextApiRequest) {
  try {
    if (req.method === "POST") {
    //   const user = await prisma.user.create({
    //       data: { name: "Sally" },
    //   });
    //   const player = await prisma.player.create({
    //     data: {
    //       id: 385,
    //       firstname: "Larry",
    //       lastname: "Nance Jr.",
    //       birth: {
    //         create: {id: 1, date: "1993-01-01", country: "USA" },
    //       },
    //       nba: {
    //         create: {id: 1, start: 2015, pro: 6 },
    //       },
    //       height: {
    //         create: {id: 1, feets: "6", inches: "7", meters: "2.01" },
    //       },
    //       weight: {
    //         create: {id: 1, pounds: "245", kilograms: "111.1" },
    //       },
    //       college: "Wyoming",
    //       affiliation: "Wyoming/USA",
    //       leagues: {
    //         create: {id: 1, jersey: 22, active: true, pos: "F-C" },
    //       },
    //     },
    //   });
        const players = await prisma.weight.findMany()
        console.log(players);
      console.log("HELO");
      // console.log(player)
      return NextResponse.json({ players }, { status: 200 });
    } else {
      return NextResponse.json(
        { message: "Method Not Allowed" },
        { status: 405 },
      );
    }
  } catch (error) {
      console.error(error);
      console.log(error)
    return NextResponse.json(
      { message: "Something went wrong" },
      { status: 500 },
    );
  } finally {
    await prisma.$disconnect();
  }
}
