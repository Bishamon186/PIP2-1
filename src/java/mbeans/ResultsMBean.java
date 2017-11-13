package mbeans;

import java.util.ArrayList;

public interface ResultsMBean {
	public ArrayList getX();
	public ArrayList getY();
	public ArrayList getR();
	public ArrayList getStrikes();
	public void setX (double x);
	public void setY (double y);
	public void setR (double r);
	public void setStrike (boolean strike);
}

