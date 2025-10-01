package com;

import com.ex.Ex1;
import com.ex.Ex2;
import com.ex.Ex3;
import com.ex.Ex4;
import com.ex.Ex5;

public class HRD_Book {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Ex1 ex1 = new Ex1(); 
		ex1.selectBook();
		
		Ex2 ex2 = new Ex2(); 
		ex2.selectReturn();
		
		Ex3 ex3 = new Ex3(); 
		ex3.selectRental();
		
		Ex4 ex4 = new Ex4(); 
		ex4.secRentalCount();
		
		Ex5 ex5 = new Ex5(); 
		ex5.secPrice();
	}

}
