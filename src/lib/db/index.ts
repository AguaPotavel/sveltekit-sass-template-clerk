import { PrismaClient } from "@prisma/client"

type Tuser = {
  id: string
}

const prismaClient = new PrismaClient()


export { prismaClient }
export type { Tuser }
