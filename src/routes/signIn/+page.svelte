<script lang="ts">
	import SignIn from 'clerk-sveltekit/client/SignIn.svelte';
</script>

<div class="flex w-full flex-1 items-center justify-center">
	<SignIn redirectUrl="/dashboard" signUpUrl="/signUp" />
</div>
