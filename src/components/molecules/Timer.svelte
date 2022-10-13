<script lang="ts">
	import Plus from '@icons/Plus.svelte';
	import Minus from '@icons/Minus.svelte';
	import Alarm from '@icons/Alarm.svelte';
	import Template from '@atoms/Template.svelte';
	import PlayCircle from '@icons/PlayCircle.svelte';
	import PauseCircle from '@icons/PauseCircle.svelte';
	import { timeFormatter } from '$lib/timeRelated';
	import { isSetTimer, defaultIconSize } from '$lib/stores';

	export let minutes = 3;

	let timer: any;
	let isEnteredTimerPopover = false;

	$: count = minutes * 60;
	$: if (count === 0) {
		clearInterval(timer);
		timer = undefined;
		isSetTimer.set(!$isSetTimer);
	}
	$: if (typeof timer === 'undefined' && $isSetTimer) {
		timer = setInterval(() => {
			count -= 1;
		}, 1000);
	}
	$: if (typeof timer === 'number' && !$isSetTimer) {
		clearInterval(timer);
		timer = undefined;
	}

	const toggleTimer = () => {
		isSetTimer.set(!$isSetTimer);
	};
	const decrementMinutes = () => {
		minutes && (minutes -= 1);
	};
	const incrementMinutes = () => {
		minutes += 1;
	};
</script>

<Template
	LeftIcon={Alarm}
	leftOnClick={() => {
		isEnteredTimerPopover = !isEnteredTimerPopover;
	}}
	rightOnClick={toggleTimer}
	leftPopoverTrigger={isEnteredTimerPopover}
>
	<div slot="leftPopover" class="left-popover p-1 flex items-center rounded-md">
		<div class="cursor-pointer" on:click={decrementMinutes}>
			<Minus size={16} />
		</div>
		<input class="w-8 bg-transparent" bind:value={minutes} type="number" />
		<div class="cursor-pointer" on:click={incrementMinutes}>
			<Plus size={16} />
		</div>
	</div>
	{#if typeof count === 'number' && count !== 0}
		<div style="padding-left: 12.4px; padding-right: 12.4px;">
			{timeFormatter(count)}
		</div>
	{/if}
	<div slot="right">
		{#if $isSetTimer}
			<PauseCircle size={defaultIconSize} />
		{:else}
			<PlayCircle size={defaultIconSize} />
		{/if}
	</div>
</Template>

<style>
	input::-webkit-outer-spin-button,
	input::-webkit-inner-spin-button {
		margin: 0;
		-webkit-appearance: none;
	}
	.left-popover {
		backdrop-filter: blur(10px);
	}
</style>
