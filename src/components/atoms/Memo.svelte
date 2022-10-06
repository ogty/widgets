<script lang="ts">
	import { sleep } from '$lib/sleep';
	import Clipboard from '@icons/Clipboard.svelte';
	import ClipboardCheck from '@icons/ClipboardCheck.svelte';
	import { defaultIconSize } from '$lib/stores';

	let content = '';
	let isCopied = false;

	const copy = () => {
		isCopied = !isCopied;
		navigator.clipboard.writeText(content);
		sleep(1, () => {
			isCopied = !isCopied;
		});
	};
</script>

<div class="relative text-xs w-full h-96 rounded-md">
	<div class="grid gap-2">
		<div
			class="text-slate-300 cursor-pointer top-0 right-0 p-1 absolute border rounded-tr-md rounded-bl-md border-slate-400 bg-transparent"
			on:click={copy}
		>
			{#if isCopied}
				<ClipboardCheck color="#22C55E" size={defaultIconSize} />
			{:else}
				<Clipboard size={defaultIconSize} />
			{/if}
		</div>
	</div>
	<textarea
		class="text-slate-300 rounded-md block w-full h-full border border-slate-400 p-2 bg-transparent"
		spellcheck={false}
		bind:value={content}
	/>
</div>
