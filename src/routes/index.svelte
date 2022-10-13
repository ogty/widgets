<script lang="ts">
	import GitHub from '@atoms/GitHub.svelte';
	import YouTube from '@atoms/YouTube.svelte';
	import SystemPreferences from '@atoms/SystemPreferences.svelte';
	import ActivityMonitor from '@atoms/ActivityMonitor.svelte';

	import Todo from '@atoms/Todo.svelte';
	import Memo from '@atoms/Memo.svelte';
	import Date from '@molecules/Date.svelte';
	import Timer from '@molecules/Timer.svelte';
	import Terminal from '@molecules/Terminal.svelte';
	import Settings from '@molecules/Settings.svelte';
	import AudioPlayer from '@molecules/AudioPlayer.svelte';

	import {
		isShowGitHub,
		isShowYouTube,
		isShowSystemPreferences,
		isShowActivityMonitor,
		isShowDate,
		isShowTimer,
		isShowTodo,
		isShowMemo,
		isShowTerminal,
		isShowAudioPlayer
	} from '$lib/stores';
</script>

<div class="p-2 flex flex-wrap gap-2 w-screen">
	<div class="grid grid-flow-col gap-2">
		<Settings />
		{#if $isShowTimer}
			<Timer />
		{/if}
		{#if $isShowDate}
			<Date />
		{/if}
		{#if $isShowGitHub}
			<GitHub />
		{/if}
		{#if $isShowYouTube}
			<YouTube />
		{/if}
		{#if $isShowSystemPreferences}
			<SystemPreferences />
		{/if}
		{#if $isShowActivityMonitor}
			<ActivityMonitor />
		{/if}
	</div>
	{#if $isShowMemo}
		<Memo />
	{/if}
	{#if $isShowAudioPlayer}
		<AudioPlayer />
	{/if}
	{#if $isShowTerminal}
		<Terminal />
	{/if}
	{#if $isShowTodo}
		<Todo />
	{/if}
</div>
