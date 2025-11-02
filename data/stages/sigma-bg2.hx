function create() {
	trace(strumLines);
	baldi_bg.visible = strumLines.members[3].characters[0].visible = false;
}

function beatHit(curBeat) {
	if (curBeat == 260) {
		baldi_bg.visible = strumLines.members[3].characters[0].visible = true;
		strumLines.members[2].characters[0].visible = false;
	}
	if (curBeat == 140) FlxTween.tween(camGame, {angle:360*2}, (60/Conductor.bpm)*4, {ease:FlxEase.expoIn});
	if (curBeat == 424) camGame.visible = camHUD.visible = false;
	if (curBeat == 447) camGame.visible = true;
}