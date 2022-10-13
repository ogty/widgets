<script lang="ts">
	import Gear from '@icons/Gear.svelte';
	import Template from '@atoms/Template.svelte';
	import ToggleOn from '@icons/ToggleOn.svelte';
	import ToggleOff from '@icons/ToggleOff.svelte';
	import {
		isShowTimer,
		isShowTodo,
		isShowMemo,
		isShowDate,
		isShowTerminal,
		isShowAudioPlayer,
		defaultIconSize
	} from '$lib/stores';

	let isEnteredSettingsPopover = false;
</script>

<Template
	LeftIcon={Gear}
	isLeftBorder={false}
	leftOnClick={() => {
		isEnteredSettingsPopover = !isEnteredSettingsPopover;
	}}
	leftPopoverTrigger={isEnteredSettingsPopover}
>
	<div slot="leftPopover" class="p-2 rounded-md">
		<ul>
			<li
				class="flex"
				on:click={() => {
					isShowTimer.update((value) => !value);
				}}
			>
				<span class="cursor-pointer">
					{#if $isShowTimer}
						<ToggleOn size={defaultIconSize} color="#245def" />
					{:else}
						<ToggleOff size={defaultIconSize} />
					{/if}
				</span>
				<span class="ml-2">Timer</span>
			</li>
      <li
				class="flex"
				on:click={() => {
					isShowTodo.update((value) => !value);
				}}
			>
				<span class="cursor-pointer">
					{#if $isShowTodo}
						<ToggleOn size={defaultIconSize} color="#245def" />
					{:else}
						<ToggleOff size={defaultIconSize} />
					{/if}
				</span>
				<span class="ml-2">Todo</span>
			</li>
      <li
				class="flex"
				on:click={() => {
					isShowMemo.update((value) => !value);
				}}
			>
				<span class="cursor-pointer">
					{#if $isShowMemo}
						<ToggleOn size={defaultIconSize} color="#245def" />
					{:else}
						<ToggleOff size={defaultIconSize} />
					{/if}
				</span>
				<span class="ml-2">Memo</span>
			</li>
      <li
				class="flex"
				on:click={() => {
					isShowDate.update((value) => !value);
				}}
			>
				<span class="cursor-pointer">
					{#if $isShowDate}
						<ToggleOn size={defaultIconSize} color="#245def" />
					{:else}
						<ToggleOff size={defaultIconSize} />
					{/if}
				</span>
				<span class="ml-2">Date</span>
			</li>
      <li
				class="flex"
				on:click={() => {
					isShowTerminal.update((value) => !value);
				}}
			>
				<span class="cursor-pointer">
					{#if $isShowTerminal}
						<ToggleOn size={defaultIconSize} color="#245def" />
					{:else}
						<ToggleOff size={defaultIconSize} />
					{/if}
				</span>
				<span class="ml-2">Terminal</span>
			</li>
      <li
				class="flex"
				on:click={() => {
					isShowAudioPlayer.update((value) => !value);
				}}
			>
				<span class="cursor-pointer">
					{#if $isShowAudioPlayer}
						<ToggleOn size={defaultIconSize} color="#245def" />
					{:else}
						<ToggleOff size={defaultIconSize} />
					{/if}
				</span>
				<span class="ml-2">AudioPlayer</span>
			</li>