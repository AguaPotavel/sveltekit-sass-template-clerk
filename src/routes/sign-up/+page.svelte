<script lang="ts">
	import SignUp from 'clerk-sveltekit/client/SignUp.svelte';
</script>

<div class="flex w-full flex-1 items-center justify-center">
	<SignUp redirectUrl="/dashboard" signInUrl="/sign-in" />
</div>
