package javatest;

public class Game {
	
	public class Point implements Cloneable {
		public double x, y;
		
		public Point() {}
		
		public Point(double x, double y) {
			this.x = x;
			this.y = y;
		}
		
		public Point clone() { return new Point(); }
	}
	
	Point position;
	
	public Game() { position = new Point();	}
	
	public void walk() { position.x += 1.0;	}
	
	public Point get_position() { return position; }
	
	public Point clone_position() { return position.clone(); }
	
	public static void main(String[] args) {
		Game game = new Game();
		
		Point position = game.clone_position();
		
		game.walk();
		
		System.out.println(position.x);
	}
}
