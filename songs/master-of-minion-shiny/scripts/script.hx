function create() {
	strumLines.members[0].characters[1].visible = false;
	strumLines.members[1].characters[1].visible = false;
	strumLines.members[1].characters[2].visible = false;
}

function black() {
	camGame.visible = false;
	//camHUD.visible = false;
}

function unblack() {
	camGame.visible = true;
	//camHUD.visible = true;
}

function fadehud() FlxTween.tween(camHUD, {alpha: 0}, 60/Conductor.bpm, {ease:FlxEase.quadOut});

function unfade() FlxTween.tween(camHUD, {alpha: 1}, 60/Conductor.bpm, {ease:FlxEase.quadOut});

function part2() {
	strumLines.members[1].characters[0].visible = false;
	strumLines.members[1].characters[1].visible = true;
}

function part3() {
	strumLines.members[0].characters[0].visible = false;
	strumLines.members[0].characters[1].visible = true;
}

function part4() {
	strumLines.members[1].characters[1].visible = false;
	strumLines.members[1].characters[2].visible = true;
}