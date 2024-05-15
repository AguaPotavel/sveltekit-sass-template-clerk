import type { Handle } from '@sveltejs/kit'
import { sequence } from '@sveltejs/kit/hooks'
import { handleClerk } from 'clerk-sveltekit/server'
import { CLERK_SECRET_KEY } from '$env/static/private'
import { getOrCreateUser } from '@/db/user'

export const handle: Handle = sequence(
  handleClerk(CLERK_SECRET_KEY, {
    debug: true,
    protectedPaths: ['/dashboard'],
    signInUrl: '/sign-in',
  }),
  async ({ event, resolve }) => {
    console.log(event)
    if (event.locals.session?.userId) {
      const userInfo = await getOrCreateUser({ id: event.locals.session.userId })
      event.locals.session.userInfo = userInfo
    }
    return resolve(event)
  }
)
