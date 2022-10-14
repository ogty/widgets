  </div>
  <svelte:component this={$isShowMemo ? Memo : Nothing} />
  <svelte:component this={$isShowAudioPlayer ? AudioPlayer : Nothing} />
  <svelte:component this={$isShowTerminal ? Terminal : Nothing} />
  <svelte:component this={$isShowTodo ? Todo : Nothing} />
</div>
