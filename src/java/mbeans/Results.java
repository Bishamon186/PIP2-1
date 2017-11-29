package mbeans;

import java.util.ArrayList;

public class Results implements ResultsMBean{
	private ArrayList<Double> x;
	private ArrayList<Double> y;
	private ArrayList<Double> r;
	private ArrayList<Boolean> strikes;
        public Results(){
            x = new ArrayList<Double>();
            y = new ArrayList<Double>();
            r = new ArrayList<Double>();
            strikes = new ArrayList<Boolean>();
        }
        @Override
	public ArrayList<Double> getX() {
            return x;
	}
        @Override
	public ArrayList<Double> getY(){
            return y;
	}
        @Override
	public ArrayList<Double> getR(){
		return r;
	}
        @Override
	public ArrayList<Boolean> getStrikes(){
		return strikes;
	}
        @Override
	public void setX (double x) {
		this.x.add(x);
	}
        @Override
	public void setY (double y){
		this.y.add(y);
	}
        @Override
	public void setR (double r){
		this.r.add(r);
	}
        @Override
	public void setStrike (boolean strike){
		strikes.add(strike);
	}
	
}
