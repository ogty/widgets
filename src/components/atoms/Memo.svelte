<script lang="ts">
	import Eye from '@icons/Eye.svelte';
	import Code from '@icons/Code.svelte';
	import ToggleOn from '@icons/ToggleOn.svelte';
	import ToggleOff from '@icons/ToggleOff.svelte';
	import { sleep } from '$lib/sleep';
	import Clipboard from '@icons/Clipboard.svelte';
	import { toHtml } from '$lib/toHtml';
	import MarkdownFill from '@icons/MarkdownFill.svelte';
	import ClipboardCheck from '@icons/ClipboardCheck.svelte';
	import { defaultIconSize } from '$lib/stores';

	let content = '';
	let isCopied = false;
	let isPreview = false;
	let isBackground = false;

	const copy = () => {
		isCopied = !isCopied;
		navigator.clipboard.writeText(content);
		sleep(1, () => {
			isCopied = !isCopied;
		});
	};
	$: htmlContent = toHtml(content);
</script>

<div
	class="relative text-xs w-full rounded-md text-slate-300"
	style:height="540px"
	class:text-slate-900={isBackground}
>
	{#if !isPreview}
		<span class="absolute bottom-2 right-3">
			<MarkdownFill size={defaultIconSize - 2} />
		</span>
	{/if}
	<div
		class="button-group flex gap-2 top-0 right-0 p-2 absolute border border-slate-300 rounded-bl-md rounded-tr-md"
		class:border-slate-300={isBackground}
	>
		<div
			class="cursor-pointer"
			on:click={() => {
				isBackground = !isBackground;
			}}
		>
			{#if isBackground}
				<ToggleOn size={defaultIconSize} />
			{:else}
				<ToggleOff size={defaultIconSize} />
			{/if}
		</div>
		<span class="border-l border-slate-300" class:border-slate-300={isBackground} />
		<div
			class="cursor-pointer"
			on:click={() => {
				isPreview = !isPreview;
			}}
		>
			{#if isPreview}
				<Code size={defaultIconSize} />
			{:else}
				<Eye size={defaultIconSize} />
			{/if}
		</div>
		<span class="border-l border-slate-300" class:border-slate-300={isBackground} />
		<div class="cursor-pointer" on:click={copy}>
			{#if isCopied}
				<ClipboardCheck color="#22C55E" size={defaultIconSize} />
			{:else}
				<Clipboard size={defaultIconSize} />
			{/if}
		</div>
	</div>
	<div
		class="w-full h-full rounded-md text-slate-300 border border-slate-300"
		class:bg-slate-200={isBackground}
		class:text-slate-900={isBackground}
	>
		{#if isPreview}
			<div class="overflow-y-scroll rounded-md block w-full h-full p-4 bg-transparent">
				{@html htmlContent}
			</div>
		{:else}
			<textarea
				class="rounded-md block w-full h-full p-4 bg-transparent"
				spellcheck={false}
				bind:value={content}
				class:text-slate-300={!isBackground}
			/>
		{/if}
	</div>
</div>

<style>
	.button-group {
		backdrop-filter: blur(10px);
	}
</style>
