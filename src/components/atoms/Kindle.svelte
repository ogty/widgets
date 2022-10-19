<script lang="ts">
	import Book from '@icons/Book.svelte';
	import Template from '@atoms/Template.svelte';
	import { invoke } from '@tauri-apps/api/tauri';
	import { defaultIconSize } from '$lib/stores';

	const open = () => {
		invoke('open_app', { name: 'Kindle' });
	};
</script>

<Template>
	<div class="cursor-pointer" on:click={open}>
		<Book size={defaultIconSize} />
	</div>
</Template>
