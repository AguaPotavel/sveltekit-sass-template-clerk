// See https://kit.svelte.dev/docs/types#app
// for information about these interfaces
enum EuserAccess {
  "REGULAR",
  "PRO",
  "BUSSINESS",
  "ADMIN"
}


declare global {
  namespace App {
    // interface Error {}
    interface Locals {
      session?: { userId: string, userInfo: EuserAccess | null }
    }
    // interface PageData {}
    // interface PageState {}
    // interface Platform {}
  }
}

export { };
