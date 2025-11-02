function create() {
	head.alpha = 0.0001;
}

function beatHit(curBeat) {
	if (curBeat == 179) {
		head.alpha = 1;
		head.animation.play('appear', true);
	}
	if (curBeat == 180) {
		head.alpha = 1;
		head.animation.play('idle', true);
	}
	if (curBeat % 2 == 0 && curBeat > 179 && curBeat < 228) {
		head.animation.play('idle', true);
	}
	if (curBeat == 228) {
		head.animation.play('chargeup', true);
	}
	if (curBeat > 228) {
		head.animation.play('charge', true);
	}
}