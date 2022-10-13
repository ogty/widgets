const paddingZero = (num: number): string => {
	return String(num).padStart(2, '0');
};

export function timeFormatter(seconds: number): string {
	if (seconds > 3599) {
		const hours = Math.floor(seconds / 3600);
		const minutes = Math.floor(seconds / 60);
		const differenceSeconds = seconds - 60 * minutes;
		const differenceMinutes = minutes - 60 * hours;
		return `${paddingZero(hours)}h${paddingZero(differenceMinutes)}m${paddingZero(
			differenceSeconds
		)}s`;
	} else if (seconds > 59) {
		const minutes = Math.floor(seconds / 60);
		const differenceSeconds = seconds - 60 * minutes;
		return `${paddingZero(minutes)}min${paddingZero(differenceSeconds)}s`;
	} else {
		return `${paddingZero(seconds)}s`;
	}
}

export function dateFormatter(date: Date) {
	const year = date.getFullYear();
	const month = paddingZero(date.getMonth() + 1);
	const day = paddingZero(date.getDate());
	return `${year}/${month}/${day}`;
}
