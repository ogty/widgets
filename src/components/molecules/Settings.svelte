<script lang="ts">
	import Gear from '@icons/Gear.svelte';
	import Template from '@atoms/Template.svelte';
	import ToggleOn from '@icons/ToggleOn.svelte';
	import ToggleOff from '@icons/ToggleOff.svelte';
	import {
		isShowGitHub,
		isShowYouTube,
		isShowSystemPreferences,
		isShowActivityMonitor,
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
					isShowGitHub.update((value) => !value);
				}}
			>
				<span class="cursor-pointer">
					{#if $isShowGitHub}
						<ToggleOn size={defaultIconSize} color="#245def" />
					{:else}
						<ToggleOff size={defaultIconSize} />
					{/if}
				</span>
				<span class="ml-2">GitHub</span>
			</li>
			<li
				class="flex"
				on:click={() => {
					isShowYouTube.update((value) => !value);
				}}
			>
				<span class="cursor-pointer">
					{#if $isShowYouTube}
						<ToggleOn size={defaultIconSize} color="#245def" />
					{:else}
						<ToggleOff size={defaultIconSize} />
					{/if}
				</span>
				<span class="ml-2">YouTube</span>
			</li>
			<li
				class="flex"
				on:click={() => {
					isShowSystemPreferences.update((value) => !value);
				}}
			>
				<span class="cursor-pointer">
					{#if $isShowSystemPreferences}
						<ToggleOn size={defaultIconSize} color="#245def" />
					{:else}
						<ToggleOff size={defaultIconSize} />
					{/if}
				</span>
				<span class="ml-2">SystemPreferences</span>
			</li>
			<li
				class="flex"
				on:click={() => {
					isShowActivityMonitor.update((value) => !value);
				}}
			>
				<span class="cursor-pointer">
					{#if $isShowActivityMonitor}
						<ToggleOn size={defaultIconSize} color="#245def" />
					{:else}
						<ToggleOff size={defaultIconSize} />
					{/if}
				</span>
				<span class="ml-2">ActivityMonitor</span>
			</li>
		</ul>
	</div>
</Template>

<style>
	div {
		backdrop-filter: blur(10px);
	}
	li:hover {
		background-color: rgba(255, 255, 255, 0.1);
	}
</style>
