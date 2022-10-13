<script lang="ts">
	import Activity from '@icons/Activity.svelte';
	import Template from '@atoms/Template.svelte';
	import { invoke } from '@tauri-apps/api/tauri';
	import { defaultIconSize } from '$lib/stores';

	const open = () => {
		invoke('open_app', { name: 'Activity Monitor.app' });
	};
</script>

<Template>
	<div class="cursor-pointer" on:click={open}>
		<Activity size={defaultIconSize} />
	</div>
</Template>
