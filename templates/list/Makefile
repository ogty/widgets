define template
  <li
    class="flex"
    on:click={() => {
      isShow$(name).update((value) => !value);
    }}
  >
    <span class="cursor-pointer">
      {#if $$isShow$(name)}
        <ToggleOn size={defaultIconSize} color="#245def" />
      {:else}
        <ToggleOff size={defaultIconSize} />
      {/if}
    </span>
  	<span class="ml-2">$(name)</span>
	</li>
endef
export template

name ?=

run:
	@echo "$$template"
