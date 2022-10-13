<script lang="ts">
	import Gmail from '@icons/Gmail.svelte';
	import Template from '@atoms/Template.svelte';
	import { invoke } from '@tauri-apps/api/tauri';
	import { defaultIconSize } from '$lib/stores';

	const open = () => {
		invoke('open_url', { url: 'https://mail.google.com/mail' });
	};
</script>

<Template>
	<div class="cursor-pointer" on:click={open}>
		<Gmail size={defaultIconSize} />
	</div>
</Template>
