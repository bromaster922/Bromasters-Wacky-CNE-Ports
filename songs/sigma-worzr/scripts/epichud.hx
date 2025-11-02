function create() {
	var baldiWall1:FlxSprite = new FlxSprite(0,0).loadGraphic(Paths.image("stages/sigbaldi/baldi_wall1"));
	baldiWall1.camera = camHUD;
	insert(0, baldiWall1);

	var baldiWall2:FlxSprite = new FlxSprite(300,0).loadGraphic(Paths.image("stages/sigbaldi/baldi_wall2"));
	baldiWall2.camera = camHUD;
	insert(0, baldiWall2);

	camGame.alpha = camHUD.alpha = 0;
}

function beatHit() {
	if (curBeat > 0) camGame.alpha = camHUD.alpha = 1;
}