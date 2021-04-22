    Ball ball1;
    Ball ball2;
    boolean Colliding = false;

    public void setup() {
        // intialize new balls of class Ball
        ball1 = new Ball(90, 90, 3, 4);
        ball2 = new Ball(50, 50, 2, 5);
        size(500, 500);
//        background(255);
    }

    public void draw() {
        background(255);
        fill(0);
        ball1.display();
        fill(255, 0, 0);
        ball2.display();
        collide();
    }

    public void collide() {
        if (!Colliding) { // only have a collision if the balls are not yet colliding
            if (dist(ball1.location.x, ball1.location.y, ball2.location.x, ball2.location.y) < (ball1.radius +ball2.radius)) { // check the distance between the balls
                // create factors and scalers, in order to find the final vector
                PVector center1 = new PVector(ball2.location.x - ball1.location.x, ball2.location.y - ball1.location.y);
                PVector center2 = new PVector(ball1.location.x - ball2.location.x, ball1.location.y - ball2.location.y);
                PVector d1 = ball1.velocity;
                PVector d2 = ball2.velocity;
                PVector n1 = center1.div(center1.mag());
                PVector n2 = center2.div(center2.mag());
                float s1 = d1.dot(n1);
                float s2 = d2.dot(n2);
                PVector a1 = n1.mult(s1);
                PVector a2 = n2.mult(s2);

                // change the velocity vector to display the colliding effect
                ball1.velocity = d1.sub(a1).normalize().mult(8);
                ball2.velocity = d2.sub(a2).normalize().mult(8);
                Colliding = true;
            }
        } else if (dist(ball1.location.x, ball1.location.y, ball2.location.x, ball2.location.y) > (ball1.radius +ball2.radius)) {
            Colliding = false;
        }
    }
