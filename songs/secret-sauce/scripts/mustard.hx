function create() {
	strumLines.members[2].characters[0].alpha = 0.0001;
}

function beatHit() {
	if (curBeat == 256) strumLines.members[2].characters[0].alpha = 1;
}