<script>
	import Slack from '@icons/Slack.svelte';
	import Template from '@atoms/Template.svelte';
	import { invoke } from '@tauri-apps/api/tauri';
	import { defaultIconSize } from '$lib/stores';

	const open = () => {
		invoke('open_app', { name: 'Slack' });
	};
</script>

<Template>
	<div class="cursor-pointer" on:click={open}>
		<Slack size={defaultIconSize} />
	</div>
</Template>
