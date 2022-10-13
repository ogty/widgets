<script lang="ts">
	import Template from '@atoms/Template.svelte';
	import Calendar from '@icons/Calendar.svelte';
	import { dateFormatter } from '$lib/timeRelated';
</script>

<Template LeftIcon={Calendar}>
	<div style="padding-left: 12.2px; padding-right: 12.2px;">
		{dateFormatter(new Date())}
	</div>
</Template>
