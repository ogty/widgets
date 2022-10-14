<script lang="ts">
	import Todo from '@atoms/Todo.svelte';
	import Memo from '@atoms/Memo.svelte';
	import Date from '@molecules/Date.svelte';
	import Timer from '@molecules/Timer.svelte';
  import Nothing from '@atoms/Nothing.svelte';
	import Terminal from '@molecules/Terminal.svelte';
	import Settings from '@molecules/Settings.svelte';
	import AudioPlayer from '@molecules/AudioPlayer.svelte';

	import {
		isShowDate,
		isShowTimer,
		isShowTodo,
		isShowMemo,
		isShowTerminal,
		isShowAudioPlayer,
	} from '$lib/stores';
</script>

<div class="p-2 flex flex-wrap gap-2 w-screen">
	<div class="flex flex-wrap" style:gap="7.4px">
		<Settings />
    <svelte:component this={$isShowTimer ? Timer : Nothing} />
    <svelte:component this={$isShowDate ? Date : Nothing} />