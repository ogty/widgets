<script lang="ts">
	import Trash from '@icons/Trash.svelte';
	import Square from '@icons/Square.svelte';
	import { flip } from 'svelte/animate';
	import Template from '@atoms/Template.svelte';
	import CheckSquare from '@icons/CheckSquare.svelte';
	import PencilSquare from '@icons/PencilSquare.svelte';
	import { quintOut } from 'svelte/easing';
	import { crossfade } from 'svelte/transition';
	import { defaultIconSize } from '$lib/stores';

	const iconSize = defaultIconSize - 2;

	const [send, receive] = crossfade({
		duration: (d) => Math.sqrt(d * 200),

		fallback(node, _params) {
			const style = getComputedStyle(node);
			const transform = style.transform === 'none' ? '' : style.transform;

			return {
				duration: 600,
				easing: quintOut,
				css: (t) => `
					transform: ${transform} scale(${t});
					opacity: ${t}
				`
			};
		}
	});

	let uid = 1;
	type Todo = {
		id: number;
		done: boolean;
		description: string;
	};
	let todos: Todo[] = [];

	function add(input: any) {
		const todo = {
			id: uid++,
			done: false,
			description: input.value
		};

		todos = [todo, ...todos];
		input.value = '';
	}

	function remove(todo: any) {
		todos = todos.filter((t) => t !== todo);
	}

	function mark(todo: any, done: any) {
		todo.done = done;
		remove(todo);
		todos = todos.concat(todo);
	}
</script>

<div class="w-full text-xs text-slate-300">
	<Template LeftIcon={PencilSquare} rounded={todos.length ? false : true} roundedTop={true}>
		<input
			class="bg-transparent w-full text-xs"
			on:keydown={(e) => e.key === 'Enter' && add(e.target)}
			spellcheck={false}
			placeholder=""
		/>
	</Template>
	{#if todos.length}
		<div class="flex p-2 border-x border-slate-500 border-b rounded-b-md">
			<div class="w-1/2 grid gap-2 pr-2">
				{#each todos.filter((t) => !t.done) as todo (todo.id)}
					<label
						class="flex w-full h-fit items-center"
						in:receive={{ key: todo.id }}
						out:send={{ key: todo.id }}
						animate:flip
					>
						<input type="hidden" disabled />
						<div
							class="cursor-pointer flex flex-1 items-center gap-1"
							on:click={() => mark(todo, true)}
						>
							<Square size={iconSize} />
							{todo.description}
						</div>
						<div class="cursor-pointer justify-end flex-row" on:click={() => remove(todo)}>
							<Trash size={iconSize} />
						</div>
					</label>
				{/each}
			</div>
			<div class="w-1/2 pl-2 grid gap-2 border-l border-dashed border-slate-500">
				{#each todos.filter((t) => t.done) as todo (todo.id)}
					<label
						class="done flex h-fit items-center"
						in:receive={{ key: todo.id }}
						out:send={{ key: todo.id }}
						animate:flip
					>
						<input type="hidden" disabled />
						<div
							class="cursor-pointer flex flex-1 items-center gap-1"
							on:click={() => mark(todo, false)}
						>
							<CheckSquare size={iconSize} />
							{todo.description}
						</div>
						<div class="cursor-pointer justify-end" on:click={() => remove(todo)}>
							<Trash size={iconSize} />
						</div>
					</label>
				{/each}
			</div>
		</div>
	{/if}
</div>
