export function sleep(waitSec: number, callbackFunc: () => void) {
	let spanedSec = 0;
	const id = setInterval(function () {
		spanedSec += 1;
		if (waitSec <= spanedSec) {
			clearInterval(id);
			if (callbackFunc) callbackFunc();
		}
	}, 1000);
}
