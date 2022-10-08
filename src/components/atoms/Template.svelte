<script lang="ts">
	import { defaultIconSize } from '$lib/stores';

	type OnClick = (() => void) | null;

	export let rounded = true;
	export let roundedTop = false;
	export let roundedBottom = false;
	export let LeftIcon: any = null;
	export let RightIcon: any = null;
	export let isLeftWidthFull = false;
	export let leftPopoverTrigger = false;
	export let rightPopoverTrigger = false;
	export let leftOnClick: OnClick = null;
	export let rightOnClick: OnClick = null;
</script>

<div
	class="p-1 h-fit relative text-sm text-slate-300 border border-slate-300"
	class:w-full={isLeftWidthFull}
	class:rounded-md={rounded}
	class:rounded-t-md={roundedTop}
	class:rounded-b-md={roundedBottom}
>
	<div class="w-full flex items-center mx-0 my-auto">
		{#if LeftIcon || $$slots.left}
			<div
				class=" mr-2 py-2 pl-1 pr-2 border-r border-slate-300"
				class:cursor-pointer={leftOnClick ?? false}
			>
				<div class="w-full" on:click={leftOnClick}>
					<slot name="left">
						<LeftIcon size={defaultIconSize} />
					</slot>
				</div>
				{#if $$slots.leftPopover}
					{#if leftPopoverTrigger}
						<div
							class="rounded-md left-0 top-12 border border-slate-300 absolute z-10"
							style:left="-1px"
						>
							<slot name="leftPopover" />
						</div>
					{/if}
				{/if}
			</div>
		{/if}
		{#if !(LeftIcon || $$slots.left) && !(RightIcon || $$slots.right)}
			<div class="px-1 py-2">
				<slot />
			</div>
		{:else}
			<slot />
		{/if}
		{#if RightIcon || $$slots.right}
			<div
				class="border-l border-slate-300 ml-2 py-2 pl-2 pr-1"
				class:cursor-pointer={rightOnClick ?? false}
			>
				<div on:click={rightOnClick}>
					<slot name="right">
						<RightIcon size={defaultIconSize} />
					</slot>
				</div>
				{#if $$slots.rightPopover}
					{#if rightPopoverTrigger}
						<div class="rounded-md top-12 z-10 border border-slate-300 absolute" style:right="-1px">
							<slot name="rightPopover" />
						</div>
					{/if}
				{/if}
			</div>
		{:else if (LeftIcon || $$slots.left) && !(RightIcon || $$slots.right)}
			<div class="w-1 inline-block" />
		{/if}
	</div>
</div>
