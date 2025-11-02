import flixel.math.FlxRandom;
import flixel.math.FlxMath;

var shagX = 0;
var shagY = 0;
var ringX = 0;
var ringY = 0;
var flyTimer = 0;
var shakeAmt = 0;
var shakeMax = 5;
var poweringUp = false;

function create() {
	shagX = strumLines.members[0].characters[0].x;
	shagY = strumLines.members[0].characters[0].y;
	ringX = Ring2.x;
	ringY = Ring2.y;
}

function update(elapsed) {
	flyTimer += elapsed/2;
	strumLines.members[0].characters[0].x = shagX + FlxMath.fastSin(flyTimer) * 75;
	strumLines.members[0].characters[0].y = shagY + FlxMath.fastSin(flyTimer*2) * 75;
	Ring2.x = ringX + FlxMath.fastSin(flyTimer) * 75;
	Ring2.y = ringY + FlxMath.fastSin(flyTimer*2) * 75;
	
	if (poweringUp) if (shakeAmt < shakeMax) shakeAmt += elapsed / 2;
	if (!poweringUp) shakeAmt = FlxMath.lerp(shakeAmt, 0, 0.005);
	camGame.x = FlxG.random.float(-shakeAmt, shakeAmt);
	camGame.y = FlxG.random.float(-shakeAmt, shakeAmt);
	camGame.angle = FlxG.random.float(-shakeAmt / 5, shakeAmt / 5);
	camHUD.x = FlxG.random.float(-shakeAmt/2, shakeAmt/2);
	camHUD.y = FlxG.random.float(-shakeAmt/2, shakeAmt/2);
	camHUD.angle = FlxG.random.float(-shakeAmt / 10, shakeAmt / 10);
}

function beatHit() {
	if (curBeat == 336) poweringUp = true;
	if (curBeat == 464) poweringUp = false;
	if (curBeat == 488) camGame.visible = camHUD.visible = false;
}