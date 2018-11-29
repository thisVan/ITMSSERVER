import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.junit.Test;
import org.south.itms.util.FileUtil;

public class TestUtil {
	
	@Test
	public void testFileUtil() {
		long start=System.currentTimeMillis();   //获取开始时间  
		FileUtil.getSize("D:/迅雷下载/[暴走大事件][第五季]第02集_bd.mp4");  //测试的代码段  
		long end=System.currentTimeMillis(); //获取结束时间  
		System.out.println("程序运行时间： "+(end-start)+"ms");
		
		long start1=System.currentTimeMillis();   //获取开始时间  
		//String s = FileUtil.getResolution("C:/Users/MrLiao/Desktop/南方/视频/1024 (5).mp4"); //测试的代码段  
		long end1=System.currentTimeMillis(); //获取结束时间  
		System.out.println("程序运行时间： "+(end1-start1)+"ms");
	}
	
	@Test
	public void testDate() throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = sdf.parse("2018-11-30");
		Date date1 = new Date(date.getTime() + 1000*3600*24);
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.add(Calendar.DAY_OF_MONTH, 1);
		Date date2 = c.getTime();
		System.out.println(date2);
				
		System.out.println(date +  " " + date1);
	}

}
