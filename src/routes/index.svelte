<script lang="ts">
	import GitHub from '@atoms/GitHub.svelte';
	import YouTube from '@atoms/YouTube.svelte';
	import SystemPreferences from '@atoms/SystemPreferences.svelte';
	import ActivityMonitor from '@atoms/ActivityMonitor.svelte';
	import MicrosoftTeams from '@atoms/MicrosoftTeams.svelte';
	import Google from '@atoms/Google.svelte';
	import Twitter from '@atoms/Twitter.svelte';
	import Slack from '@atoms/Slack.svelte';
	import TypeScript from '@atoms/TypeScript.svelte';
	import StackOverflow from '@atoms/StackOverflow.svelte';
	import Medium from '@atoms/Medium.svelte';
	import Gmail from '@atoms/Gmail.svelte';
	import Kindle from '@atoms/Kindle.svelte';

	import Todo from '@atoms/Todo.svelte';
	import Memo from '@atoms/Memo.svelte';
	import Date from '@molecules/Date.svelte';
	import Timer from '@molecules/Timer.svelte';
	import Nothing from '@atoms/Nothing.svelte';
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
		isShowTypeScript,
		isShowStackOverflow,
		isShowMedium,
		isShowGmail,
		isShowKindle,
		isShowDate,
		isShowTimer,
		isShowTodo,
		isShowMemo,
		isShowTerminal,
		isShowAudioPlayer
	} from '$lib/stores';
</script>

<div class="p-2 flex flex-wrap gap-2 w-screen">
	<div class="flex flex-wrap" style:gap="7.4px">
		<Settings />
		<svelte:component this={$isShowTimer ? Timer : Nothing} />
		<svelte:component this={$isShowDate ? Date : Nothing} />
		<svelte:component this={$isShowGitHub ? GitHub : Nothing} />
		<svelte:component this={$isShowYouTube ? YouTube : Nothing} />
		<svelte:component this={$isShowSystemPreferences ? SystemPreferences : Nothing} />
		<svelte:component this={$isShowActivityMonitor ? ActivityMonitor : Nothing} />
		<svelte:component this={$isShowMicrosoftTeams ? MicrosoftTeams : Nothing} />
		<svelte:component this={$isShowGoogle ? Google : Nothing} />
		<svelte:component this={$isShowTwitter ? Twitter : Nothing} />
		<svelte:component this={$isShowSlack ? Slack : Nothing} />
		<svelte:component this={$isShowTypeScript ? TypeScript : Nothing} />
		<svelte:component this={$isShowStackOverflow ? StackOverflow : Nothing} />
		<svelte:component this={$isShowMedium ? Medium : Nothing} />
		<svelte:component this={$isShowGmail ? Gmail : Nothing} />
		<svelte:component this={$isShowKindle ? Kindle : Nothing} />
	</div>
	<svelte:component this={$isShowMemo ? Memo : Nothing} />
	<svelte:component this={$isShowAudioPlayer ? AudioPlayer : Nothing} />
	<svelte:component this={$isShowTerminal ? Terminal : Nothing} />
	<svelte:component this={$isShowTodo ? Todo : Nothing} />
</div>
