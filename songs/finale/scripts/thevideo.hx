import hxvlc.openfl.Video;
import hxvlc.flixel.FlxVideo;
import hxvlc.flixel.FlxVideoSprite;

var curVideo:FlxVideoSprite = null;

var finalepart = false;

function create() {
        curVideo = new FlxVideoSprite(0, 0);
        var path = Paths.file("videos/kaisupercutscene.mp4");
	curVideo.load(Assets.getPath(path));
	curVideo.scale.set(1280/1920, 720/1080);
	curVideo.camera = camHUD;
	insert(0, curVideo);
	curVideo.updateHitbox();
	curVideo.screenCenter();
	curVideo.play();
	curVideo.bitmap.mute = true;
	curVideo.alpha = 0;
	curVideo.x = -315;
	curVideo.y = -175;
}

function beatHit() {
	if (curBeat == 244) {
		curVideo.play();
		curVideo.alpha = 1;
		curVideo.bitmap.time = 0;
	}
	if (curBeat < 244) curVideo.bitmap.time = 0;
}

function onSubstateOpen(event) {
	if (curVideo != null && paused) {
		curVideo.pause();
		lastTime = curVideo.bitmap.time;
	}
}

function onSubstateClose(event) {
	if (curVideo != null && paused) {
		curVideo.resume();
		curVideo.bitmap.time = lastTime;
	}
}