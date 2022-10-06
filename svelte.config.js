import adapter from '@sveltejs/adapter-static';
import preprocess from 'svelte-preprocess';

/** @type {import('@sveltejs/kit').Config} */
const config = {
	// Consult https://github.com/sveltejs/svelte-preprocess
	// for more information about preprocessors
	preprocess: [
		preprocess({
			postcss: true
		})
	],
	kit: {
		adapter: adapter({
			pages: 'build',
			assets: 'build',
			fallback: 'index.html'
		}),
		alias: {
			'@atoms': 'src/components/atoms',
			'@molecules': 'src/components/molecules',
			'@organisms': 'src/components/organisms',
			'@icons': 'src/components/icons',
			'@music': 'src/assets/music',
			'@data': 'src/assets/data',
			'@layouts': 'src/layouts'
		},
		files: {
			assets: 'static',
			lib: 'src/lib'
		}
	}
};

export default config;
