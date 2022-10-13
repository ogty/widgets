<script lang="ts">
	import StackOverflow from '@icons/StackOverflow.svelte';
	import Template from '@atoms/Template.svelte';
	import { invoke } from '@tauri-apps/api/tauri';
	import { defaultIconSize } from '$lib/stores';

	const open = () => {
		invoke('open_url', { url: 'https://stackoverflow.com' });
	};
</script>

<Template>
	<div class="cursor-pointer" on:click={open}>
		<StackOverflow size={defaultIconSize} />
	</div>
</Template>
