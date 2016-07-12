#[derive(Copy)]
#[derive(Clone)]
pub struct Point {
   x: f32,
   y: f32
}

impl Point {
    pub fn new() -> Point { Point { x: 0.0, y: 0.0 } }
}

pub struct Game { position: Point }

impl Game {
    pub fn new() -> Game { Game { position: { Point::new() } } }
    
    pub fn walk(&mut self) { self.position.x += 1.0; }
    
    // Only valid when copy trait is present
    pub fn get_position(&self) -> Point { return self.position; }
    
    // Always works
    pub fn clone_position(&self) -> Point { return self.position.clone(); }
    
    // Declaration always valid, invocations depend on borrow rules
    pub fn borrow_position(&self) -> &Point { return &self.position; }

    // Declaration always valid, invocations depend on borrow rules
    pub fn borrow_position_mut(&mut self) -> &mut Point { return &mut self.position; }
}

fn main() {
    let mut game = Game::new();

	game.walk();
    
    let position = game.borrow_position_mut();
 
	position.x += 1.0;

	println!("{}", position.x);
}
