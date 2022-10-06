<script>
	import Twitter from '@icons/Twitter.svelte';
	import Template from '@atoms/Template.svelte';
	import { invoke } from '@tauri-apps/api/tauri';
	import { defaultIconSize } from '$lib/stores';

	const open = () => {
		invoke('open_url', { url: 'https://twitter.com/home' });
	};
</script>

<Template>
	<div class="cursor-pointer" on:click={open}>
		<Twitter size={defaultIconSize} />
	</div>
</Template>
