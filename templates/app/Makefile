define template
<script lang="ts">
  import $(icon) from '@icons/$(icon).svelte';
  import Template from '@atoms/Template.svelte';
  import { invoke } from '@tauri-apps/api/tauri';
  import { defaultIconSize } from '$$lib/stores';

  const open = () => {
    invoke('open_app', { name: '$(path)' });
  };
</script>

<Template>
  <div class="cursor-pointer" on:click={open}>
    <$(icon) size={defaultIconSize} />
  </div>
</Template>
endef
export template

path ?=
icon ?=

run:
	@echo "$$template"
