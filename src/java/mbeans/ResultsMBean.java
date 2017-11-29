package mbeans;

import java.util.ArrayList;

public interface ResultsMBean {
	public ArrayList<Double> getX();
	public ArrayList<Double> getY();
	public ArrayList<Double> getR();
	public ArrayList<Boolean> getStrikes();
	public void setX (double x);
	public void setY (double y);
	public void setR (double r);
	public void setStrike (boolean strike);
}

