<script lang="ts">
	import GitHub from '@atoms/Github.svelte';
	import YouTube from '@atoms/Youtube.svelte';
	import SystemPreferences from '@atoms/SystemPreferences.svelte';
	import ActivityMonitor from '@atoms/ActivityMonitor.svelte';
	import MicrosoftTeams from '@atoms/MicrosoftTeams.svelte';
	import Google from '@atoms/Google.svelte';
	import Twitter from '@atoms/Twitter.svelte';
	import Slack from '@atoms/Slack.svelte';

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
		isShowMicrosoftTeams,
		isShowGoogle,
		isShowTwitter,
		isShowSlack,
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
		{#if $isShowMicrosoftTeams}
			<MicrosoftTeams />
		{/if}
		{#if $isShowGoogle}
			<Google />
		{/if}
		{#if $isShowTwitter}
			<Twitter />
		{/if}
		{#if $isShowSlack}
			<Slack />
		{/if}
		{#if $isShowTimer}
			<Timer />
		{/if}
		{#if $isShowDate}
			<Date />
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
