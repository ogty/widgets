<script lang="ts">
	import Template from '@atoms/Template.svelte';
	import Calendar from '@icons/Calendar.svelte';
	import { dateFormatter } from '$lib/timeRelated';
</script>

<Template LeftIcon={Calendar}>
  {dateFormatter(new Date())}
</Template>
