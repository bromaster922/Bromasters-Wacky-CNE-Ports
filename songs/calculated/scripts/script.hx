var baseY = 0;
var doStrumlineMove = true;
function create() {
	strumLines.members[2].characters[0].visible = false;
	strumLines.members[2].characters[1].visible = false;
	camGame.alpha = 0;
}

function postCreate() {
	for (strum in strumLines.members[2].members) strum.visible = false;
	baseY = strumLines.members[0].members[0].y;
	if (mania != 0) doStrumlineMove = false;
}

function beatHit() {
	if (curBeat >= 0) {
		camGame.alpha = 1;
	}
	if (curBeat == 170) {
		strumLines.members[2].characters[0].visible = true;
		if (doStrumlineMove) {
			for (strum in strumLines.members[2].members) {
				strum.y -= 300;
				strum.visible = true;
				FlxTween.tween(strum, {y: baseY}, 1, {ease:FlxEase.quadOut});
			}
			for (strum in strumLines.members[0].members) {
				FlxTween.tween(strum, {x: strum.x - 50}, 1, {ease:FlxEase.quadOut});
			}
			for (strum in strumLines.members[1].members) {
				FlxTween.tween(strum, {x: strum.x + 50}, 1, {ease:FlxEase.quadOut});
			}
		}
	}
	if (curBeat == 267) {
		strumLines.members[2].characters[0].visible = false;
		strumLines.members[2].characters[1].visible = true;
	}
	if (curBeat == 276) {
		camGame.visible = camHUD.visible = false;
	}
}