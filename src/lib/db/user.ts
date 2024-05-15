import { prismaClient } from ".";
import type { Tuser } from ".";

const getOrCreateUser = async (user: Tuser) => {
  let user_ = await getUser(user)

  if (user_) return user_.userAccess;

  try {
    user_ = await prismaClient.user.create({
      data: {
        id: user.id
      }
    })

    return user_.userAccess
  } catch (e) {

    return null
  }
}


const getUser = async (user: Tuser) => {
  return await prismaClient.user.findFirst({ where: { id: user.id } })
}

export { getOrCreateUser, getUser }
