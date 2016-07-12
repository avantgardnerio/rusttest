"use strict";

class Point {
	constructor(x, y) {
		this.x = x || 0.0;
		this.y = y || 0.0;
	}
	
	clone() {
		return new Point(this.x, this.y);
	}
}

class Game {
	constructor() { this.position = new Point(); }
	
	walk() { this.position.x += 1.0; }
	
	get_position() { return this.position; }
	
	clone_position() { return this.position.clone(); }
}

let game = new Game();

game.walk();

let position = game.clone_position();

game.walk();

console.log(position.x);
