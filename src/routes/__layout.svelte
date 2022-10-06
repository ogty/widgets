<script>
	import '../app.css';
</script>

<slot />

<style global>
	* {
		font-family: 'Menlo';
	}
	input,
	textarea {
		outline: none;
	}
	textarea {
		resize: none;
	}
</style>
