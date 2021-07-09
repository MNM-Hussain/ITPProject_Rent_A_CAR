package service;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import util.DBConnectionUtil;

import Model.RepairAndMaintenance;
	
	
	
public class Statistics {


	
	
	
	

	//retreive the total expenses details
	public float[] get_RepairAndMaintenance()
	{
		float[] tot = new float[12];
		DBConnectionUtil dbConnectionUtil = new DBConnectionUtil();
		@SuppressWarnings("static-access")
		Connection connection=dbConnectionUtil.getDBConnection();
	
			PreparedStatement preparedstatement=null;
			PreparedStatement preparedstatement2=null;
			PreparedStatement preparedstatement3=null;
			PreparedStatement preparedstatement4=null;
			PreparedStatement preparedstatement5=null;
			PreparedStatement preparedstatement6=null;
			PreparedStatement preparedstatement7=null;
			PreparedStatement preparedstatement8=null;
			PreparedStatement preparedstatement9=null;
			PreparedStatement preparedstatement10=null;
			PreparedStatement preparedstatement11=null;
			PreparedStatement preparedstatement12=null;
				ResultSet resultset=null;
				ResultSet resultset2=null;
				ResultSet resultset3=null;
				ResultSet resultset4=null;
				ResultSet resultset5=null;
				ResultSet resultset6=null;
				ResultSet resultset7=null;
				ResultSet resultset8=null;
				ResultSet resultset9=null;
				ResultSet resultset10=null;
				ResultSet resultset11=null;
				ResultSet resultset12=null;
	
				RepairAndMaintenance repairandmaintenance = new RepairAndMaintenance();
	
	
	
	try {
		

		
	
		String sql="select  (VehicleID) from maintenance where Start_Date LIKE '01%'";
		String sql2="select  (VehicleID) from maintenance where Start_Date LIKE '02%'";
		String sql3="select  (VehicleID) from maintenance where Start_Date LIKE '03%'";
		String sql4="select  (VehicleID) from maintenance where Start_Date LIKE '04%'";
		String sql5="select  (VehicleID) from maintenance where Start_Date LIKE '05%'";
		String sql6="select  (VehicleID) from maintenance where Start_Date LIKE '06%'";
		String sql7="select (VehicleID) from maintenance where Start_Date LIKE '07%'";
		String sql8="select  (VehicleID) from maintenance where Start_Date LIKE '08%'";
		String sql9="select  (VehicleID) from maintenance where Start_Date LIKE '09%'";
		String sql10="select (VehicleID) from maintenance where Start_Date LIKE '10%'";
		String sql11="select  (VehicleID) from maintenance where Start_Date LIKE '11%'";
		String sql12="select (VehicleID) from maintenance where Start_Date LIKE '12%'";
		preparedstatement=connection.prepareStatement(sql);
		preparedstatement2=connection.prepareStatement(sql2);
		preparedstatement3=connection.prepareStatement(sql3);
		preparedstatement4=connection.prepareStatement(sql4);
		preparedstatement5=connection.prepareStatement(sql5);
		preparedstatement6=connection.prepareStatement(sql6);
		preparedstatement7=connection.prepareStatement(sql7);
		preparedstatement8=connection.prepareStatement(sql8);
		preparedstatement9=connection.prepareStatement(sql9);
		preparedstatement10=connection.prepareStatement(sql10);
		preparedstatement11=connection.prepareStatement(sql11);
		preparedstatement12=connection.prepareStatement(sql12);
		
		resultset=preparedstatement.executeQuery();
		resultset2=preparedstatement2.executeQuery();
		resultset3=preparedstatement3.executeQuery();
		resultset4=preparedstatement4.executeQuery();
		resultset5=preparedstatement5.executeQuery();
		resultset6=preparedstatement6.executeQuery();
		resultset7=preparedstatement7.executeQuery();
		resultset8=preparedstatement8.executeQuery();
		resultset9=preparedstatement9.executeQuery();
		resultset10=preparedstatement10.executeQuery();
		resultset11=preparedstatement11.executeQuery();
		resultset12=preparedstatement12.executeQuery();
		
	
		//tot[0]= resultset.getFloat("count(VehicleID)");
//	    tot[1]= resultset2.getFloat("count(VehicleID)");
//		tot[2]= resultset3.getFloat("count(VehicleID)");
//		tot[3]= resultset4.getFloat("count(VehicleID)");
//		tot[4]= resultset5.getFloat("count(VehicleID)");
//		tot[5]= resultset6.getFloat("count(VehicleID)");
//		tot[6]= resultset7.getFloat("count(VehicleID)");
//		tot[7]= resultset8.getFloat("count(VehicleID)");
//		tot[8]= resultset9.getFloat("VehicleID");
//		tot[9]= resultset10.getFloat("VehicleID");
//		tot[10]= resultset11.getFloat("VehicleID");
//	
//		tot[11]= resultset12.getFloat("count(VehicleID)");
	
		
		int jan = 0,feb =0,march =0,april=0,may=0,june=0,july=0,aug=0,sep=0,oct=0,nov=0,dec=0;
		
//for jan
		
		while(resultset.next())
		{
		 jan++;
						
		}
		
		tot[0] = jan;
		
	
//for feb
		
		while(resultset2.next())
		{
		 feb++;
						
		}
	tot[1] = feb;
		

//for march
	
	while(resultset3.next())
	{
		march++;
					
	}
tot[2] = march;


//for april

while(resultset4.next())
{
	april++;
				
}
tot[3] = april;



//for may

while(resultset5.next())
{
	may++;
				
}
tot[4] = may;



//for june

while(resultset6.next())
{
	june++;
				
}
tot[5] = june;



//for july

while(resultset7.next())
{
	july++;
				
}
tot[6] = july;



//for aug

while(resultset8.next())
{
	aug++;
				
}
tot[7] = aug;



//for sep

while(resultset9.next())
{
	sep++;
				
}
tot[8] = sep;



//for oct

while(resultset10.next())
{
	oct++;
				
}
tot[9] = oct;



//for nov

while(resultset11.next())
{
	nov++;
				
}
tot[10] = nov;



//for dec

while(resultset12.next())
{
	dec++;
				
}
tot[11] = dec;


	
	
	
	
	}catch(Exception e)
    	{
		System.out.println(e);
    	}
	
	return tot;
	

	
	
	}
	

}