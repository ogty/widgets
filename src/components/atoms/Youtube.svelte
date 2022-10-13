<script lang="ts">
	import Youtube from '@icons/Youtube.svelte';
	import Template from '@atoms/Template.svelte';
	import { invoke } from '@tauri-apps/api/tauri';
	import { defaultIconSize } from '$lib/stores';

	const open = () => {
		invoke('open_url', { url: 'https://youtube.com' });
	};
</script>

<Template>
	<div class="cursor-pointer" on:click={open}>
		<Youtube size={defaultIconSize} />
	</div>
</Template>
