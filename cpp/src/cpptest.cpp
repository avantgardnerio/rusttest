#include <iostream>
using namespace std;

class Point {
public:
	double x, y;

	Point() { x = 0.0; y = 0.0; }

	Point ( const Point & ) = default;
};

class Game {
	public:
	Point position;

	void walk() { position.x += 1.0; }

	Point get_position() { return position; }

	Point& get_position_ref() { return position; }
};

int main () {
	Game game;

	game.walk();

	Point position = game.get_position();
	//Point& position = game.get_position_ref();

    game.walk();

    cout << position.x;

	return 0;
}
