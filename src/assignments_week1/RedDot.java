package assignments_week1;

import processing.core.PApplet;

public class RedDot extends PApplet {


    @Override
    public void settings() {
        size(400, 400);
    }

    @Override
    public void draw() {
        noStroke();
        fill(255, 0, 0);
        ellipse((float) Math.random() * 400, (float) Math.random() * 400, 16, 16);
    }

    /**
     * The entry point of application.
     *
     * @param args the input arguments
     */
    public static void main(String[] args) {
        String[] processingArgs = {"assignments_week1.RedDot"};
        RedDot gui = new RedDot();
        PApplet.runSketch(processingArgs, gui);
    }
}
