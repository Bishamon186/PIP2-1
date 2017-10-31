package mbeans;

import java.util.ArrayList;

public class Results implements ResultsMBean{
	private ArrayList<Double> x;
	private ArrayList<Double> y;
	private ArrayList<Double> r;
	private ArrayList<Boolean> strikes;
        private int pointer;
        public Results(){
            x = new ArrayList<>();
            y = new ArrayList<>();
            r = new ArrayList<>();
            strikes = new ArrayList<>();
            setPointerToSize();
        }
	public double getX() {
		pointer--;
		return x.get(pointer);
	}
	public double getY(){
		pointer--;
		return y.get(pointer);
	}
	public double getR(){
		pointer--;
		return r.get(pointer);
	}
	public boolean getStrike(){
		pointer--;
		return strikes.get(pointer);
	}
	public void setX (double x) {
		this.x.add(x);
		setPointerToSize();
	}
	public void setY (double y){
		this.y.add(y);
		setPointerToSize();
	}
	public void setR (double r){
		this.r.add(r);
		setPointerToSize();
	}
	public void setStrike (boolean strike){
		strikes.add(strike);
		setPointerToSize();
	}
	private void setPointerToSize() {
		pointer = x.size();
	}
	public int getSize() {
		return x.size();
	}
}
