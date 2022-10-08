import { marked } from 'marked';

export function toHtml(content: string): string {
	return marked(content)
		.replace(/<h1/g, '<br><h1 class="text-2xl font-bold"')
		.replace(/<\/h1>/g, '</h1><br>')
		.replace(/<h2/g, '<br><h2 class="text-xl font-bold"')
		.replace(/<\/h2>/g, '</h2><br>')
		.replace(/<h3/g, '<br><h3 class="text-lg font-bold"')
		.replace(/<\/h3>/g, '</h3><br>')
		.replace(/<h4/g, '<br><h4 class="text-base font-bold"')
		.replace(/<\/h4>/g, '</h4><br>')
		.replace(/<h5/g, '<br><h5 class="text-sm font-bold"')
		.replace(/<\/h5>/g, '</h5><br>')
		.replace(/<h6/g, '<br><h6 class="text-xs font-bold"')
		.replace(/<\/h6>/g, '</h6><br>')
		.replace(/<p>/g, '<br><p class="text-sm">')
		.replace(/<\/p>/g, '</p><br>')
		.replace(/<ul>/g, '<br><ul class="list-disc list-inside">')
		.replace(/<\/ul>/g, '</ul><br>')
		.replace(/<ol>/g, '<ol class="list-decimal list-inside">')
		.replace(/<li>/g, '<li class="text-sm">')
		.replace(/<table>/g, '<table class="table-auto">')
		.replace(/<\/table>/g, '</table><br>')
		.replace(/<th>/g, '<th class="border border-slate-300 p-2">')
		.replace(/<td>/g, '<td class="border border-slate-300 p-2">')
		.replace(/<a/g, '<a class="text-blue-500" target="_blank" rel="noopener noreferrer"')
		.replace(/<img/g, '<img class="rounded-md"')
		.replace(/<blockquote>/g, '<blockquote class="border-l-4 border-slate-300 pl-2">')
		.replace(/<hr>/g, '<br><hr class="border border-slate-300"><br>')
		.replace(/<em>/g, '<em class="italic">')
		.replace(/<strong>/g, '<strong class="font-bold">')
		.replace(/<del>/g, '<del class="line-through">')
		.replace(
			/<pre><code>/g,
			'<br><div class="border border-slate-900 p-2 rounded-md"><pre><code class="text-slate-400">'
		)
		.replace(/<\/code><\/pre>/g, '</code></pre></div>');
}
