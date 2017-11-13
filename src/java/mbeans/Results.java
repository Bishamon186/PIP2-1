package mbeans;

import java.util.ArrayList;

public class Results implements ResultsMBean{
	private ArrayList<Double> x;
	private ArrayList<Double> y;
	private ArrayList<Double> r;
	private ArrayList<Boolean> strikes;
        public Results(){
            x = new ArrayList<>();
            y = new ArrayList<>();
            r = new ArrayList<>();
            strikes = new ArrayList<>();
        }
	public ArrayList<Double> getX() {
            return x;
	}
	public ArrayList<Double> getY(){
            return y;
	}
	public ArrayList<Double> getR(){
		return r;
	}
	public ArrayList<Boolean> getStrikes(){
		return strikes;
	}
	public void setX (double x) {
		this.x.add(x);
	}
	public void setY (double y){
		this.y.add(y);
	}
	public void setR (double r){
		this.r.add(r);
	}
	public void setStrike (boolean strike){
		strikes.add(strike);
	}
	
}
