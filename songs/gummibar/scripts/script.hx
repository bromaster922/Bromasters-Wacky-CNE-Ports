var hueing = false;
var theHue = 0;
var coolColor = FlxColor;

var foundStrum = false;
function create() {
	var cameraBorder:FlxSprite = new FlxSprite(-660, -330).loadGraphic(Paths.image("stages/gummiVoid/cameraBorder"));
	cameraBorder.flipX = true;
	cameraBorder.cameras = [camHUD];
	cameraBorder.scale.set(0.6, 0.6);
	cameraBorder.y -= 3;
	insert(0, cameraBorder);
	trace(stage.getSprite("grad"));
	coolColor = FlxColor.fromRGB(200, 200, 200, 255);

	strumLines.members[0].characters[1].visible = false;
}

function coolioPart() {
	trace("coolio part!!!! it is now " + !hueing);
	if (hueing == false) { hueing = true; return;}
	if (hueing == true) { hueing = false; return;}
}

function update(elapsed) {
	if (hueing) {
		stage.getSprite("grad").alpha = 0.8;
		theHue += elapsed * 120;
		stage.getSprite("grad").color = FlxColor.fromHSL(200 + theHue, 2, 0.9, 1);
		boyfriend.color = FlxColor.fromHSL(200 + theHue, 2, 0.9, 1);
		gf.color = FlxColor.fromHSL(200 + theHue, 2, 0.9, 1);
		dad.color = FlxColor.fromHSL(200 + theHue, 2, 0.9, 1);
	} else {
		stage.getSprite("grad").alpha = 0.2;
		stage.getSprite("grad").color = FlxColor.fromHSL(0, 1, 1);
		boyfriend.color = FlxColor.fromHSL(0, 1, 1);
		gf.color = FlxColor.fromHSL(0, 1, 1);
		dad.color = FlxColor.fromHSL(0, 1, 1);
	}
}

function guitarPart() {
	strumLines.members[0].characters[0].visible = false;
	strumLines.members[0].characters[1].visible = true;
}

function nonGuitar() {
	strumLines.members[0].characters[1].visible = false;
	strumLines.members[0].characters[0].visible = true;
}