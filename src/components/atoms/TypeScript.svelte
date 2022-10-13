<script lang="ts">
	import TypeScript from '@icons/TypeScript.svelte';
	import Template from '@atoms/Template.svelte';
	import { invoke } from '@tauri-apps/api/tauri';
	import { defaultIconSize } from '$lib/stores';

	const open = () => {
		invoke('open_url', { url: 'https://www.typescriptlang.org/play' });
	};
</script>

<Template>
	<div class="cursor-pointer" on:click={open}>
		<TypeScript size={defaultIconSize} />
	</div>
</Template>
