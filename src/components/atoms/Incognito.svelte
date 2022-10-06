<script>
	import Template from '@atoms/Template.svelte';
	import Incognito from '@icons/Incognito.svelte';
	import { invoke } from '@tauri-apps/api/tauri';
	import { defaultIconSize } from '$lib/stores';

	const open = () => {
		invoke('execute_commands', {
			command: 'open',
			args: ['-a', '/Applications/Google Chrome.app', '--args', '-incognito']
		});
	};
</script>

<Template>
	<div class="cursor-pointer" on:click={open}>
		<Incognito size={defaultIconSize} />
	</div>
</Template>
