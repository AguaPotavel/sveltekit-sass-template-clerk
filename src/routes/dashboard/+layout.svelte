<script lang="ts">
	import UserButton from 'clerk-sveltekit/client/UserButton.svelte';
	import SignedIn from 'clerk-sveltekit/client/SignedIn.svelte';
	import SignedOut from 'clerk-sveltekit/client/SignedOut.svelte';
</script>

<div class="flex flex-1 bg-red-500">
	<SignedIn>
		<UserButton afterSignOutUrl="/" />
	</SignedIn>
	<SignedOut>Login</SignedOut>

	<slot></slot>
</div>
