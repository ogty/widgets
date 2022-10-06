<script>
	// @ts-nocheck

	import Template from '@atoms/Template.svelte';
	import musicList from '@data/musicList.json';
	import MusicNoteList from '@icons/MusicNoteList.svelte';
	import MusicNoteBeamed from '@icons/MusicNoteBeamed.svelte';
	import { defaultIconSize } from '$lib/stores';

	let src = `/music/${musicList[0]}.mp3`;
	let paused = true;
	const musicListLength = musicList.length - 1;
	let isEnteredMusicListPopover = false;
	const changeMusic = (music) => {
		src = `/music/${music}.mp3`;
	};

	const trigger = () => {
		isEnteredMusicListPopover = !isEnteredMusicListPopover;
	};
</script>

<Template
	rightOnClick={() => {
		isEnteredMusicListPopover = !isEnteredMusicListPopover;
	}}
	rightPopoverTrigger={isEnteredMusicListPopover}
>
	<div slot="left">
		<MusicNoteBeamed size={defaultIconSize} />
	</div>
	<article class:playing={!paused}>
		<audio
			class="h-4 block outline-none"
			style:width="calc(100vw - 108px)"
			{src}
			loop
			controls
			bind:paused
			controlsList="nodownload noplaybackrate"
		/>
	</article>
	<div slot="right">
		<MusicNoteList size={defaultIconSize} />
	</div>
	<div slot="rightPopover">
		<ul class="rounded-md">
			{#if musicListLength === 0}
				<li
					class="rounded-md cursor-pointer p-2"
					on:click={() => {
						changeMusic(musicList[0]);
						trigger();
					}}
				>
					{musicList[0]}
				</li>
			{:else}
				{#each musicList as music, index}
					{#if index === 0}
						<li
							class="cursor-pointer p-2 border-b border-slate-500"
							style:border-top-left-radius="5px"
							style:border-top-right-radius="5px"
							on:click={() => {
								changeMusic(music);
								trigger();
							}}
						>
							{music}
						</li>
					{:else if index === musicListLength}
						<li
							class="cursor-pointer p-2"
							style:border-bottom-left-radius="5px"
							style:border-bottom-right-radius="5px"
							on:click={() => {
								changeMusic(music);
								trigger();
							}}
						>
							{music}
						</li>
					{:else}
						<li
							class="cursor-pointer p-2 border-b border-slate-500"
							on:click={() => {
								changeMusic(music);
								trigger();
							}}
						>
							{music}
						</li>
					{/if}
				{/each}
			{/if}
		</ul>
	</div>
</Template>

<style>
	li {
		backdrop-filter: blur(10px);
	}
	li:hover {
		background-color: rgba(255, 255, 255, 0.1);
	}
</style>
