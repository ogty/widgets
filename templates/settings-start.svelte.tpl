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
