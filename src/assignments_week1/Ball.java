package assignments_week1;

import processing.core.PApplet;
import processing.core.PVector;

public class Ball extends PApplet {
    int radius = 25;
    PVector location;
    PVector velocity;

    Ball(int x, int y, int a, int b) {

        location = new PVector(x, y);
        velocity = new PVector(a, b);
    }

    public void display() {
        location.add(velocity);
        ellipse(location.x, location.y, radius * 2, radius * 2);

        if ((location.x > width - radius) || (location.x < radius)) {
            velocity.x = velocity.x * -1;
        }
        if ((location.y > height - radius) || (location.y < radius)) {
            velocity.y = velocity.y * -1;
        }
    }
}
