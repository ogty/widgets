import { writable, readable, derived } from 'svelte/store';

export const time = readable(new Date(), function start(set) {
	const interval = setInterval(() => {
		set(new Date());
	}, 1000);

	return function stop() {
		clearInterval(interval);
	};
});

const start = new Date();
export const elapsed = derived(time, ($time) => Math.round((Number($time) - Number(start)) / 1000));

export const isSetTimer = writable(false);
export const timerSeconds = writable(0);
export const defaultIconSize = 20;

export const isShowDate = writable(true);
export const isShowTodo = writable(true);
export const isShowMemo = writable(true);
export const isShowTimer = writable(true);
export const isShowTerminal = writable(false);
export const isShowAudioPlayer = writable(true);
export const isShowGitHub = writable(true);
export const isShowYouTube = writable(true);
export const isShowSystemPreferences = writable(true);
export const isShowActivityMonitor = writable(true);
export const isShowMicrosoftTeams = writable(true);
export const isShowGoogle = writable(true);
export const isShowTwitter = writable(true);
export const isShowSlack = writable(true);
export const isShowTypeScript = writable(true);
export const isShowStackOverflow = writable(true);
