var dx = 0;
var dy = 0;
var flying = false;

function postCreate() {
	FlxG.camera.followLerp = 0.15;
	strumLines.members[2].characters[0].visible = false;
	strumLines.members[3].characters[0].visible = false;
	strumLines.members[0].characters[0].visible = false;
	strumLines.members[0].characters[1].visible = false;
	camHUD.alpha = 0;
}

function beatHit(curBeat) {
	if (curBeat == 12) FlxTween.tween(strumLines.members[2].characters[1], {y:strumLines.members[2].characters[1].y - 300}, 1.25, {ease:FlxEase.quintInOut});
	if (curBeat == 15) {
		strumLines.members[2].characters[1].visible = false;
		strumLines.members[0].characters[0].visible = true;
	}
	if (curBeat == 16) {
		dx = strumLines.members[0].characters[0].x;
		dy = strumLines.members[0].characters[0].y;
	}
	if (curBeat == 148) {
		//defaultCamZoom += 0.6;
		strumLines.members[0].characters[0].visible = false;
		strumLines.members[2].characters[0].visible = true;
		//strumLines.members[2].characters[0].animation.play('soulgrab', true);
	}
	if (curBeat == 179) {
		strumLines.members[2].characters[0].visible = false;
		strumLines.members[0].characters[1].visible = true;
	}
	if (curBeat == 180) flying = true;
	if (curBeat == 235) {
		strumLines.members[1].characters[0].visible = false;
		strumLines.members[3].characters[0].visible = true;
	}
	if (curBeat == 244) {
		strumLines.members[1].characters[0].visible = true;
		strumLines.members[3].characters[0].visible = false;
	}

}

function update() {
	if (flying) {
		strumLines.members[0].characters[1].x = dx + 110 * FlxMath.fastSin((inst.time / 1000) * (Conductor.bpm / 60));
		strumLines.members[0].characters[1].y = dy + 110 * FlxMath.fastSin((inst.time / 1000) * (Conductor.bpm / 60)) * FlxMath.fastCos((inst.time / 1000) * (Conductor.bpm / 60));
	}
	if (curBeat < 0) strumLines.members[0].characters[0].visible = false;
}

function hudOut() FlxTween.tween(camHUD, {alpha: 0}, 60 / Conductor.bpm * 2, {ease:FlxEase.quadOut});
function hudIn() FlxTween.tween(camHUD, {alpha: 1}, 60 / Conductor.bpm * 2, {ease:FlxEase.quadOut});