<script>
	import Template from '@atoms/Template.svelte';
	import { invoke } from '@tauri-apps/api/tauri';
	import MicrosoftTeams from '@icons/MicrosoftTeams.svelte';
	import { defaultIconSize } from '$lib/stores';

	const open = () => {
		invoke('open_app', { name: 'Microsoft Teams' });
	};
</script>

<Template>
	<div class="cursor-pointer" on:click={open}>
		<MicrosoftTeams size={defaultIconSize} />
	</div>
</Template>
