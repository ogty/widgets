<script lang="ts">
	import Template from '@atoms/Template.svelte';
	import Terminal from '@icons/Terminal.svelte';
	import { invoke } from '@tauri-apps/api/tauri';

	let commandString: string = '';
	$: command = commandString.split(' ');
	const executeCommands = () => {
		invoke('execute_commands', { command: command[0], args: command.slice(1) }).then((res) => {
			console.log(res);
		});
	};
	const tmp = (event: any) => {
		const code = event.code;
		if (code === 'Enter') {
			executeCommands();
			commandString = '';
		}
	};
</script>

<Template LeftIcon={Terminal} isLeftWidthFull={true}>
	<input
		type="text"
		class="text-xs bg-transparent w-full"
		bind:value={commandString}
		on:keydown={(event) => tmp(event)}
		spellcheck={false}
	/>
</Template>
