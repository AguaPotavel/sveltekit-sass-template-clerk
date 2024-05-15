import { prismaClient } from ".";
import type { Tuser } from ".";

const getBetHouse = async (user: Tuser) => {
  const betHouses = prismaClient.betHouse.findMany({
    where: {
      user: {
        connect: {
          id: user.id
        }
      }
    }
  })
}
