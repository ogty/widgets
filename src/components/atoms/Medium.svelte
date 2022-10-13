<script lang="ts">
	import Medium from '@icons/Medium.svelte';
	import Template from '@atoms/Template.svelte';
	import { invoke } from '@tauri-apps/api/tauri';
	import { defaultIconSize } from '$lib/stores';

	const open = () => {
		invoke('open_url', { url: 'https://medium.com' });
	};
</script>

<Template>
	<div class="cursor-pointer" on:click={open}>
		<Medium size={defaultIconSize} />
	</div>
</Template>
