var tween:FlxTween = null;
function postCreate() {
	camGame.zoom = defaultCamZoom = 1;
}

function update(elapsed) {
	//camHUD.zoom += elapsed / 100;
	camHUD.zoom = (camGame.zoom - defaultCamZoom) * 2 + 1;
}

function beatHit(curBeat) {
	switch (curBeat) { //this was eons before the built in zooming functions
		case 0:
		trace("yeah");
		case 31 | 127 | 191:
		tween = FlxTween.tween(camGame, {zoom: 1.05}, (60/Conductor.bpm), {ease: FlxEase.quadIn});
		case 254 | 318:
		tween = FlxTween.tween(camGame, {zoom: 1.05}, (60/Conductor.bpm)*2, {ease: FlxEase.quadIn});
	}
}