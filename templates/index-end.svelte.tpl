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
