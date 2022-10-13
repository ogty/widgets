<script lang="ts">
	import GearWideConnected from '@icons/GearWideConnected.svelte';
	import Template from '@atoms/Template.svelte';
	import { invoke } from '@tauri-apps/api/tauri';
	import { defaultIconSize } from '$lib/stores';

	const open = () => {
		invoke('open_app', { name: 'System Preferences.app' });
	};
</script>

<Template>
	<div class="cursor-pointer" on:click={open}>
		<GearWideConnected size={defaultIconSize} />
	</div>
</Template>
