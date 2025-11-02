var ntsc = new CustomShader('ntsc');
var timer = 0;
var camOther:FlxCamera;

var redBall:FlxSprite;

var cu:FlxSprite;

function postCreate() {
	camGame.addShader(ntsc);
	camHUD.addShader(ntsc);

	camOther = new FlxCamera(0, 0, FlxG.width, FlxG.height);
	camOther.bgColor = FlxColor.TRANSPARENT;
	FlxG.cameras.add(camOther, false);

	camOther.addShader(ntsc);

	var rec = new FlxSprite().loadGraphic(Paths.image("stages/cu/rec"));
	rec.cameras = [camOther];
	add(rec);
	redBall = new FlxSprite().loadGraphic(Paths.image("stages/cu/red_ball"));
	redBall.cameras = [camOther];
	redBall.x += 100;
	add(redBall);
	var day = new FlxSprite(1050, 670).loadGraphic(Paths.image("stages/cu/the_day"));
	day.cameras = [camOther];
	add(day);

	cu = new FlxSprite();
	cu.frames = Paths.getSparrowAtlas("stages/cu/cu");
	cu.animation.addByPrefix("cu", "cu", 24, false);
	cu.cameras = [camOther];
	cu.visible = false;
	add(cu);
	cu.screenCenter();

	camGame.visible = camHUD.visible = false;
	iconP2.visible = dad.visible = false;
}

function update(elapsed) {
	timer += elapsed * 60;
	iconP2.y = iconP1.y + Math.sin(timer/5) * 25;
	iconP1.angle = -timer;
}

function beatHit(curBeat) {
	if (curBeat % 2 == 0) redBall.visible = !redBall.visible;
	if (curBeat == 9) {
		cu.visible = true;
		cu.animation.play("cu");
	}
	if (curBeat == 16) {
		camGame.visible = camHUD.visible = true;
		cu.visible = false;
	}
	if (curBeat == 56) dad.visible = true;
	if (curBeat == 80) {
		iconP2.visible = true;
		camGame.followLerp = 0.2;
	}
}

function onDadHit() {
	if (health > 0.2) health -= 0.025;
}