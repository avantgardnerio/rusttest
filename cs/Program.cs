using System;

namespace cstest
{
	class Point {
		public double x, y;

		public Point() {
			x = 0;
			y = 0;
		}
	}

	/*
	struct Point {
		public double x, y;
	}

	*/

	class Game
	{
		Point position;

		public Game() {
			position = new Point ();
		}

		public void walk() {
			position.x += 1.0;
		}

		public Point get_position() {
			return position;
		}

		public static void Main (string[] args)
		{
			var game = new Game();

			game.walk();

			var position = game.get_position();

			game.walk();

			Console.WriteLine (position.x);
		}
	}
}
