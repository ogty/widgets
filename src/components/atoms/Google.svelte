<script lang="ts">
	import Google from '@icons/Google.svelte';
	import Template from '@atoms/Template.svelte';
	import { invoke } from '@tauri-apps/api/tauri';
	import { defaultIconSize } from '$lib/stores';

	const open = () => {
		invoke('open_url', { url: 'https://google.com' });
	};
</script>

<Template>
	<div class="cursor-pointer" on:click={open}>
		<Google size={defaultIconSize} />
	</div>
</Template>
