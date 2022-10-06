<script>
	import Github from '@icons/Github.svelte';
	import Template from '@atoms/Template.svelte';
	import { invoke } from '@tauri-apps/api/tauri';
	import { defaultIconSize } from '$lib/stores';

	const open = () => {
		invoke('open_url', { url: 'https://github.com' });
	};
</script>

<Template>
	<div class="cursor-pointer" on:click={open}>
		<Github size={defaultIconSize} />
	</div>
</Template>
