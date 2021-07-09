package service;

import java.util.ArrayList;

import Model.IncomeStatement;

public interface IIncomeStatementService {

	public ArrayList<IncomeStatement> get_IncomeStatement_details();

	public void Insert_IS_ForMonthEnded(IncomeStatement IS);

	public void removeIncomeStatement(String date);

	public void Insertexpense(String date);

	public void removeexpense(String date);

	public boolean checkDate(String date);

	public String CheckDay(String date);

	public String CheckMonth(String date);

}
