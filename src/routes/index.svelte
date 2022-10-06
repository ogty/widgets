<script lang="ts">
	import Todo from '@atoms/Todo.svelte';
	import Memo from '@atoms/Memo.svelte';
	import Date from '@molecules/Date.svelte';
	import Slack from '@atoms/Slack.svelte';
	import Timer from '@molecules/Timer.svelte';
	import Github from '@atoms/Github.svelte';
	import Google from '@atoms/Google.svelte';
	import Twitter from '@atoms/Twitter.svelte';
	import Youtube from '@atoms/Youtube.svelte';
	import Terminal from '@molecules/Terminal.svelte';
	import Incognito from '@atoms/Incognito.svelte';
	import AudioPlayer from '@molecules/AudioPlayer.svelte';
	import MicrosoftTeams from '@atoms/MicrosoftTeams.svelte';
	import ActivityMonitor from '@atoms/ActivityMonitor.svelte';
	import SystemPreferences from '@atoms/SystemPreferences.svelte';
</script>

<div class="p-2 flex flex-wrap gap-2">
	<div class="grid grid-flow-col gap-2">
		<SystemPreferences />
		<ActivityMonitor />
		<MicrosoftTeams />
		<Slack />
		<Incognito />
		<Google />
		<Youtube />
		<Twitter />
		<Github />
		<Timer />
		<Date />
	</div>
	<Memo />
	<AudioPlayer />
	<Terminal />
	<Todo />
</div>
