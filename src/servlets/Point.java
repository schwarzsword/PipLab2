package servlets;

public class Point {
    private double x;

    public double getX() {
        return x;
    }

    public void setX(double x) {
        this.x = x;
    }

    public double getY() {
        return y;
    }

    public void setY(double y) {
        this.y = y;
    }

    public double getR() {
        return r;
    }

    public void setR(double r) {
        this.r = r;
    }

    public String getIsInArea() {
        return isInArea;
    }

    public void setIsInArea() {
        if (
                (x < -3 || x > 5) || (y < -5 || y > 3) || (r < 1 || r > 4)
        ) {
            this.isInArea = "inv operands";
        } else {
            if ((x >= 0 && y >= 0 && x <= (r / 2) && y <= r) ||
                    (x <= 0 && y >= 0 && y <= (x - (r / 2))) ||
                    (x >= 0 && y <= 0 && (x * x + y * y) <= r * r)
            ) {
                this.isInArea = "true";
            } else this.isInArea = "false";
        }
    }

    private double y;
    private double r;
    private String isInArea;

    Point(double x, double y, double r) {
        this.x = x;
        this.y = y;
        this.r = r;
    }
}

