package servlets;

import java.util.ArrayList;

public class Points {

    {
        points = new ArrayList<Point>();
    }

    public Points() {
    }

    private ArrayList<Point> points;

    public void add(Point point) {
        points.add(point);
    }

    public ArrayList<Point> getPoints() {
        return points;
    }

    public void setResults(ArrayList<Point> points) {
        this.points = points;
    }

    public int size() {
        return points.size();
    }

    public Point getPoint(int i) {
        return points.get(i);
    }
}