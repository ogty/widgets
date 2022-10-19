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
		isShowMicrosoftTeams,
		isShowGoogle,
		isShowTwitter,
		isShowSlack,
		isShowTypeScript,
		isShowStackOverflow,
		isShowMedium,
		isShowGmail,
		isShowKindle,
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
			<li
				class="flex"
				on:click={() => {
					isShowMicrosoftTeams.update((value) => !value);
				}}
			>
				<span class="cursor-pointer">
					{#if $isShowMicrosoftTeams}
						<ToggleOn size={defaultIconSize} color="#245def" />
					{:else}
						<ToggleOff size={defaultIconSize} />
					{/if}
				</span>
				<span class="ml-2">MicrosoftTeams</span>
			</li>
			<li
				class="flex"
				on:click={() => {
					isShowGoogle.update((value) => !value);
				}}
			>
				<span class="cursor-pointer">
					{#if $isShowGoogle}
						<ToggleOn size={defaultIconSize} color="#245def" />
					{:else}
						<ToggleOff size={defaultIconSize} />
					{/if}
				</span>
				<span class="ml-2">Google</span>
			</li>
			<li
				class="flex"
				on:click={() => {
					isShowTwitter.update((value) => !value);
				}}
			>
				<span class="cursor-pointer">
					{#if $isShowTwitter}
						<ToggleOn size={defaultIconSize} color="#245def" />
					{:else}
						<ToggleOff size={defaultIconSize} />
					{/if}
				</span>
				<span class="ml-2">Twitter</span>
			</li>
			<li
				class="flex"
				on:click={() => {
					isShowSlack.update((value) => !value);
				}}
			>
				<span class="cursor-pointer">
					{#if $isShowSlack}
						<ToggleOn size={defaultIconSize} color="#245def" />
					{:else}
						<ToggleOff size={defaultIconSize} />
					{/if}
				</span>
				<span class="ml-2">Slack</span>
			</li>
			<li
				class="flex"
				on:click={() => {
					isShowTypeScript.update((value) => !value);
				}}
			>
				<span class="cursor-pointer">
					{#if $isShowTypeScript}
						<ToggleOn size={defaultIconSize} color="#245def" />
					{:else}
						<ToggleOff size={defaultIconSize} />
					{/if}
				</span>
				<span class="ml-2">TypeScript</span>
			</li>
			<li
				class="flex"
				on:click={() => {
					isShowStackOverflow.update((value) => !value);
				}}
			>
				<span class="cursor-pointer">
					{#if $isShowStackOverflow}
						<ToggleOn size={defaultIconSize} color="#245def" />
					{:else}
						<ToggleOff size={defaultIconSize} />
					{/if}
				</span>
				<span class="ml-2">StackOverflow</span>
			</li>
			<li
				class="flex"
				on:click={() => {
					isShowMedium.update((value) => !value);
				}}
			>
				<span class="cursor-pointer">
					{#if $isShowMedium}
						<ToggleOn size={defaultIconSize} color="#245def" />
					{:else}
						<ToggleOff size={defaultIconSize} />
					{/if}
				</span>
				<span class="ml-2">Medium</span>
			</li>
			<li
				class="flex"
				on:click={() => {
					isShowGmail.update((value) => !value);
				}}
			>
				<span class="cursor-pointer">
					{#if $isShowGmail}
						<ToggleOn size={defaultIconSize} color="#245def" />
					{:else}
						<ToggleOff size={defaultIconSize} />
					{/if}
				</span>
				<span class="ml-2">Gmail</span>
			</li>
			<li
				class="flex"
				on:click={() => {
					isShowKindle.update((value) => !value);
				}}
			>
				<span class="cursor-pointer">
					{#if $isShowKindle}
						<ToggleOn size={defaultIconSize} color="#245def" />
					{:else}
						<ToggleOff size={defaultIconSize} />
					{/if}
				</span>
				<span class="ml-2">Kindle</span>
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
