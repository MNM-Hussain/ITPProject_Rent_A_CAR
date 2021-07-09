package Model;

public class IncomeStatement {

	private String date;

	private float Salary;
	private float maintance;
	private float electricity;
	private float rent_expenses;
	private float other_expenses;

	private float Rent_income;
	private float other_income;

	private float TOTAL_INCOME;
	private float TOTAL_Expense;

	private float profit_loss;
	private float budget;

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public float getSalary() {
		return Salary;
	}

	public void setSalary(float salary) {
		Salary = salary;
	}

	public float getMaintance() {
		return maintance;
	}

	public void setMaintance(float maintance) {
		this.maintance = maintance;
	}

	public float getElectricity() {
		return electricity;
	}

	public void setElectricity(float electricity) {
		this.electricity = electricity;
	}

	public float getRent_expenses() {
		return rent_expenses;
	}

	public void setRent_expenses(float rent_expenses) {
		this.rent_expenses = rent_expenses;
	}

	public float getOther_expenses() {
		return other_expenses;
	}

	public void setOther_expenses(float other_expenses) {
		this.other_expenses = other_expenses;
	}

	public float getRent_income() {
		return Rent_income;
	}

	public void setRent_income(float rent_income) {
		Rent_income = rent_income;
	}

	public float getOther_income() {
		return other_income;
	}

	public void setOther_income(float other_income) {
		this.other_income = other_income;
	}

	public float getTOTAL_INCOME() {
		return TOTAL_INCOME;
	}

	public void setTOTAL_INCOME(float tOTAL_INCOME) {
		TOTAL_INCOME = tOTAL_INCOME;
	}

	public float getTOTAL_Expense() {
		return TOTAL_Expense;
	}

	public void setTOTAL_Expense(float tOTAL_Expense) {
		TOTAL_Expense = tOTAL_Expense;
	}

	public float getProfit_loss() {
		return profit_loss;
	}

	public void setProfit_loss(float profit_loss) {
		this.profit_loss = profit_loss;
	}

	public float getBudget() {
		return budget;
	}

	public void setBudget(float budget) {
		this.budget = budget;
	}

}